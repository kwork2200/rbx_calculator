import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../ads/ad_on_back_wrapper.dart';
import '../../ads/bottom_native_ad_bar.dart';
import '../../ads/hybrid_native_ad_widget.dart';
import '../../routes/app_routes.dart';
import '../../utils/functions.dart';

class QuizResultView extends StatelessWidget {
  const QuizResultView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as Map<String, dynamic>;
    final int correct = args['correct'] ?? 0;
    final int total = args['total'] ?? 10;
    final int earned = args['earned'] ?? 0;

    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: const BottomNativeAdBar(),
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: GestureDetector(
          onTap: () async {
            if (await showAdOnBackNavigation(context)) {
              Get.offAllNamed(Routes.HOME);
            }
          },
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
          'Quiz Result',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          children: [
            SizedBox(height: 16.h),

            // ── Congrats Gold Text ──
            ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(
                colors: [Color(0xFFFFD700), Color(0xFFFFA500), Color(0xFFFFD700)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ).createShader(bounds),
              child: Text(
                'Congrats',
                style: TextStyle(
                  fontSize: 52.sp,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  shadows: const [
                    Shadow(
                      color: Color(0xFFFFD700),
                      blurRadius: 12,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.h),

            // ── Correct Answers ──
            Text(
              'Your',
              style: TextStyle(fontSize: 16.sp, color: Colors.white70),
            ),
            Text(
              '$correct Answers Are Correct',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20.h),

            // ── You've Won Card ──
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
              decoration: BoxDecoration(
                color: const Color(0xFF1A1A1A),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "You've won",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 16.w, vertical: 10.h),
                    decoration: BoxDecoration(
                      color: const Color(0xFF4ECFA8),
                      borderRadius: BorderRadius.circular(50.r),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.hexagon_outlined,
                            color: Colors.black, size: 20.sp),
                        SizedBox(width: 6.w),
                        Text(
                          '$earned',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),

            // ── Completion Message ──
            Text(
              'Congratulations on successfully completing the quiz! 🏆 Celebrate your achievement and keep shining bright!',
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.white70,
                height: 1.6,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24.h),

            // ── Add to Wallet Button ──
            GestureDetector(
              onTap: () async {
                await showAdBeforeNavigation(context);
                Get.offAllNamed(Routes.HOME);
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 18.h),
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
            SizedBox(height: 50.h),
            HybridNativeAdWidget(),
          ],
        ),
      ),
    );
  }
}