import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SpinWheelController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final _box = GetStorage();

  late AnimationController animController;
  late Animation<double> animation;

  final robuxCount = 0.obs;
  final isSpinning = false.obs;
  final hasResult = false.obs;
  final wonAmount = 0.obs;
  final currentAngle = 0.0.obs;

  final List<int> segments = [600, 475, 100, 300, 325, 0, 525, 400, 425, 225];

  @override
  void onInit() {
    super.onInit();
    robuxCount.value = _box.read('robux_count') ?? 14;

    animController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );

    animController.addListener(() {
      currentAngle.value = animation.value;
    });

    animController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        isSpinning.value = false;
        _calculateResult();
      }
    });
  }

  void spinWheel() {
    if (isSpinning.value) return;
    hasResult.value = false;
    isSpinning.value = true;

    final random = Random();
    final extraSpins = (5 + random.nextInt(5)) * 2 * pi;
    final targetSegment = random.nextInt(segments.length);
    final segmentAngle = (2 * pi) / segments.length;
    final targetAngle = extraSpins + (targetSegment * segmentAngle);

    animation = Tween<double>(
      begin: currentAngle.value,
      end: currentAngle.value + targetAngle,
    ).animate(CurvedAnimation(
      parent: animController,
      curve: Curves.decelerate,
    ));

    animController.reset();
    animController.forward();
  }

  void _calculateResult() {
    final segmentAngle = (2 * pi) / segments.length;
    // Pointer is at top (pi*1.5 from right = top)
    final normalizedAngle =
    (currentAngle.value % (2 * pi));
    final pointerAngle = (2 * pi - normalizedAngle + (pi * 1.5)) % (2 * pi);
    final index = (pointerAngle / segmentAngle).floor() % segments.length;
    wonAmount.value = segments[index];
    hasResult.value = true;
  }

  void addToWallet() {
    robuxCount.value += wonAmount.value;
    _box.write('robux_count', robuxCount.value);
    hasResult.value = false;

    Get.snackbar(
      '🎉 Added!',
      '${wonAmount.value} RBX added to your wallet!',
      backgroundColor: const Color(0xFF4ECFA8),
      colorText: Colors.black,
      duration: const Duration(seconds: 2),
    );
  }

  @override
  void onClose() {
    animController.dispose();
    super.onClose();
  }
}