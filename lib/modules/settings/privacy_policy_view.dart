import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PrivacyPolicyView extends StatelessWidget {
  const PrivacyPolicyView({Key? key}) : super(key: key);

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
          'Privacy Policy',
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
            // Header card
            _buildHeaderCard(
              icon: Icons.shield_outlined,
              title: 'Privacy Policy',
              subtitle: 'Last updated: May 2025',
            ),
            SizedBox(height: 20.h),

            _buildSectionCard(
              title: '1. Information We Collect',
              content:
              'We collect information you provide directly to us when using the RBX Calculator app, including usage data, device information, and app interaction data to improve your experience.',
            ),
            SizedBox(height: 12.h),

            _buildSectionCard(
              title: '2. How We Use Information',
              content:
              'We use the collected information to provide, maintain, and improve our services, to process transactions, send notifications, and for analytics purposes to enhance app performance.',
            ),
            SizedBox(height: 12.h),

            _buildSectionCard(
              title: '3. Data Security',
              content:
              'We implement appropriate security measures to protect your personal information against unauthorized access, alteration, disclosure, or destruction of your data.',
            ),
            SizedBox(height: 12.h),

            _buildSectionCard(
              title: '4. Third-Party Services',
              content:
              'Our app may contain links to third-party websites or services. We are not responsible for the privacy practices of these third parties and encourage you to review their privacy policies.',
            ),
            SizedBox(height: 12.h),

            _buildSectionCard(
              title: '5. Children\'s Privacy',
              content:
              'Our services are not directed to children under 13. We do not knowingly collect personal information from children under 13 years of age.',
            ),
            SizedBox(height: 12.h),

            _buildSectionCard(
              title: '6. Contact Us',
              content:
              'If you have any questions about this Privacy Policy, please contact us at support@rbxcalculator.com',
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