import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'spin_wheel_controller.dart';

class SpinWheelView extends GetView<SpinWheelController> {
  const SpinWheelView({Key? key}) : super(key: key);

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
          'Spin & Wheel',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: false,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: Column(
        children: [
          // ── Robux Counter Bar ──
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: Obx(
                  () => Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 16.h),
                decoration: BoxDecoration(
                  color: controller.hasResult.value
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

          SizedBox(height: 10.h),

          // ── Pointer Triangle ──
          Icon(Icons.arrow_drop_down,
              color: Colors.white, size: 36.sp),

          SizedBox(height: 4.h),

          // ── Wheel or Result ──
          Expanded(
            child: Obx(
                  () => controller.hasResult.value
                  ? _buildWinCard()
                  : _buildWheel(),
            ),
          ),

          // ── Spin Now Button ──
          Obx(
                () => controller.hasResult.value
                ? const SizedBox.shrink()
                : Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 16.w, vertical: 16.h),
              child: GestureDetector(
                onTap: () => controller.spinWheel(),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 18.h),
                  decoration: BoxDecoration(
                    color: const Color(0xFF4ECFA8),
                    borderRadius: BorderRadius.circular(50.r),
                  ),
                  child: Center(
                    child: Text(
                      'Spin Now',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // ── Bottom Ad ──
          _buildBottomAd(),
        ],
      ),
    );
  }

  // ── Spin Wheel ─────────────────────────────────────────────────────────────
  Widget _buildWheel() {
    return Center(
      child: Obx(
            () => Transform.rotate(
          angle: controller.currentAngle.value,
          child: SizedBox(
            width: 300.w,
            height: 300.w,
            child: CustomPaint(
              painter: _WheelPainter(
                segments: controller.segments,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ── Win Result Card ────────────────────────────────────────────────────────
  Widget _buildWinCard() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 36.h, horizontal: 20.w),
        decoration: BoxDecoration(
          color: const Color(0xFF1E1E1E),
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Trophy
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
            SizedBox(height: 20.h),

            Text(
              'Congratulations...!',
              style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8.h),

            Obx(
                  () => Text(
                '${controller.wonAmount.value} RBX!',
                style: TextStyle(
                  fontSize: 18.sp,
                  color: Colors.white70,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 24.h),

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
                    'Add To Wallet',
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
      ),
    );
  }

  // ── Bottom Ad ──────────────────────────────────────────────────────────────
  Widget _buildBottomAd() {
    return Container(
      color: const Color(0xFF1A1A1A),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Row(
        children: [
          Container(
            width: 40.w,
            height: 40.w,
            decoration: BoxDecoration(
              color: Colors.green.shade900,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Icon(Icons.card_giftcard,
                color: Colors.white, size: 20.sp),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Text(
              'You Receive  🔘 9,999,999',
              style: TextStyle(fontSize: 12.sp, color: Colors.white70),
            ),
          ),
          Container(
            padding:
            EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: const Color(0xFF4ECFA8),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Text(
              'Redeem',
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Wheel Painter ─────────────────────────────────────────────────────────────
class _WheelPainter extends CustomPainter {
  final List<int> segments;

  _WheelPainter({required this.segments});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    final segmentAngle = (2 * pi) / segments.length;

    final colors = [
      const Color(0xFF1A1A1A),
      const Color(0xFF252525),
    ];

    // Outer ring
    final ringPaint = Paint()
      ..color = const Color(0xFF2A2A2A)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;
    canvas.drawCircle(center, radius - 5, ringPaint);

    for (int i = 0; i < segments.length; i++) {
      final startAngle = i * segmentAngle - pi / 2;

      // Segment fill
      final paint = Paint()
        ..color = colors[i % colors.length]
        ..style = PaintingStyle.fill;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius - 10),
        startAngle,
        segmentAngle,
        true,
        paint,
      );

      // Segment border
      final borderPaint = Paint()
        ..color = const Color(0xFF3A3A3A)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.5;
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius - 10),
        startAngle,
        segmentAngle,
        true,
        borderPaint,
      );

      // Segment label
      final textAngle = startAngle + segmentAngle / 2;
      final textRadius = radius * 0.62;
      final textX = center.dx + textRadius * cos(textAngle);
      final textY = center.dy + textRadius * sin(textAngle);

      canvas.save();
      canvas.translate(textX, textY);
      canvas.rotate(textAngle + pi / 2);

      final textPainter = TextPainter(
        text: TextSpan(
          text: '${segments[i]}',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(-textPainter.width / 2, -textPainter.height / 2),
      );

      canvas.restore();
    }

    // Center white dot
    final centerPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, 14, centerPaint);

    final centerBorder = Paint()
      ..color = const Color(0xFF3A3A3A)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    canvas.drawCircle(center, 14, centerBorder);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}