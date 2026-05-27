import 'package:get/get.dart';
import 'memes_controller.dart';

class MemesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MemesController>(() => MemesController());
  }
}
