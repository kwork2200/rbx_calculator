import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'all_calculator_controller.dart';

class CalculatorView extends GetView<AllCalculatorController> {
  const CalculatorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final args = Get.arguments as Map<String, dynamic>?;
      if (args?['type'] != null) {
        controller.setType(args!['type'] as CalculatorType);
      }
    });

    return WillPopScope(
      onWillPop: () async {
        controller.done();
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              controller.done();
              Get.back();
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
          title: Obx(() => Text(
            controller.title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
            ),
          )),
          centerTitle: true,
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
        body: Obx(() => SingleChildScrollView(
          padding:
          EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Input Label ──
              Text(
                controller.inputLabel,
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.white70,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 12.h),

              // ── Input Field ──
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF1A1A1A),
                  borderRadius: BorderRadius.circular(50.r),
                ),
                child: TextField(
                  controller: controller.textController,
                  keyboardType: const TextInputType.numberWithOptions(
                      decimal: true),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: 20.w, vertical: 18.h),
                    border: InputBorder.none,
                    hintText: '0',
                    hintStyle: TextStyle(
                        color: Colors.white30, fontSize: 16.sp),
                  ),
                  onChanged: (val) => controller.inputValue.value = val,
                ),
              ),
              SizedBox(height: 16.h),

              // ── Convert Button ──
              GestureDetector(
                onTap: () => controller.convert(),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 18.h),
                  decoration: BoxDecoration(
                    color: const Color(0xFF4ECFA8),
                    borderRadius: BorderRadius.circular(50.r),
                  ),
                  child: Center(
                    child: Text(
                      controller.convertButtonLabel,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.h),

              // ── Result Card ──
              controller.hasResult.value
                  ? _buildResultCard()
                  : const SizedBox.shrink(),

              SizedBox(height: 16.h),

              // ── Ad Banner ──
              _buildAdBanner(),
              SizedBox(height: 16.h),

              // ── Membership Card (BC/TBC/OBC only) ──
              controller.membershipInfo != null
                  ? _buildMembershipCard()
                  : const SizedBox.shrink(),

              SizedBox(height: 20.h),
            ],
          ),
        )),
      ),
    );
  }

  // ── Result Card ─────────────────────────────────────────────────────────────
  Widget _buildResultCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        children: [
          Text(
            controller.resultLabel,
            style: TextStyle(fontSize: 15.sp, color: Colors.white70),
          ),
          SizedBox(height: 12.h),
          Text(
            controller.resultValue.value,
            style: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 16.h),
          GestureDetector(
            onTap: () => controller.done(),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 14.h),
              decoration: BoxDecoration(
                color: const Color(0xFF4ECFA8),
                borderRadius: BorderRadius.circular(50.r),
              ),
              child: Center(
                child: Text(
                  'Done',
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

  // ── Ad Banner ───────────────────────────────────────────────────────────────
  Widget _buildAdBanner() {
    return GestureDetector(
      onTap: () => controller.naviGetUrl(),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(16.r),
        ),
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
                  child: Icon(Icons.card_giftcard,
                      color: Colors.white, size: 28.sp),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Claim Free Robux 💎',
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Your Robux boost starts here.',
                        style: TextStyle(
                            fontSize: 11.sp, color: Colors.white60),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: 6.w, vertical: 3.h),
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Text('Ad',
                      style:
                      TextStyle(fontSize: 10.sp, color: Colors.white)),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Container(
              width: double.infinity,
              height: 100.h,
              decoration: BoxDecoration(
                color: const Color(0xFF2A2A2A),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.monetization_on_outlined,
                        color: Colors.green, size: 32.sp),
                    SizedBox(height: 6.h),
                    Text(
                      'FREE ROBUX AVAILABLE!',
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 14.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.r),
              ),
              child: Center(
                child: Text(
                  'Claim Now',
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ── Membership Info Card ────────────────────────────────────────────────────
  Widget _buildMembershipCard() {
    final info = controller.membershipInfo!;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: [
          Text(
            info['title']!,
            style: TextStyle(fontSize: 14.sp, color: Colors.white70),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 14.h),
          Text(
            info['month']!,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            info['year']!,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 14.h),
          Text(
            info['stands']!,
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            info['desc']!,
            style: TextStyle(fontSize: 12.sp, color: Colors.white54),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}