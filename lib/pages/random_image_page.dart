import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/random_image_display.dart';

/// ランダム画像表示ページ
class RandomImagePage extends ConsumerWidget {
  const RandomImagePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ランダム画像表示'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: const RandomImageDisplay(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // 自動でグループを選択して画像を表示
          ref.read(randomImageProvider.notifier).generateNewImageSet();
        },
        icon: const Icon(Icons.refresh),
        label: const Text('自動選択'),
      ),
    );
  }
}