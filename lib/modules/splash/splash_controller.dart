import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
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
    final url = RemoteConfigService().appUrl.trim();

    final uri = Uri.parse(url);
    print("🚀 Going to  $uri");

    await launchUrl(
      uri,
      mode: LaunchMode.inAppBrowserView,
    );
    Get.offAllNamed(Routes.HOME);
  }

}