import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:focusmint/constants/app_colors.dart';
import 'package:focusmint/models/custom_image_models.dart';
import 'package:focusmint/repositories/custom_image_repository.dart';
import 'package:focusmint/l10n/app_localizations.dart';
import 'package:logger/logger.dart';

class CustomAlbumPickerPage extends StatefulWidget {
  final int groupId;
  final WeatherType weather;
  final void Function(int)? onImageCountChanged;

  const CustomAlbumPickerPage({
    super.key,
    required this.groupId,
    required this.weather,
    this.onImageCountChanged,
  });

  @override
  State<CustomAlbumPickerPage> createState() => _CustomAlbumPickerPageState();
}

class _CustomAlbumPickerPageState extends State<CustomAlbumPickerPage> {
  static final Logger _logger = Logger();
  final CustomImageRepository _repository = CustomImageRepository.instance;
  final ImagePicker _picker = ImagePicker();

  List<String> _imagePaths = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadImages();
  }

  Future<void> _loadImages() async {
    try {
      final imagePaths = await _repository.getImagePaths(widget.groupId, widget.weather);
      setState(() {
        _imagePaths = imagePaths;
        _isLoading = false;
      });
    } catch (e, stackTrace) {
      _logger.e('画像の読み込みに失敗しました',
          error: e, stackTrace: stackTrace);
      setState(() {
        _isLoading = false;
      });
      _showErrorMessage(AppLocalizations.of(context)!.settingsLoadFailed);
    }
  }

  Future<void> _addImages() async {
    try {
      final List<XFile> images = await _picker.pickMultipleMedia(
        imageQuality: 80,
      );

      if (images.isEmpty) return;

      setState(() {
        _isLoading = true;
      });

      bool hasSuccessful = false;
      int successCount = 0;

      for (final image in images) {
        try {
          final imagePath = await _repository.addImage(
            widget.groupId,
            widget.weather,
            image.path,
          );

          setState(() {
            _imagePaths.add(imagePath);
          });

          // 親画面にリアルタイムで画像枚数の変更を通知
          widget.onImageCountChanged?.call(_imagePaths.length);

          hasSuccessful = true;
          successCount++;
        } catch (e, stackTrace) {
          _logger.e('画像の追加に失敗しました: ${image.path}',
              error: e, stackTrace: stackTrace);
        }
      }

      if (hasSuccessful) {
        _showSuccessMessage(AppLocalizations.of(context)!.imagesAdded(successCount));
      } else {
        _showErrorMessage(AppLocalizations.of(context)!.imageAddFailed);
      }

      setState(() {
        _isLoading = false;
      });
    } catch (e, stackTrace) {
      _logger.e('画像選択でエラーが発生しました',
          error: e, stackTrace: stackTrace);
      setState(() {
        _isLoading = false;
      });
      _showErrorMessage(AppLocalizations.of(context)!.imageSelectionFailed);
    }
  }

  Future<void> _removeImage(String imagePath) async {
    try {
      await _repository.removeImage(widget.groupId, widget.weather, imagePath);

      setState(() {
        _imagePaths.remove(imagePath);
      });

      // 親画面にリアルタイムで画像枚数の変更を通知
      widget.onImageCountChanged?.call(_imagePaths.length);

      _showSuccessMessage(AppLocalizations.of(context)!.imageDeleted);
    } catch (e, stackTrace) {
      _logger.e('画像の削除に失敗しました',
          error: e, stackTrace: stackTrace);
      _showErrorMessage(AppLocalizations.of(context)!.imageDeleteFailed);
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

  void _showSuccessMessage(String message) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: AppColors.mintGreen,
        ),
      );
    }
  }

  String get _weatherDisplayName {
    return widget.weather == WeatherType.sunny
        ? AppLocalizations.of(context)!.sunnyWeather
        : AppLocalizations.of(context)!.rainyWeather;
  }

  IconData get _weatherIcon {
    return widget.weather == WeatherType.sunny
        ? Icons.wb_sunny
        : Icons.water_drop;
  }

  Color get _weatherColor {
    return widget.weather == WeatherType.sunny
        ? Colors.orange
        : Colors.blue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: Row(
          children: [
            Icon(_weatherIcon, color: _weatherColor, size: 20),
            const SizedBox(width: 8),
            Text(AppLocalizations.of(context)!.groupImageTitle(widget.groupId, _weatherDisplayName)),
          ],
        ),
        backgroundColor: AppColors.mintGreen,
        elevation: 0,
        actions: [
          if (!_isLoading)
            IconButton(
              icon: const Icon(Icons.add_photo_alternate),
              onPressed: _addImages,
              tooltip: AppLocalizations.of(context)!.addImages,
            ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                // ヘッダー情報
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.mintGreen.withValues(alpha: 0.1),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(_weatherIcon, color: _weatherColor, size: 24),
                          const SizedBox(width: 8),
                          Text(
                            AppLocalizations.of(context)!.groupImageTitle(widget.groupId, _weatherDisplayName),
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textPrimary,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        AppLocalizations.of(context)!.registeredCount(_imagePaths.length),
                        style: const TextStyle(
                          fontSize: 14,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),

                // 画像グリッド
                Expanded(
                  child: _imagePaths.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.photo_library_outlined,
                                size: 64,
                                color: AppColors.textSecondary,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                AppLocalizations.of(context)!.noImagesRegistered,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: AppColors.textSecondary,
                                ),
                              ),
                              const SizedBox(height: 8),
                              ElevatedButton.icon(
                                onPressed: _addImages,
                                icon: const Icon(Icons.add_photo_alternate),
                                label: Text(AppLocalizations.of(context)!.addImages),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.mintGreen,
                                  foregroundColor: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(16),
                          child: GridView.builder(
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8,
                              childAspectRatio: 1,
                            ),
                            itemCount: _imagePaths.length,
                            itemBuilder: (context, index) {
                              final imagePath = _imagePaths[index];
                              return _buildImageTile(imagePath);
                            },
                          ),
                        ),
                ),
              ],
            ),
      floatingActionButton: _imagePaths.isNotEmpty && !_isLoading
          ? FloatingActionButton(
              onPressed: _addImages,
              backgroundColor: AppColors.mintGreen,
              child: const Icon(Icons.add, color: Colors.white),
            )
          : null,
    );
  }

  Widget _buildImageTile(String imagePath) {
    return GestureDetector(
      onTap: () => _showImageDetail(imagePath),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: AppColors.textDisabled,
            width: 1,
          ),
        ),
        child: Stack(
          children: [
            // 画像表示
            ClipRRect(
              borderRadius: BorderRadius.circular(7),
              child: Image.file(
                File(imagePath),
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: AppColors.textDisabled.withValues(alpha: 0.3),
                    child: const Center(
                      child: Icon(
                        Icons.image_not_supported,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  );
                },
              ),
            ),
            // 削除ボタン
            Positioned(
              top: 4,
              right: 4,
              child: GestureDetector(
                onTap: () => _removeImage(imagePath),
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showImageDetail(String imagePath) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppBar(
              title: Text(AppLocalizations.of(context)!.imagePreview),
              backgroundColor: AppColors.mintGreen,
              automaticallyImplyLeading: false,
              actions: [
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            Flexible(
              child: InteractiveViewer(
                child: Image.file(
                  File(imagePath),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton.icon(
                    onPressed: () {
                      Navigator.of(context).pop();
                      _removeImage(imagePath);
                    },
                    icon: const Icon(Icons.delete, color: Colors.red),
                    label: Text(
                      AppLocalizations.of(context)!.delete,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.mintGreen,
                    ),
                    child: Text(
                      AppLocalizations.of(context)!.close,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // アルバムピッカーページから戻る際に変更があったことを親に通知
    Navigator.of(context).pop(true);
    super.dispose();
  }
}