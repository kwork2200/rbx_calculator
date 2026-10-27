import 'package:get/get.dart';
import 'splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    // Eager instance: SplashView controller ko use nahi karta, is liye lazyPut
    // se onInit kabhi trigger nahi hota aur app splash par atak jati hai.
    Get.put<SplashController>(SplashController());
  }
}