import 'dart:math';
import 'dart:ui';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ScratchCardController extends GetxController {
  final _box = GetStorage();

  final robuxCount = 0.obs;
  final isScratched = false.obs;
  final wonAmount = 1.obs;

  @override
  void onInit() {
    super.onInit();
    robuxCount.value = _box.read('robux_count') ?? 14;
  }

  void onScratch() {
    if (isScratched.value) return;

    // Random win between 1 to 5 RBX
    wonAmount.value = Random().nextInt(5) + 1;
    isScratched.value = true;
  }

  void addToWallet() {
    robuxCount.value += wonAmount.value;
    _box.write('robux_count', robuxCount.value);

    // Reset card after small delay
    Future.delayed(const Duration(milliseconds: 500), () {
      isScratched.value = false;
      wonAmount.value = 1;
    });

    Get.snackbar(
      '🎉 Added!',
      '${wonAmount.value} RBX added to your wallet!',
      backgroundColor: const Color(0xFF4ECFA8),
      colorText: const Color(0xFF000000),
      duration: const Duration(seconds: 2),
    );
  }
}