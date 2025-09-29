import 'package:flutter/material.dart';
import 'package:focusmint/constants/app_colors.dart';
import 'package:focusmint/constants/placeholder_images.dart';
import 'package:focusmint/services/hidden_image_service.dart';
import 'package:focusmint/services/image_service.dart';
import 'package:focusmint/l10n/app_localizations.dart';
import 'package:logger/logger.dart';

/// 画像管理用のウィジェット
class ImageManagementWidget extends StatefulWidget {
  const ImageManagementWidget({super.key});

  @override
  State<ImageManagementWidget> createState() => _ImageManagementWidgetState();
}

class _ImageManagementWidgetState extends State<ImageManagementWidget> {
  final Logger _logger = Logger();
  final HiddenImageService _hiddenImageService = HiddenImageService();
  final ImageService _imageService = ImageService();
  Set<String> _hiddenImages = {};
  final Set<String> _pendingChanges = {}; // 未保存の変更を追跡
  bool _isLoading = true;
  String _selectedCategory = 'all';
  
  final Map<String, List<String>> _imageCategories = {
    'all': [...PlaceholderImages.positiveImages, ...PlaceholderImages.negativeImages].map((img) => 'assets/images/$img').toList(),
    'positive': PlaceholderImages.positiveImages.map((img) => 'assets/images/$img').toList(),
    'negative': PlaceholderImages.negativeImages.map((img) => 'assets/images/$img').toList(),
    'smile': PlaceholderImages.positiveImages.where((img) => img.contains('smile')).map((img) => 'assets/images/$img').toList(),
    'vegetables': PlaceholderImages.positiveImages.where((img) => img.contains('vegetables')).map((img) => 'assets/images/$img').toList(),
    'health': PlaceholderImages.positiveImages.where((img) => img.contains('health')).map((img) => 'assets/images/$img').toList(),
    'sad': PlaceholderImages.negativeImages.where((img) => img.contains('sad')).map((img) => 'assets/images/$img').toList(),
    'badfood': PlaceholderImages.negativeImages.where((img) => img.contains('badfood')).map((img) => 'assets/images/$img').toList(),
    'bad': PlaceholderImages.negativeImages.where((img) => img.contains('bad')).map((img) => 'assets/images/$img').toList(),
    'hidden': [], // 非表示画像カテゴリー
  };

  // カテゴリーの表示順序を定義
  final List<String> _categoryOrder = [
    'all',
    'hidden',
    'positive',
    'negative',
    'smile',
    'vegetables',
    'health',
    'sad',
    'badfood',
    'bad',
  ];

  @override
  void initState() {
    super.initState();
    _loadHiddenImages();
  }

  Future<void> _loadHiddenImages() async {
    try {
      final hiddenImages = await _hiddenImageService.getHiddenImages();
      setState(() {
        _hiddenImages = hiddenImages;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _toggleImageVisibility(String imagePath) async {
    _logger.d('_toggleImageVisibility: Toggling image: $imagePath');
    setState(() {
      if (_hiddenImages.contains(imagePath)) {
        _hiddenImages.remove(imagePath);
        _logger.d('_toggleImageVisibility: Removed from hidden: $imagePath');
      } else {
        _hiddenImages.add(imagePath);
        _logger.d('_toggleImageVisibility: Added to hidden: $imagePath');
      }
      // 変更を追跡
      _pendingChanges.add(imagePath);
      _logger.d('_toggleImageVisibility: Pending changes: $_pendingChanges');
    });
  }

  Future<void> _saveChanges() async {
    if (_pendingChanges.isEmpty) return;

    _logger.d('_saveChanges: Saving ${_pendingChanges.length} changes: $_pendingChanges');

    try {
      bool allSuccess = true;
      for (String imagePath in _pendingChanges) {
        _logger.d('_saveChanges: Toggling visibility for: $imagePath');
        final success = await _hiddenImageService.toggleImageVisibility(imagePath);
        _logger.d('_saveChanges: Toggle result for $imagePath: $success');
        if (!success) {
          allSuccess = false;
        }
      }

      if (allSuccess) {
        setState(() {
          _pendingChanges.clear();
        });
        
        // ImageServiceのキャッシュをクリアして非表示設定を反映
        _imageService.refreshCache();
        
        // Firebaseに統計を送信
        _hiddenImageService.sendHiddenImageStats();

        _logger.d('_saveChanges: All changes saved successfully');

      } else {
        _logger.w('_saveChanges: Some changes failed to save');
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(AppLocalizations.of(context)!.saveFailed),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    } catch (e) {
      _logger.e('_saveChanges: Error occurred', error: e);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)!.saveError),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<bool> _showSaveDialog() async {
    if (_pendingChanges.isEmpty) return true;

    return await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              Icon(
                Icons.warning_amber_rounded,
                color: Colors.orange,
                size: 24,
              ),
              const SizedBox(width: 8),
              Text(AppLocalizations.of(context)!.unsavedChanges),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.unsavedChangesMessage(_pendingChanges.length),
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 12),
              Text(
                AppLocalizations.of(context)!.unsavedChangesWarning,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(AppLocalizations.of(context)!.cancel),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              style: TextButton.styleFrom(
                foregroundColor: Colors.grey[600],
              ),
              child: Text(AppLocalizations.of(context)!.discardChanges),
            ),
            ElevatedButton.icon(
              onPressed: () async {
                await _saveChanges();
                Navigator.of(context).pop(true);
              },
              icon: const Icon(Icons.save, size: 18),
              label: Text(AppLocalizations.of(context)!.saveAndExit),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.mintGreen,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        );
      },
    ) ?? false;
  }

  String _getCategoryDisplayName(String category) {
    switch (category) {
      case 'all':
        return AppLocalizations.of(context)!.allImages;
      case 'positive':
        return AppLocalizations.of(context)!.positiveImages;
      case 'negative':
        return AppLocalizations.of(context)!.negativeImages;
      case 'smile':
        return AppLocalizations.of(context)!.smileImages;
      case 'vegetables':
        return AppLocalizations.of(context)!.vegetableImages;
      case 'health':
        return AppLocalizations.of(context)!.healthImages;
      case 'sad':
        return AppLocalizations.of(context)!.sadImages;
      case 'badfood':
        return AppLocalizations.of(context)!.badFoodImages;
      case 'bad':
        return AppLocalizations.of(context)!.badImages;
      case 'hidden':
        return AppLocalizations.of(context)!.hiddenImages;
      default:
        return category;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    // 戻るボタンの処理を追加
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;

        if (_pendingChanges.isNotEmpty) {
          final shouldPop = await _showSaveDialog();
          if (shouldPop) {
            await _saveChanges();
            if (context.mounted) {
              Navigator.of(context).pop();
            }
          }
        } else {
          if (context.mounted) {
            Navigator.of(context).pop();
          }
        }
      },
      child: _buildContent(),
    );
  }

  Widget _buildContent() {
    // 現在のカテゴリーに応じて表示する画像を決定
    List<String> currentImages;
    if (_selectedCategory == 'hidden') {
      currentImages = _hiddenImages.toList();
    } else {
      currentImages = _imageCategories[_selectedCategory] ?? [];
    }

    final hiddenCount = _hiddenImages.length;
    final maxHidden = 15;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ヘッダー情報
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.mintGreen.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Icon(
                Icons.photo_library,
                color: AppColors.mintGreen,
                size: 24,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          AppLocalizations.of(context)!.imageManagement,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        if (_pendingChanges.isNotEmpty) ...[
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              AppLocalizations.of(context)!.unsaved,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      AppLocalizations.of(context)!.hiddenImagesCount(hiddenCount, maxHidden),
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              if (_pendingChanges.isNotEmpty)
                ElevatedButton.icon(
                  onPressed: _saveChanges,
                  icon: const Icon(Icons.save, size: 16),
                  label: Text(AppLocalizations.of(context)!.save),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.mintGreen,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  ),
                ),
            ],
          ),
        ),
        
        const SizedBox(height: 16),
        
        // カテゴリ選択
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: _categoryOrder.map((category) {
              final isSelected = category == _selectedCategory;
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: FilterChip(
                  label: Text(_getCategoryDisplayName(category)),
                  selected: isSelected,
                  onSelected: (selected) {
                    setState(() {
                      _selectedCategory = category;
                    });
                  },
                  selectedColor: AppColors.mintGreen.withValues(alpha: 0.3),
                  checkmarkColor: AppColors.mintGreen,
                ),
              );
            }).toList(),
          ),
        ),
        
        const SizedBox(height: 16),
        
        // 画像グリッド
        Expanded(
          child: currentImages.isEmpty && _selectedCategory == 'hidden'
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.visibility_off,
                        size: 64,
                        color: AppColors.textSecondary,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        AppLocalizations.of(context)!.noHiddenImages,
                        style: const TextStyle(
                          fontSize: 16,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                )
              : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: 1,
                  ),
                  itemCount: currentImages.length,
            itemBuilder: (context, index) {
              final imagePath = currentImages[index];
              final isHidden = _hiddenImages.contains(imagePath);
              final isHiddenCategory = _selectedCategory == 'hidden';
              final isMaxReached = hiddenCount >= maxHidden && !isHidden && !isHiddenCategory;

              return GestureDetector(
                onTap: (isMaxReached && !isHiddenCategory) ? null : () => _toggleImageVisibility(imagePath),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: isHidden ? Colors.red : AppColors.textDisabled,
                      width: 2,
                    ),
                  ),
                  child: Stack(
                    children: [
                      // 画像
                      ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Image.asset(
                          imagePath,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: AppColors.textDisabled,
                              child: const Icon(
                                Icons.image_not_supported,
                                color: Colors.white,
                              ),
                            );
                          },
                        ),
                      ),
                      
                      // 非表示オーバーレイ
                      if (isHidden)
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.red.withValues(alpha: 0.7),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.visibility_off,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                        ),
                      
                      // 最大数制限オーバーレイ
                      if (isMaxReached)
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.withValues(alpha: 0.7),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.block,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                        ),
                      
                      // 画像名
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.black.withValues(alpha: 0.7),
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(6),
                              bottomRight: Radius.circular(6),
                            ),
                          ),
                          child: Text(
                            imagePath.split('/').last,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        
        const SizedBox(height: 16),
        
        // 説明テキスト
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.textDisabled.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Icon(
                Icons.info_outline,
                color: AppColors.textSecondary,
                size: 16,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  AppLocalizations.of(context)!.imageManagementHint,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
