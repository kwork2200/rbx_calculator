import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../ads/ad_on_back_wrapper.dart';
import '../../ads/bottom_native_ad_bar.dart';
import '../../ads/hybrid_native_ad_widget.dart';
import '../../utils/functions.dart';
import 'all_calculator_controller.dart';

class AllCalculatorView extends GetView<AllCalculatorController> {
  const AllCalculatorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: const BottomNativeAdBar(),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A1A1A),
        elevation: 0,
        leading: GestureDetector(
          onTap: () => handleBackWithAd(context),
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
          'All Calculator',
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
            Row(
              children: [
                Expanded(
                  child: _buildCalcCard(
                    iconTopLabel: '\$',
                    iconBottomLabel: 'R',
                    title: 'USD to RBX',
                    subtitle: 'Calculate is USD to RBX Value are converted',
                    onTap: () async {
                      await showAdBeforeNavigation(context);
                      controller.onUsdToRbx();
                    },
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: _buildCalcCard(
                    iconTopLabel: 'R',
                    iconBottomLabel: '\$',
                    title: 'RBX to USD',
                    subtitle: 'Calculate is RBX to USD Value are convert',
                    onTap: () async {
                      await showAdBeforeNavigation(context);
                      controller.onRbxToUsd();
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
                  child: _buildCalcCard(
                    iconTopLabel: 'R',
                    iconBottomLabel: '\$',
                    title: 'RBX to Dollar',
                    subtitle: 'Calculate is RBX to Dollar Value are convert',
                    onTap: () async {
                      await showAdBeforeNavigation(context);
                      controller.onRbxToDollar();
                    },
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: _buildCalcCard(
                    iconTopLabel: '\$',
                    iconBottomLabel: 'R',
                    title: 'Dollar to RBX',
                    subtitle: 'Calculate is Dollar to RBX Value are convert',
                    onTap: () async {
                      await showAdBeforeNavigation(context);
                      controller.onDollarToRbx();
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
                  child: _buildCalcCard(
                    iconTopLabel: 'B',
                    iconBottomLabel: 'R',
                    title: 'BC to RBX',
                    subtitle: 'Calculate is BC to RBX Value are convert',
                    onTap: () async {
                      await showAdBeforeNavigation(context);
                      controller.onBcToRbx();
                    },
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: _buildCalcCard(
                    iconTopLabel: 'T',
                    iconBottomLabel: 'R',
                    title: 'TBC to RBX',
                    subtitle: 'Calculate is TBC to RBX Value are convert',
                    onTap: () async {
                      await showAdBeforeNavigation(context);
                      controller.onTbcToRbx();
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
                  child: _buildCalcCard(
                    iconTopLabel: 'O',
                    iconBottomLabel: 'R',
                    title: 'OBC to RBX',
                    subtitle: 'Calculate is OBC to RBX Value are convert',
                    onTap: () async {
                      await showAdBeforeNavigation(context);
                      controller.onObcToRbx();
                    },
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: _buildCalcCard(
                    iconData: Icons.sports_esports_outlined,
                    title: 'Play Game',
                    subtitle: 'Play smart, Play hard',
                    showAd: true,
                    onTap: () async {
                      await showAdBeforeNavigation(context);
                      controller.onPlayGame();
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            HybridNativeAdWidget(),
          ],
        ),
      ),
    );
  }

    Widget _buildCalcCard({
    String? iconTopLabel,
    String? iconBottomLabel,
    IconData? iconData,
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
            // Icon with optional AD badge
            Stack(
              children: [
                Container(
                  width: 54.w,
                  height: 54.w,
                  decoration: const BoxDecoration(
                    color: Color(0xFF2A2A2A),
                    shape: BoxShape.circle,
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(25),
                      child: SvgPicture.asset("assets/reverse_icon.svg")),
                ),
                if (showAd)
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 5.w, vertical: 2.h),
                      decoration: BoxDecoration(
                        color: const Color(0xFF4ECFA8),
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      child: Text(
                        'AD',
                        style: TextStyle(
                          fontSize: 9.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(height: 14.h),
            Text(
              title,
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 5.h),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 11.sp,
                color: Colors.white54,
                height: 1.4,
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