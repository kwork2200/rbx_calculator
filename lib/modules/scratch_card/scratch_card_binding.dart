import 'package:get/get.dart';
import 'scratch_card_controller.dart';

class ScratchCardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScratchCardController>(() => ScratchCardController());
  }
}