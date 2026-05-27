import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../routes/app_routes.dart';
import '../theme/theme_controller.dart';
import 'settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      builder: (themeController) {
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
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 22.sp,
                ),
              ),
            ),
            title: Text(
              'Settings',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            centerTitle: true,
            systemOverlayStyle: SystemUiOverlayStyle.light,
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
            child: Column(
              children: [
                _buildSettingsItem(
                  icon: Icons.share_outlined,
                  label: 'Share App',
                  onTap: () {
                    Share.share(
                      'Check out this amazing RBX Calculator app!',
                      subject: 'RBX Calculator',
                    );
                  },
                ),
                SizedBox(height: 16.h),
                _buildSettingsItem(
                  icon: Icons.star_border_rounded,
                  label: 'Rate Us',
                  onTap: () async {
                    final uri = Uri.parse(
                      'https://play.google.com/store/apps/details?id=com.example.rbx_calculator',
                    );
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(uri, mode: LaunchMode.externalApplication);
                    }
                  },
                ),

                _buildSettingsItem(
                  icon: Icons.shield_outlined,
                  label: 'Privacy Policy',
                  onTap: () => Get.toNamed(Routes.PRIVACY_POLICY),
                ),
                SizedBox(height: 16.h),
                _buildSettingsItem(
                  icon: Icons.description_outlined,
                  label: 'Terms & Conditions',
                  onTap: () => Get.toNamed(Routes.TERMS_CONDITIONS),
                ),
                SizedBox(height: 16.h),
                _buildSettingsItem(
                  icon: Icons.headset_mic_outlined,
                  label: 'Contact Us',
                  onTap: () => Get.toNamed(Routes.CONTACT_US),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSettingsItem({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
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
              child: Icon(
                icon,
                color: Colors.black,
                size: 22.sp,
              ),
            ),
            SizedBox(width: 16.w),
            Text(
              label,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}