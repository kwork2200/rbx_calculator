import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TermsConditionsView extends StatelessWidget {
  const TermsConditionsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A1A1A),
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Container(
            margin: EdgeInsets.all(8.w),
            decoration: const BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.arrow_back, color: Colors.white, size: 22.sp),
          ),
        ),
        title: Text(
          'Terms & Conditions',
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
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeaderCard(
              icon: Icons.description_outlined,
              title: 'Terms & Conditions',
              subtitle: 'Effective: May 2025',
            ),
            SizedBox(height: 20.h),

            _buildSectionCard(
              title: '1. Acceptance of Terms',
              content:
              'By downloading or using the RBX Calculator app, you agree to be bound by these Terms and Conditions. If you do not agree, please do not use our application.',
            ),
            SizedBox(height: 12.h),

            _buildSectionCard(
              title: '2. Use of the App',
              content:
              'RBX Calculator is intended for informational and entertainment purposes only. All Robux conversion values are approximate and may not reflect real-time market rates.',
            ),
            SizedBox(height: 12.h),

            _buildSectionCard(
              title: '3. Intellectual Property',
              content:
              'All content, features, and functionality of this app are owned by RBX Calculator and are protected by applicable intellectual property laws.',
            ),
            SizedBox(height: 12.h),

            _buildSectionCard(
              title: '4. Disclaimer of Warranties',
              content:
              'The app is provided on an "as is" basis without warranties of any kind. We do not guarantee that the app will be error-free or uninterrupted at all times.',
            ),
            SizedBox(height: 12.h),

            _buildSectionCard(
              title: '5. Limitation of Liability',
              content:
              'In no event shall RBX Calculator be liable for any indirect, incidental, or consequential damages arising from your use of the application.',
            ),
            SizedBox(height: 12.h),

            _buildSectionCard(
              title: '6. Changes to Terms',
              content:
              'We reserve the right to modify these terms at any time. Continued use of the app after changes constitutes acceptance of the new terms.',
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderCard({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          Container(
            width: 54.w,
            height: 54.w,
            decoration: const BoxDecoration(
              color: Color(0xFF4ECFA8),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.black, size: 26.sp),
          ),
          SizedBox(width: 16.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                subtitle,
                style: TextStyle(fontSize: 12.sp, color: Colors.white54),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSectionCard({
    required String title,
    required String content,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 6.w,
                height: 6.w,
                decoration: const BoxDecoration(
                  color: Color(0xFF4ECFA8),
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Text(
            content,
            style: TextStyle(
              fontSize: 13.sp,
              color: Colors.white60,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}