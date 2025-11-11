import 'package:flutter/material.dart';
import 'package:focusmint/constants/app_colors.dart';
import 'package:focusmint/models/custom_image_models.dart';
import 'package:focusmint/repositories/custom_image_repository.dart';
import 'package:focusmint/l10n/app_localizations.dart';
import 'package:logger/logger.dart';
import 'custom_album_picker_page.dart';

class CustomizeSettingsPage extends StatefulWidget {
  const CustomizeSettingsPage({super.key});

  @override
  State<CustomizeSettingsPage> createState() => _CustomizeSettingsPageState();
}

class _CustomizeSettingsPageState extends State<CustomizeSettingsPage> {
  static final Logger _logger = Logger();
  final CustomImageRepository _repository = CustomImageRepository.instance;

  CustomImageSettings? _settings;
  bool _isLoading = true;

  // 画像枚数のキャッシュ - パフォーマンス向上のため
  final Map<String, int> _imageCountCache = {};

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    try {
      final settings = await _repository.getSettings();

      // 全グループの画像枚数を一括取得してキャッシュ
      await _loadAllImageCounts(settings.groups);

      setState(() {
        _settings = settings;
        _isLoading = false;
      });
    } catch (e, stackTrace) {
      _logger.e('カスタマイズ設定の読み込みに失敗しました',
          error: e, stackTrace: stackTrace);
      setState(() {
        _isLoading = false;
      });
      _showErrorMessage(AppLocalizations.of(context)!.settingsLoadFailed);
    }
  }

  /// 全グループの画像枚数を一括読み込みしてキャッシュ
  Future<void> _loadAllImageCounts(List<CustomImageGroup> groups) async {
    final futures = <Future<void>>[];

    for (final group in groups) {
      // 良い画像の枚数
      futures.add(_loadImageCount(group.id, WeatherType.sunny));
      // よくない画像の枚数
      futures.add(_loadImageCount(group.id, WeatherType.rainy));
    }

    await Future.wait(futures);
    _logger.d('全画像枚数の読み込みが完了しました');
  }

  /// 特定のグループ・天気の画像枚数を取得してキャッシュ
  Future<void> _loadImageCount(int groupId, WeatherType weather) async {
    try {
      final count = await _repository.getImageCount(groupId, weather);
      final key = '${groupId}_${weather.value}';
      _imageCountCache[key] = count;
    } catch (e) {
      _logger.e('画像枚数の取得に失敗しました: グループ$groupId/${weather.value}', error: e);
      final key = '${groupId}_${weather.value}';
      _imageCountCache[key] = 0;
    }
  }

  Future<void> _toggleUseCustomImages(bool value) async {
    if (_settings == null) return;

    try {
      final success = await _repository.toggleUseCustomImages();
      if (success) {
        setState(() {
          _settings = _settings!.copyWith(useCustomImages: value);
        });
      } else {
        // 条件を満たしていない場合のエラーメッセージ
        _showErrorMessage(AppLocalizations.of(context)!.customImageRequirementNotMet);
      }
    } catch (e, stackTrace) {
      _logger.e('カスタム画像使用設定の変更に失敗しました',
          error: e, stackTrace: stackTrace);
      _showErrorMessage(AppLocalizations.of(context)!.settingsChangeFailed);
    }
  }

  Future<void> _toggleMixWithOriginalImages(bool value) async {
    if (_settings == null) return;

    try {
      final success = await _repository.toggleMixWithOriginalImages();
      if (success) {
        setState(() {
          _settings = _settings!.copyWith(mixWithOriginalImages: value);
        });
      } else {
        // 条件を満たしていない場合のエラーメッセージ
        _showErrorMessage(AppLocalizations.of(context)!.customImageRequirementNotMet);
      }
    } catch (e, stackTrace) {
      _logger.e('ミックス使用設定の変更に失敗しました',
          error: e, stackTrace: stackTrace);
      _showErrorMessage(AppLocalizations.of(context)!.settingsChangeFailed);
    }
  }


  Future<void> _toggleGroupEnabled(int groupId, bool value) async {
    if (_settings == null) return;

    try {
      final success = await _repository.toggleGroupEnabled(groupId);
      if (success) {
        final group = _settings!.getGroup(groupId);
        if (group != null) {
          final updatedGroup = group.copyWith(enabled: value);
          setState(() {
            _settings = _settings!.updateGroup(updatedGroup);
          });
        }
      } else {
        // 最後の有効グループを無効にしようとした場合
        _showErrorMessage(AppLocalizations.of(context)!.minOneGroupRequired);
      }
    } catch (e, stackTrace) {
      _logger.e('グループ有効設定の変更に失敗しました',
          error: e, stackTrace: stackTrace);
      _showErrorMessage(AppLocalizations.of(context)!.settingsChangeFailed);
    }
  }

  Future<void> _openAlbumPicker(int groupId, WeatherType weather) async {
    final result = await Navigator.of(context).push<bool>(
      MaterialPageRoute(
        builder: (context) => CustomAlbumPickerPage(
          groupId: groupId,
          weather: weather,
          onImageCountChanged: (int newCount) {
            // 画像枚数が変更された時にリアルタイムでキャッシュを更新
            final key = '${groupId}_${weather.value}';
            setState(() {
              _imageCountCache[key] = newCount;
            });

            // カスタム画像の条件チェックを即座に実行
            _checkAndUpdateCustomImagesAvailability();
          },
        ),
      ),
    );

    // アルバムピッカーから戻った場合は設定と該当する画像枚数のみを更新
    if (result == true) {
      try {
        final settings = await _repository.getSettings();

        // 変更されたグループ・天気の画像枚数のみを更新
        await _loadImageCount(groupId, weather);

        setState(() {
          _settings = settings;
        });

        // カスタム画像の条件チェックを再実行してUIを即座に更新
        _checkAndUpdateCustomImagesAvailability();
      } catch (e, stackTrace) {
        _logger.e('アルバムピッカー後の設定更新に失敗しました',
            error: e, stackTrace: stackTrace);
        _showErrorMessage(AppLocalizations.of(context)!.settingsLoadFailed);
      }
    }
  }

  /// カスタム画像の利用可能性をチェックして、必要に応じてUIを更新
  Future<void> _checkAndUpdateCustomImagesAvailability() async {
    if (_settings == null) return;

    try {
      final settings = await _repository.getSettings();

      // 条件を満たしているかチェック
      final canUse = settings.canUseCustomImages;

      // 現在のUIの状態と実際の条件が異なる場合のみ更新
      if (canUse != _canEnableCustomImages) {
        setState(() {
          _settings = settings;
        });
        _logger.d('_checkAndUpdateCustomImagesAvailability: UI updated, canUseCustomImages: $canUse');
      }
    } catch (e, stackTrace) {
      _logger.e('カスタム画像の利用可能性チェックに失敗しました',
          error: e, stackTrace: stackTrace);
    }
  }

  void _showErrorMessage(String message) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  /// キャッシュから画像枚数を取得（高速化のため）
  int _getImageCount(int groupId, WeatherType weather) {
    final key = '${groupId}_${weather.value}';
    return _imageCountCache[key] ?? 0;
  }

  /// スイッチを有効にするかどうかチェック
  bool get _canEnableCustomImages {
    return _settings?.canUseCustomImages ?? false;
  }

  /// 条件を満たしていない場合の説明メッセージを取得
  String get _requirementMessage {
    return AppLocalizations.of(context)!.customImageRequirement;
  }

  Widget _buildGroupSection(CustomImageGroup group) {
    return Card(
      elevation: 1,
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.groupTitle(group.id.toString()),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                // 良い画像ボタン
                Expanded(
                  child: _buildWeatherButton(
                    weather: WeatherType.sunny,
                    count: _getImageCount(group.id, WeatherType.sunny),
                    icon: Icons.wb_sunny,
                    onTap: () => _openAlbumPicker(group.id, WeatherType.sunny),
                  ),
                ),
                const SizedBox(width: 12),
                // よくない画像ボタン
                Expanded(
                  child: _buildWeatherButton(
                    weather: WeatherType.rainy,
                    count: _getImageCount(group.id, WeatherType.rainy),
                    icon: Icons.water_drop,
                    onTap: () => _openAlbumPicker(group.id, WeatherType.rainy),
                  ),
                ),
                const SizedBox(width: 16),
                // グループスイッチ
                Column(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.displayToggle,
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    const SizedBox(height: 4),
                     Switch(
                       value: group.enabled,
                       onChanged: (value) => _toggleGroupEnabled(group.id, value),
                       activeColor: Colors.white,
                       activeTrackColor: AppColors.mintGreen,
                       inactiveThumbColor: Colors.grey[600],
                       inactiveTrackColor: Colors.grey[300],
                       materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                     ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWeatherButton({
    required WeatherType weather,
    required int count,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.textDisabled),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context)!.imageCount(count),
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            SizedBox(width: 8),
            Icon(
              icon,
              size: 20,
              color: weather == WeatherType.sunny
                  ? Colors.orange
                  : Colors.blue,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNoticeSection() {
    return Card(
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.info_outline,
                  color: AppColors.textSecondary,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  AppLocalizations.of(context)!.noticeTitle,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '・${AppLocalizations.of(context)!.customImageNotice1}',
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.textSecondary,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '・${AppLocalizations.of(context)!.customImageNotice2}',
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.textSecondary,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '・${AppLocalizations.of(context)!.customImageNotice3}',
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.textSecondary,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '・${AppLocalizations.of(context)!.customImageNotice4}',
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.textSecondary,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '・${AppLocalizations.of(context)!.customImageNotice5}',
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.textSecondary,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.customImageSettings),
        backgroundColor: AppColors.mintGreen,
        elevation: 0,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _settings == null
              ? Center(
                  child: Text(
                    AppLocalizations.of(context)!.settingsLoadFailedMessage,
                    style: const TextStyle(color: Colors.red),
                  ),
                )
              : Scrollbar(
                  thumbVisibility: true,
                  thickness: 12,
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      // 全体スイッチセクション
                      Card(
                        elevation: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              // カスタム画像スイッチ
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          AppLocalizations.of(context)!.useCustomImages,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.textPrimary,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          AppLocalizations.of(context)!.useCustomImagesDescription,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            color: AppColors.textSecondary,
                                            height: 1.4,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                   Switch(
                                     value: _settings!.useCustomImages,
                                     onChanged: _canEnableCustomImages || _settings!.useCustomImages
                                         ? _toggleUseCustomImages
                                         : null,
                                     activeColor: Colors.white,
                                     activeTrackColor: AppColors.mintGreen,
                                     inactiveThumbColor: Colors.grey[600],
                                     inactiveTrackColor: Colors.grey[300],
                                     materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                   ),
                                ],
                              ),

                              // ミックス使用スイッチ
                              if (_settings!.useCustomImages) ...[
                                const SizedBox(height: 20),
                                const Divider(height: 1),
                                const SizedBox(height: 20),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '既存の画像とミックス使用',
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.textPrimary,
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            '既存の画像と自分の画像を混ぜて使用します',
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: AppColors.textSecondary,
                                              height: 1.4,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                     Switch(
                                       value: _settings!.mixWithOriginalImages,
                                       onChanged: _canEnableCustomImages || _settings!.mixWithOriginalImages
                                           ? _toggleMixWithOriginalImages
                                           : null,
                                       activeColor: Colors.white,
                                       activeTrackColor: AppColors.mintGreen,
                                       inactiveThumbColor: Colors.grey[600],
                                       inactiveTrackColor: Colors.grey[300],
                                       materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                     ),
                                  ],
                                ),
                              ],

                              // 条件を満たしていない場合の警告メッセージ
                              if (!_canEnableCustomImages && !_settings!.useCustomImages) ...[
                                const SizedBox(height: 12),
                                Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: Colors.orange.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(color: Colors.orange.withOpacity(0.3)),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.warning_amber_rounded,
                                        color: Colors.orange,
                                        size: 20,
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: Text(
                                          _requirementMessage,
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.orange.shade700,
                                            height: 1.3,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),

                      // グループ別設定セクション
                      Text(
                        AppLocalizations.of(context)!.groupSettings,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 16),

                      // 各グループのセクション
                      ..._settings!.groups.map((group) => _buildGroupSection(group)),

                      const SizedBox(height: 24),

                      // 注意事項セクション
                      _buildNoticeSection(),

                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),
    );
  }
}