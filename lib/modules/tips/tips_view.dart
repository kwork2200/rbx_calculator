import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../ads/ad_on_back_wrapper.dart';
import '../../ads/bottom_native_ad_bar.dart';
import '../../ads/hybrid_native_ad_widget.dart';
import '../../utils/functions.dart';
import 'tips_controller.dart';
import '../../models/tip_model.dart';

class TipsView extends StatelessWidget {
  TipsView({super.key});

  final TipsController controller = Get.put(TipsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      bottomNavigationBar: const BottomNativeAdBar(),
      appBar: _buildAppBar(context),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.white),
          );
        }
        return _buildList();
      }),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF0D0D0D),
      elevation: 0,
      centerTitle: true,
      leading: Padding(
        padding: const EdgeInsets.all(8),
        child: GestureDetector(
          onTap: () => handleBackWithAd(context),
          child: Container(
            decoration: const BoxDecoration(
              color: Color(0xFF1C1C1C),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.arrow_back, color: Colors.white, size: 20),
          ),
        ),
      ),
      title: const Text(
        'Tips & Tricks',
        style: TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildList() {
    const adInterval = 2; // Har 2 tips ke baad ek native ad
    final tipCount = controller.tips.length;
    // Last item ke baad ad nahi lagana, is liye ad count aise nikalte hain
    final adCount = tipCount <= adInterval ? 0 : (tipCount - 1) ~/ adInterval;
    final totalCount = tipCount + adCount;

    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      itemCount: totalCount,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        // Har (2 items + 1 ad) wale block me teesri slot par ad dikhao
        if ((index + 1) % (adInterval + 1) == 0) {
          return const HybridNativeAdWidget();
        }
        final tipIndex = index - (index ~/ (adInterval + 1));
        final tip = controller.tips[tipIndex];
        return _TipCard(
          tip: tip,
          onTap: () async {
            await showAdBeforeNavigation(context);
            controller.openTipDetail(tip);
          },
        );
      },
    );
  }
}

// ─── Tip Card ─────────────────────────────────────────────────
class _TipCard extends StatelessWidget {
  final TipModel tip;
  final VoidCallback onTap;

  const _TipCard({required this.tip, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            // Icon circle
            Container(
              width: 48,
              height: 48,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(
                tip.iconType == TipIconType.gamepad
                    ? Icons.sports_esports_outlined
                    : Icons.lightbulb_outline,
                color: Colors.black,
                size: 22,
              ),
            ),
            const SizedBox(width: 14),
            // Title
            Expanded(
              child: Text(
                tip.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  height: 1.3,
                ),
              ),
            ),
            // Arrow indicator
            const Icon(Icons.chevron_right, color: Color(0xFF666666), size: 20),
          ],
        ),
      ),
    );
  }
}
