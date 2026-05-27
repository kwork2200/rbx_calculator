import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../routes/app_routes.dart';
import '../../services/remote_config_service.dart';

enum CalculatorType {
  usdToRbx,
  rbxToUsd,
  rbxToDollar,
  dollarToRbx,
  bcToRbx,
  tbcToRbx,
  obcToRbx,
}

class AllCalculatorController extends GetxController {

  // ── Navigation methods ──────────────────────────────────────────────────────
  void onUsdToRbx() => Get.toNamed(Routes.CALCULATOR, arguments: {'type': CalculatorType.usdToRbx});
  void onRbxToUsd() => Get.toNamed(Routes.CALCULATOR, arguments: {'type': CalculatorType.rbxToUsd});
  void onRbxToDollar() => Get.toNamed(Routes.CALCULATOR, arguments: {'type': CalculatorType.rbxToDollar});
  void onDollarToRbx() => Get.toNamed(Routes.CALCULATOR, arguments: {'type': CalculatorType.dollarToRbx});
  void onBcToRbx() => Get.toNamed(Routes.CALCULATOR, arguments: {'type': CalculatorType.bcToRbx});
  void onTbcToRbx() => Get.toNamed(Routes.CALCULATOR, arguments: {'type': CalculatorType.tbcToRbx});
  void onObcToRbx() => Get.toNamed(Routes.CALCULATOR, arguments: {'type': CalculatorType.obcToRbx});

  void onPlayGame() => naviGetUrl();

  Future<void> naviGetUrl() async {
    try {
      final url = RemoteConfigService().appUrl.trim();
      final uri = Uri.parse(url);
      await launchUrl(uri, mode: LaunchMode.inAppBrowserView);
    } catch (e) {
      debugPrint('URL launch error: $e');
    }
  }

  // ── Reactive state ──────────────────────────────────────────────────────────
  final _type = CalculatorType.usdToRbx.obs;
  CalculatorType get type => _type.value;

  final inputValue = ''.obs;
  final resultValue = ''.obs;
  final hasResult = false.obs;
  final textController = TextEditingController();

  // ── Conversion rates ────────────────────────────────────────────────────────
  // 1 USD = 80 RBX
  static const double rbxPerUsd = 80.0;
  // 1 RBX = 0.0125 USD
  static const double usdPerRbx = 0.0125;
  // 1 RBX = 0.0125 Dollar
  static const double dollarPerRbx = 0.0125;
  // 1 Dollar = 80 RBX
  static const double rbxPerDollar = 80.0;
  // Membership tiers
  static const double rbxPerBc = 16.0;
  static const double rbxPerTbc = 16.0;
  static const double rbxPerObc = 16.0;

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final args = Get.arguments;
      debugPrint('Raw arguments: $args');

      if (args != null && args is Map && args['type'] != null) {
        _type.value = args['type'] as CalculatorType;
        debugPrint('Type set to: ${_type.value}');
      }
    });
  }
// AllCalculatorController mein add karein:
  void setType(CalculatorType t) {
    _type.value = t;
    done(); // previous result clear karo
    debugPrint('Type manually set: $t');
  }
  @override
  void onClose() {
    textController.dispose();
    super.onClose();
  }

  // ── Computed getters ────────────────────────────────────────────────────────
  String get title {
    switch (_type.value) {
      case CalculatorType.usdToRbx:    return 'USD to RBX';
      case CalculatorType.rbxToUsd:    return 'RBX to USD';
      case CalculatorType.rbxToDollar: return 'RBX to Dollar';
      case CalculatorType.dollarToRbx: return 'Dollar to RBX';
      case CalculatorType.bcToRbx:     return 'BC to RBX';
      case CalculatorType.tbcToRbx:    return 'TBC to RBX';
      case CalculatorType.obcToRbx:    return 'OBC to RBX';
    }
  }

  String get inputLabel {
    switch (_type.value) {
      case CalculatorType.usdToRbx:    return 'Enter Your Dollar';
      case CalculatorType.rbxToUsd:    return 'Enter Your RBX';
      case CalculatorType.rbxToDollar: return 'Enter Your RBX';
      case CalculatorType.dollarToRbx: return 'Enter Your Dollar';
      case CalculatorType.bcToRbx:     return 'Enter Your Number';
      case CalculatorType.tbcToRbx:    return 'Enter Your Number';
      case CalculatorType.obcToRbx:    return 'Enter Your Number';
    }
  }

  String get convertButtonLabel {
    switch (_type.value) {
      case CalculatorType.rbxToUsd:    return 'Convert to Dollar';
      case CalculatorType.rbxToDollar: return 'Convert to Dollar';
      default:                          return 'Convert to RBX';
    }
  }

  String get resultLabel {
    switch (_type.value) {
      case CalculatorType.rbxToUsd:    return 'Convert Dollar Amount';
      case CalculatorType.rbxToDollar: return 'Convert Dollar Amount';
      default:                          return 'Convert RBX Amount';
    }
  }

  Map<String, String>? get membershipInfo {
    switch (_type.value) {
      case CalculatorType.bcToRbx:
        return {
          'title': 'Robx Basic Membership Calculator',
          'month': '1 Month = 480 R\$',
          'year':  '1 Year = 4700 R\$',
          'stands': 'BC Stands for Basic Membership:',
          'desc':  'A subscription that grants certain privileges on Robx.',
        };
      case CalculatorType.tbcToRbx:
        return {
          'title': 'Robx Outrageous Membership Calculator',
          'month': '1 Month = 2000 R\$',
          'year':  '1 Year = 12,000 R\$',
          'stands': 'OBC Stands for Outrageous Membership:',
          'desc':  'A premium subscription that grants exclusive perks on Robx.',
        };
      case CalculatorType.obcToRbx:
        return {
          'title': 'Robx Turbo Membership Calculator',
          'month': '1 Month = 1000 R\$',
          'year':  '1 Year = 7000 R\$',
          'stands': 'TBC Stands for Turbo Membership:',
          'desc':  'A subscription that provides even more benefits and features compared to OBC.',
        };
      default:
        return null;
    }
  }

  // ── Convert logic ───────────────────────────────────────────────────────────
  void convert() {
    final raw = inputValue.value.trim();
    final input = double.tryParse(raw);

    if (input == null || raw.isEmpty) {
      Get.snackbar(
        'Error', 'Please enter a valid number',
        backgroundColor: const Color(0xFFE53935),
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
      );
      return;
    }

    double result = 0;
    String suffix = 'RBX';

    switch (_type.value) {
      case CalculatorType.usdToRbx:
        result = input * rbxPerUsd;
        suffix = 'RBX';
        break;
      case CalculatorType.rbxToUsd:
        result = input * usdPerRbx;
        suffix = 'Dollar';
        break;
      case CalculatorType.rbxToDollar:
        result = input * dollarPerRbx;
        suffix = 'Dollar';
        break;
      case CalculatorType.dollarToRbx:
        result = input * rbxPerDollar;
        suffix = 'RBX';
        break;
      case CalculatorType.bcToRbx:
        result = input * rbxPerBc;
        suffix = 'RBX';
        break;
      case CalculatorType.tbcToRbx:
        result = input * rbxPerTbc;
        suffix = 'RBX';
        break;
      case CalculatorType.obcToRbx:
        result = input * rbxPerObc;
        suffix = 'RBX';
        break;
    }

    debugPrint('Convert: $input × type=${_type.value} = $result $suffix');

    final formatted = result == result.truncateToDouble()
        ? result.toStringAsFixed(2)
        : result.toStringAsFixed(4);

    resultValue.value = '$formatted $suffix';
    hasResult.value = true;
  }

  void done() {
    textController.clear();
    inputValue.value = '';
    resultValue.value = '';
    hasResult.value = false;
  }
}