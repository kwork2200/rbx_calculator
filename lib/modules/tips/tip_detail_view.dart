import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../models/tip_model.dart';

class TipDetailView extends StatelessWidget {
  const TipDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    // Receive tip via Get.arguments
    final TipModel tip = Get.arguments as TipModel;

    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      appBar: _buildAppBar(),
      body: Column(
        children: [
          Expanded(
            flex: 8,
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    tip.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Content
                  Text(
                    tip.content,
                    style: const TextStyle(
                      color: Color(0xFFCCCCCC),
                      fontSize: 15,
                      height: 1.65,
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
          Expanded(flex: 2, child: _buildBottomAd()),
        ],
      ),
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
                  // color: Colors.green.shade900,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text("🎁", style: TextStyle(fontSize: 40)),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          '⚡ New Redeem Codes Every Day 🎁',
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
                      '🚀 Unlock Unlimited Robux 💸',
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
                'Get Free Robux',
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

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: const Color(0xFF0D0D0D),
      elevation: 0,
      centerTitle: true,
      leading: Padding(
        padding: const EdgeInsets.all(8),
        child: GestureDetector(
          onTap: () => Get.back(),
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
}
