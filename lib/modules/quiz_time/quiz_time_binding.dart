import 'package:get/get.dart';
import 'quiz_time_controller.dart';

class QuizTimeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuizTimeController>(() => QuizTimeController());
  }
}