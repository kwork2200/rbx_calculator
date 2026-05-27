import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'tips_controller.dart';
import '../../models/tip_model.dart';

class TipsView extends StatelessWidget {
  TipsView({super.key});

  final TipsController controller = Get.put(TipsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      appBar: _buildAppBar(),
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

  Widget _buildBottomAd() {
    return Container(
      color: const Color(0xFF1A1A1A),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 50.w,
                height: 50.w,
                decoration: BoxDecoration(
                  color: Colors.green.shade900,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Icon(
                  Icons.card_giftcard,
                  color: Colors.white,
                  size: 28.sp,
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Daily Robux Rewards ',
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        const Text('⭐'),
                      ],
                    ),
                    Text(
                      'Learn the fastest ways to get Robux',
                      style: TextStyle(fontSize: 11.sp, color: Colors.white60),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 3.h),
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Text(
                  'Ad',
                  style: TextStyle(fontSize: 10.sp, color: Colors.white),
                ),
              ),
            ],
          )

        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: const Color(0xFF0D0D0D),
      elevation: 0,
      centerTitle: true,
      leading: Padding(
        padding: const EdgeInsets.all(8),
        child: GestureDetector(
          onTap: controller.goBack,
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
    return Column(
      children: [
        Expanded(
          flex: 8,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            itemCount: controller.tips.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final tip = controller.tips[index];
              return _TipCard(
                tip: tip,
                onTap: () => controller.openTipDetail(tip),
              );
            },
          ),
        ),
        Expanded(flex: 1, child: _buildBottomAd()),
      ],
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
