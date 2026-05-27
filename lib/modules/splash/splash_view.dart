import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../theme/theme_controller.dart';
import 'splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.navigateAfterDelay();
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      body: Stack(
        children: [
          // --- Background diagonal shapes ---
          Positioned.fill(
            child: CustomPaint(
              painter: _DiagonalShapesPainter(),
            ),
          ),

          // --- Main Content ---
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Hexagon Logo
                SizedBox(
                  width: 130.w,
                  height: 130.w,
                  child: CustomPaint(
                    painter: _HexagonLogoPainter(),
                  ),
                ),

                SizedBox(height: 180.h),

                // RBX Title
                Text(
                  'RBX',
                  style: TextStyle(
                    fontSize: 72.sp,
                    fontWeight: FontWeight.w800,
                    color: const Color(0xFF4ECFA8),
                    letterSpacing: 4,
                    height: 1.0,
                  ),
                ),

                SizedBox(height: 6.h),

                // CALCULATOR subtitle
                Text(
                  'CALCULATOR',
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF4ECFA8),
                    letterSpacing: 6,
                  ),
                ),

                SizedBox(height: 8.h),

                // ROBOX COUNTER
                Text(
                  'R O B O X   C O U N T E R',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    letterSpacing: 5,
                  ),
                ),
              ],
            ),
          ),

          // --- Bottom bar ---
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              children: [
                // Loading bar
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 120.w),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: null, // or use controller value for animated
                      backgroundColor: Colors.white24,
                      valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                      minHeight: 3,
                    ),
                  ),
                ),

                SizedBox(height: 8.h),

                // Ads warning
                Padding(
                  padding: EdgeInsets.only(bottom: 12.h),
                  child: Text(
                    'This Process May Contain ADS',
                    style: TextStyle(
                      fontSize: 11.sp,
                      color: Colors.white54,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Diagonal Background Painter ────────────────────────────────────────────

class _DiagonalShapesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF1A1A1A)
      ..style = PaintingStyle.fill;

    // Top-left diagonal band
    final path1 = Path();
    path1.moveTo(0, size.height * 0.25);
    path1.lineTo(size.width * 0.75, size.height * 0.55);
    path1.lineTo(size.width * 0.75, size.height * 0.75);
    path1.lineTo(0, size.height * 0.45);
    path1.close();
    canvas.drawPath(path1, paint);

    // Bottom-right diagonal band
    final path2 = Path();
    path2.moveTo(size.width * 0.25, size.height * 0.55);
    path2.lineTo(size.width, size.height * 0.35);
    path2.lineTo(size.width, size.height * 0.55);
    path2.lineTo(size.width * 0.25, size.height * 0.75);
    path2.close();
    canvas.drawPath(path2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// ─── Hexagon Logo Painter ────────────────────────────────────────────────────

class _HexagonLogoPainter extends CustomPainter {
  final Color color = const Color(0xFF4ECFA8);

  void _drawHexagon(Canvas canvas, Offset center, double radius, double strokeWidth) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    final path = Path();
    for (int i = 0; i < 6; i++) {
      final angle = (i * 60 - 30) * (3.14159265 / 180);
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
  }

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    // Draw 4 concentric hexagons (outer to inner)
    _drawHexagon(canvas, center, size.width * 0.48, 3.5);
    _drawHexagon(canvas, center, size.width * 0.38, 2.8);
    _drawHexagon(canvas, center, size.width * 0.28, 2.2);
    _drawHexagon(canvas, center, size.width * 0.18, 1.8);

    // R$ text in center
    final textPainter = TextPainter(
      text: TextSpan(
        text: 'R\$',
        style: TextStyle(
          color: color,
          fontSize: size.width * 0.18,
          fontWeight: FontWeight.w700,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(
      canvas,
      center - Offset(textPainter.width / 2, textPainter.height / 2),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}