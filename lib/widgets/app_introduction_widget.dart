import 'package:flutter/material.dart';
import 'package:focusmint/constants/app_colors.dart';

class AppIntroductionDialog {
  static Future<void> show(BuildContext context, VoidCallback onNext) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return _AppIntroductionContent(onNext: onNext);
      },
    );
  }
}

class _AppIntroductionContent extends StatefulWidget {
  final VoidCallback onNext;
  
  const _AppIntroductionContent({required this.onNext});
  
  @override
  State<_AppIntroductionContent> createState() => _AppIntroductionContentState();
}

class _AppIntroductionContentState extends State<_AppIntroductionContent> {
  final ScrollController _scrollController = ScrollController();
  double _scrollProgress = 0.0;
  
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }
  
  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }
  
  void _onScroll() {
    final maxScrollExtent = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    
    setState(() {
      if (maxScrollExtent > 0) {
        _scrollProgress = (currentScroll / maxScrollExtent).clamp(0.0, 1.0);
      } else {
        _scrollProgress = 0.0;
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
            constraints: const BoxConstraints(maxHeight: 600),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: AppColors.shadowColor.withValues(alpha: 0.2),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Row(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          controller: _scrollController,
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                        // アプリタイトル
                        const Center(
                          child: Text(
                            'FOCUS MINT',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: AppColors.mintGreen,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        
                        // 注意バイアスについて
                        _buildSection(
                          icon: Icons.visibility,
                          title: '注意バイアスについて',
                          content: '不安が強いと、無意識にネガティブなものばかりに目がいきやすくなります。',
                        ),
                        
                        const SizedBox(height: 20),
                        
                        // FocusMintの役割
                        _buildSection(
                          icon: Icons.psychology,
                          title: 'FocusMint の役割',
                          content: 'ポジティブな画像を選ぶ練習で、自然と良いほうに注意を向けられるようになります。',
                        ),
                        
                        const SizedBox(height: 20),
                        
                        // 科学的根拠
                        _buildSection(
                          icon: Icons.science,
                          title: '科学的根拠',
                          content: '25分のトレーニングで不安・ストレスが大きく減少することが研究で確認されています。\n\n（例：Amir et al., 2009 Journal of Abnormal Psychology / Hakamata et al., 2010 Psychological Bulletin）',
                        ),
                        
                        const SizedBox(height: 20),
                        
                        // 期待できる効果
                        _buildSection(
                          icon: Icons.favorite,
                          title: '期待できる効果',
                          content: '',
                          customContent: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildEffectItem('不安や緊張の軽減'),
                              _buildEffectItem('周囲の笑顔に気づきやすくなる'),
                              _buildEffectItem('人付き合いが楽になる'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                      // 縦のスクロールバナー
                      Container(
                        width: 8,
                        margin: const EdgeInsets.only(top: 24.0, bottom: 24.0, right: 16.0),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            final thumbHeight = constraints.maxHeight * 0.3;
                            final trackHeight = constraints.maxHeight - thumbHeight;
                            final thumbPosition = trackHeight * _scrollProgress;
                            
                            return Stack(
                              children: [
                                // スクロールサム
                                Positioned(
                                  top: thumbPosition,
                                  child: Container(
                                    width: 8,
                                    height: thumbHeight,
                                    decoration: BoxDecoration(
                                      color: AppColors.mintGreen,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                
                // ボタン領域
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        widget.onNext();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.mintGreen,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        elevation: 2,
                      ),
                      child: const Text(
                        '使い方を見る',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
  }
}

Widget _buildSection({
    required IconData icon,
    required String title,
    required String content,
    Widget? customContent,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: AppColors.mintGreen,
                size: 22,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          if (customContent != null)
            customContent
          else
            Text(
              content,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.textPrimary,
                height: 1.4,
              ),
            ),
        ],
      ),
    );
  }

Widget _buildEffectItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          const Icon(
            Icons.check_circle,
            color: AppColors.mintGreen,
            size: 18,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.textPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }