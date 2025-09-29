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

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    try {
      final settings = await _repository.getSettings();
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

  Future<void> _toggleUseCustomImages(bool value) async {
    if (_settings == null) return;

    try {
      await _repository.toggleUseCustomImages();
      setState(() {
        _settings = _settings!.copyWith(useCustomImages: value);
      });
    } catch (e, stackTrace) {
      _logger.e('カスタム画像使用設定の変更に失敗しました',
          error: e, stackTrace: stackTrace);
      _showErrorMessage(AppLocalizations.of(context)!.settingsChangeFailed);
    }
  }

  Future<void> _toggleGroupEnabled(int groupId, bool value) async {
    if (_settings == null) return;

    try {
      await _repository.toggleGroupEnabled(groupId);
      final group = _settings!.getGroup(groupId);
      if (group != null) {
        final updatedGroup = group.copyWith(enabled: value);
        setState(() {
          _settings = _settings!.updateGroup(updatedGroup);
        });
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
        ),
      ),
    );

    // アルバムピッカーから戻った場合は設定を再読み込み
    if (result == true) {
      await _loadSettings();
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

  Future<int> _getImageCount(int groupId, WeatherType weather) async {
    return await _repository.getImageCount(groupId, weather);
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
                // 晴れ画像ボタン
                Expanded(
                  child: FutureBuilder<int>(
                    future: _getImageCount(group.id, WeatherType.sunny),
                    builder: (context, snapshot) {
                      final count = snapshot.data ?? 0;
                      return _buildWeatherButton(
                        weather: WeatherType.sunny,
                        count: count,
                        icon: Icons.wb_sunny,
                        onTap: () => _openAlbumPicker(group.id, WeatherType.sunny),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 12),
                // 雨画像ボタン
                Expanded(
                  child: FutureBuilder<int>(
                    future: _getImageCount(group.id, WeatherType.rainy),
                    builder: (context, snapshot) {
                      final count = snapshot.data ?? 0;
                      return _buildWeatherButton(
                        weather: WeatherType.rainy,
                        count: count,
                        icon: Icons.water_drop,
                        onTap: () => _openAlbumPicker(group.id, WeatherType.rainy),
                      );
                    },
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
                      activeTrackColor: AppColors.mintGreen,
                      activeThumbColor: AppColors.mintGreen,
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
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '・各グループでオンの場合はそのグループごとにランダムで表示される。',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.textSecondary,
                    height: 1.5,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  '・ユーザーがアップロードしてセットした画像は開発者や第三者に共有されず、端末のアプリ領域にのみ保存される。',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.textSecondary,
                    height: 1.5,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  '・そのためオフラインでも使えます。',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.textSecondary,
                    height: 1.5,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  '・カスタマイズされた画像については責任は持てません。登録しすぎると端末の負荷が高まり、不具合や動作不良が発生する可能性があります。通常に動かなくなる場合はアンインストールしてください。',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.textSecondary,
                    height: 1.5,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  '・アプリを消すと、セットされた画像は消去されます。',
                  style: TextStyle(
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
              ? const Center(
                  child: Text(
                    '設定の読み込みに失敗しました',
                    style: TextStyle(color: Colors.red),
                  ),
                )
              : Scrollbar(
                  thumbVisibility: true,
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
                          child: Row(
                            children: [
                              const Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '自分のカスタム画像を使う',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.textPrimary,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      'ONにすると既存の画像は使用されず、カスタム画像のみが学習・表示に使われます',
                                      style: TextStyle(
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
                                onChanged: _toggleUseCustomImages,
                                activeTrackColor: AppColors.mintGreen,
                                activeThumbColor: AppColors.mintGreen,
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),

                      // グループ別設定セクション
                      const Text(
                        'グループ別設定',
                        style: TextStyle(
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