// all_calculator_binding.dart
import 'package:get/get.dart';
import 'all_calculator_controller.dart';

class AllCalculatorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllCalculatorController>(
          () => AllCalculatorController(),
      fenix: true,
    );
  }
}