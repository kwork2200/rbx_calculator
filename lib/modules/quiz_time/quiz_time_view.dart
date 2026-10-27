import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../ads/ad_on_back_wrapper.dart';
import '../../ads/bottom_native_ad_bar.dart';
import '../../ads/hybrid_native_ad_widget.dart';
import '../../utils/functions.dart';
import 'quiz_time_controller.dart';

class QuizTimeView extends GetView<QuizTimeController> {
  const QuizTimeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: const BottomNativeAdBar(),
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => handleBackWithAd(context),
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
          'Quiz Time',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: false,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Obx(() => _buildQuizBody(context)),
      ),
    );
  }

  Widget _buildQuizBody(BuildContext context) {
    final q = controller.currentQuestion;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8.h),

        // ── Question Counter Bar ──
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 16.h),
          decoration: BoxDecoration(
            color: const Color(0xFF4ECFA8),
            borderRadius: BorderRadius.circular(50.r),
          ),
          child: Center(
            child: Text(
              'Question ${controller.currentIndex.value + 1} / ${controller.totalQuestions}',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
          ),
        ),
        SizedBox(height: 28.h),

        // ── Question Text ──
        Text(
          q.question,
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
            color: Colors.white,
            height: 1.4,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 28.h),

        // ── Answer Options ──
        ...List.generate(q.options.length, (index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 14.h),
            child: GestureDetector(
              onTap: () async {
                if (controller.isAnswered.value) return;
                // Interstitial sirf last question ke baad (result par jaane se pehle)
                final isLastQuestion = controller.currentIndex.value ==
                    controller.totalQuestions - 1;
                if (isLastQuestion) {
                  await showAdBeforeNavigation(context);
                }
                controller.selectAnswer(index);
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 16.w),
                decoration: BoxDecoration(
                  color: controller.getOptionColor(index),
                  borderRadius: BorderRadius.circular(50.r),
                ),
                child: Center(
                  child: Text(
                    q.options[index],
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          );
        }),

        SizedBox(height: 28.h),
        HybridNativeAdWidget(),
      ],
    );
  }
}