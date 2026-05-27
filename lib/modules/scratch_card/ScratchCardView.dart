import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'scratch_card_controller.dart';

class ScratchCardView extends GetView<ScratchCardController> {
  const ScratchCardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Container(
            margin: EdgeInsets.all(8.w),
            decoration: const BoxDecoration(
              color: Color(0xFF1A1A1A),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.arrow_back, color: Colors.white, size: 22.sp),
          ),
        ),
        title: Text(
          'Scratch Card',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: Column(
        children: [
          // ── Green Robux Counter Bar ──
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: Obx(
                  () => Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 16.h),
                decoration: BoxDecoration(
                  color: controller.isScratched.value
                      ? const Color(0xFF2E7D5E)
                      : const Color(0xFF4ECFA8),
                  borderRadius: BorderRadius.circular(50.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.hexagon_outlined,
                        color: Colors.black87, size: 22.sp),
                    SizedBox(width: 8.w),
                    Text(
                      '${controller.robuxCount.value}',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          const Spacer(),

          // ── Scratch Card Area ──
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Obx(
                  () => controller.isScratched.value
                  ? _buildWinCard(context)
                  : _buildScratchCard(context),
            ),
          ),

          const Spacer(flex: 2),
        ],
      ),
    );
  }

  // ── Before Scratch: Dark card with hexagon pattern ─────────────────────────
  Widget _buildScratchCard(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) => controller.onScratch(),
      onTap: () => controller.onScratch(),
      child: Container(
        width: double.infinity,
        height: 300.h,
        decoration: BoxDecoration(
          color: const Color(0xFF1E1E1E),
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.r),
          child: Stack(
            children: [
              // Hexagon pattern background
              CustomPaint(
                size: Size(double.infinity, 300.h),
                painter: _HexPatternPainter(),
              ),
              // Scratch hint text
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.touch_app_outlined,
                        color: Colors.white24, size: 36.sp),
                    SizedBox(height: 8.h),
                    Text(
                      'Scratch to Win!',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.white24,
                        letterSpacing: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ── After Scratch: Congratulations card ───────────────────────────────────
  Widget _buildWinCard(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 20.w),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Trophy icon
          Container(
            width: 100.w,
            height: 100.w,
            decoration: const BoxDecoration(
              color: Color(0xFF2A2A2A),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.emoji_events_rounded,
              color: Colors.white,
              size: 58.sp,
            ),
          ),
          SizedBox(height: 24.h),

          // Congratulations text
          Text(
            'Congratulations...!',
            style: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 8.h),

          Text(
            'You won ${controller.wonAmount.value} RBX!',
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.white70,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 24.h),

          // Add to Wallet button
          GestureDetector(
            onTap: () => controller.addToWallet(),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 16.h),
              decoration: BoxDecoration(
                color: const Color(0xFF4ECFA8),
                borderRadius: BorderRadius.circular(50.r),
              ),
              child: Center(
                child: Text(
                  'Add to Wallet',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Hexagon Pattern Painter ──────────────────────────────────────────────────
class _HexPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF2A2A2A)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    final random = Random(42);
    final positions = <Offset>[];

    for (int i = 0; i < 18; i++) {
      positions.add(Offset(
        random.nextDouble() * size.width,
        random.nextDouble() * size.height,
      ));
    }

    for (final center in positions) {
      final radius = 20.0 + random.nextDouble() * 25;
      _drawHexagon(canvas, center, radius, paint);
    }
  }

  void _drawHexagon(Canvas canvas, Offset center, double radius, Paint paint) {
    final path = Path();
    for (int i = 0; i < 6; i++) {
      final angle = (i * 60 - 30) * (pi / 180);
      final x = center.dx + radius * cos(angle);
      final y = center.dy + radius * sin(angle);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();
    canvas.drawPath(path, paint);

    // Inner small hexagon
    final innerPath = Path();
    for (int i = 0; i < 6; i++) {
      final angle = (i * 60 - 30) * (pi / 180);
      final x = center.dx + (radius * 0.45) * cos(angle);
      final y = center.dy + (radius * 0.45) * sin(angle);
      if (i == 0) {
        innerPath.moveTo(x, y);
      } else {
        innerPath.lineTo(x, y);
      }
    }
    innerPath.close();
    canvas.drawPath(innerPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}