import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import '../services/random_image_service.dart';

/// ランダム画像表示のプロバイダー
final randomImageProvider = StateNotifierProvider<RandomImageNotifier, List<String>>((ref) {
  return RandomImageNotifier();
});

class RandomImageNotifier extends StateNotifier<List<String>> {
  static final Logger _logger = Logger();
  
  RandomImageNotifier() : super([]);
  
  /// 新しいランダム画像セットを生成
  void generateNewImageSet() {
    try {
      final newImages = RandomImageService.selectRandomImages();
      state = newImages;
      
      _logger.i('generateNewImageSet', 
          error: null, 
          stackTrace: null);
      _logger.i('新しい画像セットが生成されました: ${newImages.length}枚');
      
    } catch (e, stackTrace) {
      _logger.e('generateNewImageSet', 
          error: e, 
          stackTrace: stackTrace);
    }
  }
  
  /// 画像リストをクリア
  void clearImages() {
    state = [];
    _logger.i('画像リストがクリアされました');
  }
}

/// ランダム画像表示ウィジェット
class RandomImageDisplay extends ConsumerWidget {
  const RandomImageDisplay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final images = ref.watch(randomImageProvider);
    
    if (images.isEmpty) {
      return const Center(
        child: Text(
          'ボタンを押して画像を表示してください',
          style: TextStyle(fontSize: 18),
        ),
      );
    }
    
    return Column(
      children: [
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1.0,
            ),
            itemCount: images.length,
            itemBuilder: (context, index) {
              return _ImageCard(
                imagePath: images[index],
                index: index + 1,
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  ref.read(randomImageProvider.notifier).generateNewImageSet();
                },
                child: const Text('新しい画像セット'),
              ),
              OutlinedButton(
                onPressed: () {
                  ref.read(randomImageProvider.notifier).clearImages();
                },
                child: const Text('クリア'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// 個別の画像カードウィジェット
class _ImageCard extends StatelessWidget {
  const _ImageCard({
    required this.imagePath,
    required this.index,
  });
  
  final String imagePath;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Expanded(
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              width: double.infinity,
              errorBuilder: (context, error, stackTrace) {
                Logger().e('Image loading error', 
                    error: error, 
                    stackTrace: stackTrace);
                Logger().e('画像パス: $imagePath');
                return Container(
                  color: Colors.grey[300],
                  child: const Center(
                    child: Icon(
                      Icons.error,
                      color: Colors.red,
                      size: 40,
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: Text(
              '画像 $index',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}