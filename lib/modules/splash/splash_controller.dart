import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../ads/app_open_ad_manager.dart';
import '../../routes/app_routes.dart';
import '../../services/remote_config_service.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    navigateAfterDelay();
  }

  void navigateAfterDelay() async {
    await Future.delayed(const Duration(seconds: 3));
    // final url = RemoteConfigService.instance.appUrl.trim();
    //
    // final uri = Uri.parse(url);
    // print("🚀 Going to  $uri");
    //
    // await launchUrl(
    //   uri,
    //   mode: LaunchMode.inAppBrowserView,
    // );

    // Ad load hone ka intezaar karein (max 5s), phir dikhayein — warna
    // cold start par ad load hote hi skip ho jati hai.
    await AppOpenAdManager.instance.waitUntilAdReady();

    AppOpenAdManager.instance.showAdIfAvailable(
      onAdDismissed: _goToHome,
    );
  }

  void _goToHome() {
    if (Get.currentRoute == Routes.HOME) return;
    Get.offAllNamed(Routes.HOME);
  }
}