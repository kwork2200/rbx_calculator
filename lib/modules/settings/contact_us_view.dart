import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsView extends StatelessWidget {
  const ContactUsView({Key? key}) : super(key: key);

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
          'Contact Us',
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
          children: [
            // Header
            _buildHeaderCard(
              icon: Icons.headset_mic_outlined,
              title: 'Get In Touch',
              subtitle: 'We\'re here to help you!',
            ),
            SizedBox(height: 20.h),

            // Contact items
            _buildContactItem(
              icon: Icons.email_outlined,
              label: 'Email Us',
              value: 'support@rbxcalculator.com',
              onTap: () async {
                final uri = Uri.parse('mailto:support@rbxcalculator.com');
                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri);
                }
              },
            ),
            SizedBox(height: 12.h),

            _buildContactItem(
              icon: Icons.language_outlined,
              label: 'Website',
              value: 'www.rbxcalculator.com',
              onTap: () async {
                final uri = Uri.parse('https://www.rbxcalculator.com');
                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri, mode: LaunchMode.externalApplication);
                }
              },
            ),
            SizedBox(height: 12.h),

            _buildContactItem(
              icon: Icons.chat_outlined,
              label: 'Live Chat',
              value: 'Available 9AM - 6PM IST',
              onTap: () {},
            ),
            SizedBox(height: 12.h),

            _buildContactItem(
              icon: Icons.star_rate_outlined,
              label: 'Rate & Review',
              value: 'Share your feedback on Play Store',
              onTap: () async {
                final uri = Uri.parse(
                  'https://play.google.com/store/apps/details?id=com.example.rbx_calculator',
                );
                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri, mode: LaunchMode.externalApplication);
                }
              },
            ),
            SizedBox(height: 24.h),

            // Message card
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20.w),
              decoration: BoxDecoration(
                color: const Color(0xFF1A1A1A),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Send a Message',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 14.h),

                  // Name field
                  _buildTextField(hint: 'Your Name'),
                  SizedBox(height: 12.h),

                  // Email field
                  _buildTextField(
                    hint: 'Your Email',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 12.h),

                  // Message field
                  _buildTextField(
                    hint: 'Your Message',
                    maxLines: 4,
                  ),
                  SizedBox(height: 16.h),

                  // Send button
                  GestureDetector(
                    onTap: () {
                      Get.snackbar(
                        '✅ Sent!',
                        'Your message has been sent successfully.',
                        backgroundColor: const Color(0xFF4ECFA8),
                        colorText: Colors.black,
                        duration: const Duration(seconds: 2),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      decoration: BoxDecoration(
                        color: const Color(0xFF4ECFA8),
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                      child: Center(
                        child: Text(
                          'Send Message',
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

  Widget _buildContactItem({
    required IconData icon,
    required String label,
    required String value,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(
          children: [
            Container(
              width: 46.w,
              height: 46.w,
              decoration: const BoxDecoration(
                color: Color(0xFF4ECFA8),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: Colors.black, size: 22.sp),
            ),
            SizedBox(width: 14.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 3.h),
                  Text(
                    value,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.white54,
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios,
                color: Colors.white38, size: 14.sp),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String hint,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF2A2A2A),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: TextField(
        keyboardType: keyboardType,
        maxLines: maxLines,
        style: TextStyle(color: Colors.white, fontSize: 14.sp),
        decoration: InputDecoration(
          contentPadding:
          EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
          border: InputBorder.none,
          hintText: hint,
          hintStyle: TextStyle(color: Colors.white38, fontSize: 14.sp),
        ),
      ),
    );
  }
}