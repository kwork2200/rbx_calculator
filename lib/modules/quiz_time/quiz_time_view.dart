import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'quiz_time_controller.dart';

class QuizTimeView extends GetView<QuizTimeController> {
  const QuizTimeView({Key? key}) : super(key: key);

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
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Obx(() => _buildQuizBody()),
            ),
          ),
          // Ad Banner Bottom
          _buildBottomAd(),
        ],
      ),
    );
  }

  Widget _buildQuizBody() {
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
              onTap: () => controller.selectAnswer(index),
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
      ],
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
                child: Icon(Icons.card_giftcard, color: Colors.white, size: 28.sp),
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
          ),
          SizedBox(height: 8.h),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 14.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30.r),
            ),
            child: Center(
              child: Text(
                'Get Now',
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          SizedBox(height: 4.h),
        ],
      ),
    );
  }
}