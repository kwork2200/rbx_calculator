import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rbx_calculator/ads/hybrid_native_ad_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../ads/bottom_native_ad_bar.dart';
import '../../routes/app_routes.dart';
import '../../services/remote_config_service.dart';
import '../../utils/functions.dart';
import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      bottomNavigationBar: const BottomNativeAdBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              _buildHeader(context),
              SizedBox(height: 20.h),

              _buildRobuxBar(),
              SizedBox(height: 16.h),

              _buildWideCard(
                icon: Icons.dashboard_customize_outlined,
                title: 'All Calculator',
                subtitle: 'All RBX Calculator',
                onTap: () async {
                  await showAdBeforeNavigation(context);
                  final url = RemoteConfigService.instance.appUrl.trim();

                  final uri = Uri.parse(url);
                  print("🚀 Going to  $uri");

                  await launchUrl(
                    uri,
                    mode: LaunchMode.inAppBrowserView,
                  );
                  Get.toNamed(Routes.allCalculatorView);
                },
              ),
              SizedBox(height: 16.h),

              Row(
                children: [
                  Expanded(
                    child: _buildGridCard(
                      icon: Icons.sports_esports_outlined,
                      title: 'Play Game',
                      subtitle: 'Play smart, Play hard',
                      showAd: true,
                      onTap: () async {
                        await showAdBeforeNavigation(context);
                        final url = RemoteConfigService.instance.appUrl.trim();

                        final uri = Uri.parse(url);
                        print("🚀 Going to  $uri");

                        await launchUrl(
                          uri,
                          mode: LaunchMode.inAppBrowserView,
                        );

                      },
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: _buildGridCard(
                      icon: Icons.credit_card_outlined,
                      title: 'Scratch Card',
                      subtitle: 'Scratch the card win a prize',
                      onTap: () async {
                        await showAdBeforeNavigation(context);
                        final url = RemoteConfigService.instance.appUrl.trim();

                        final uri = Uri.parse(url);
                        print("🚀 Going to  $uri");

                        await launchUrl(
                          uri,
                          mode: LaunchMode.inAppBrowserView,
                        );
                        Get.toNamed(Routes.scratchCardView);
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              HybridNativeAdWidget(),
              SizedBox(height: 12.h),
              Row(
                children: [
                  Expanded(
                    child: _buildGridCard(
                      icon: Icons.quiz_outlined,
                      title: 'Quiz Time',
                      subtitle: 'Play quiz and get amazing gift',
                      onTap: () async {
                        await showAdBeforeNavigation(context);
                        final url = RemoteConfigService.instance.appUrl.trim();

                        final uri = Uri.parse(url);
                        print("🚀 Going to  $uri");

                        await launchUrl(
                          uri,
                          mode: LaunchMode.inAppBrowserView,
                        );
                        Get.toNamed(Routes.QUIZ_TIME);
                      },
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: _buildGridCard(
                      icon: Icons.sports_esports_outlined,
                      title: 'Play Game',
                      subtitle: 'Play smart, Play hard',
                      showAd: true,
                      onTap: () async {
                        await showAdBeforeNavigation(context);
                        final url = RemoteConfigService.instance.appUrl.trim();

                        final uri = Uri.parse(url);
                        print("🚀 Going to  $uri");

                        await launchUrl(
                          uri,
                          mode: LaunchMode.inAppBrowserView,
                        );

                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              HybridNativeAdWidget(),
              SizedBox(height: 12.h),

              _buildWideCard(
                icon: Icons.casino_outlined,
                title: 'Lucky Spin Wheel',
                subtitle: 'Spin wheels and get amazing gift',
                onTap: () async {
                  await showAdBeforeNavigation(context);
                  final url = RemoteConfigService.instance.appUrl.trim();

                  final uri = Uri.parse(url);
                  print("🚀 Going to  $uri");

                  await launchUrl(
                    uri,
                    mode: LaunchMode.inAppBrowserView,
                  );
                  Get.toNamed(Routes.SPIN_WHEEL);
                },
              ),
              SizedBox(height: 12.h),

              Row(
                children: [
                  Expanded(
                    child: _buildGridCard(
                      icon: Icons.sentiment_very_satisfied_outlined,
                      title: 'Meme',
                      subtitle: 'Play meme sounds or visuals for quick humor',
                      onTap: () async {
                        await showAdBeforeNavigation(context);
                        final url = RemoteConfigService.instance.appUrl.trim();

                        final uri = Uri.parse(url);
                        print("🚀 Going to  $uri");

                        await launchUrl(
                          uri,
                          mode: LaunchMode.inAppBrowserView,
                        );
                        Get.toNamed(Routes.memes);
                      },
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: _buildGridCard(
                      icon: Icons.lightbulb_outline,
                      title: 'Tips & Tricks',
                      subtitle: 'Provide helpful shortcuts or advice instantly',
                      onTap: () async {
                        await showAdBeforeNavigation(context);
                        final url = RemoteConfigService.instance.appUrl.trim();

                        final uri = Uri.parse(url);
                        print("🚀 Going to SETTINGS $uri");

                        await launchUrl(
                          uri,
                          mode: LaunchMode.inAppBrowserView,
                        );

                        Get.toNamed(Routes.tips);
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              HybridNativeAdWidget(),
              SizedBox(height: 12.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'RBX Calculator',
              style: TextStyle(
                fontSize: 26.sp,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
            Text(
              'Robox Counter',
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.white70,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: () async {
            await showAdBeforeNavigation(context);
            final url = RemoteConfigService.instance.appUrl.trim();

            final uri = Uri.parse(url);
            print("🚀 Going to  $uri");

            await launchUrl(
              uri,
              mode: LaunchMode.inAppBrowserView,
            );
            Get.toNamed(Routes.SETTINGS);

          },
          child: Container(
            width: 52.w,
            height: 52.w,
            decoration: const BoxDecoration(
              color: Color(0xFF1E1E1E),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.settings_outlined,
              color: Colors.white,
              size: 26.sp,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRobuxBar() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 18.h),
      decoration: BoxDecoration(
        color: const Color(0xFF4ECFA8),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.hexagon_outlined, color: Colors.black87, size: 24.sp),
          SizedBox(width: 10.w),
          Text(
            '14',
            style: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.w700,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWideCard({
    required IconData icon,
    required String title,
    required String subtitle,
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
              width: 50.w,
              height: 50.w,
              decoration: const BoxDecoration(
                color: Color(0xFF2A2A2A),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: Colors.white, size: 24.sp),
            ),
            SizedBox(width: 14.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.white54,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGridCard({
    required IconData icon,
    required String title,
    required String subtitle,
    bool showAd = false,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(14.w),
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: 50.w,
                  height: 50.w,
                  decoration: const BoxDecoration(
                    color: Color(0xFF2A2A2A),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, color: Colors.white, size: 24.sp),
                ),
                if (showAd)
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 5.w, vertical: 2.h),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      child: Text(
                        'AD',
                        style: TextStyle(
                          fontSize: 9.sp,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF4ECFA8),

                        ),
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(height: 12.h),
            Text(
              title,
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 11.sp,
                color: Colors.white54,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
