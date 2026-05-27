import 'package:get/get.dart';
import '../modules/all_calculator/all_calculator_binding.dart';
import '../modules/all_calculator/all_calculator_controller.dart';
import '../modules/all_calculator/all_calculator_view.dart';
import '../modules/all_calculator/calculator_view.dart';
import '../modules/memes/memes_binding.dart';
import '../modules/memes/memes_view.dart';
import '../modules/quiz_time/quiz_result_view.dart';
import '../modules/quiz_time/quiz_time_binding.dart';
import '../modules/quiz_time/quiz_time_view.dart';
import '../modules/scratch_card/ScratchCardView.dart';
import '../modules/scratch_card/scratch_card_binding.dart';
import '../modules/settings/contact_us_view.dart';
import '../modules/settings/privacy_policy_view.dart';
import '../modules/settings/tearm_and_condi.dart';
import '../modules/spin_wheel/spin_wheel_binding.dart';
import '../modules/spin_wheel/spin_wheel_view.dart';
import '../modules/tips/tip_detail_view.dart';
import '../modules/tips/tips_binding.dart';
import '../modules/tips/tips_view.dart';
import 'app_routes.dart';
import '../modules/splash/splash_binding.dart';
import '../modules/splash/splash_view.dart';
import '../modules/home/home_binding.dart';
import '../modules/home/home_view.dart';
import '../modules/settings/settings_binding.dart';
import '../modules/settings/settings_view.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),

    GetPage(
      name: Routes.SETTINGS,
      page: () => const SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: Routes.allCalculatorView,
      page: () => const AllCalculatorView(),
      binding: AllCalculatorBinding(),
    ),
    GetPage(
      name: Routes.scratchCardView,
      page: () => const ScratchCardView(),
      binding: ScratchCardBinding(),
    ),
    GetPage(
      name: Routes.QUIZ_TIME,
      page: () => const QuizTimeView(),
      binding: QuizTimeBinding(),
    ),
    GetPage(
      name: Routes.QUIZ_RESULT,
      page: () => const QuizResultView(),
    ),
    GetPage(
      name: Routes.SPIN_WHEEL,
      page: () => const SpinWheelView(),
      binding: SpinWheelBinding(),
    ),
    GetPage(
      name: Routes.memes,
      page: () =>  MemesView(),
      binding: MemesBinding(),
    ),
    GetPage(
      name:  Routes.tips,
      page: () => TipsView(),
      binding: TipsBinding(),
    ),

    GetPage(
      name:  Routes.tipDetail,
      page: () => const TipDetailView(),
    ),
    GetPage(
      name: Routes.CALCULATOR,
      page: () => const CalculatorView(),
      binding: BindingsBuilder(() {
        if (Get.isRegistered<AllCalculatorController>()) {
          Get.delete<AllCalculatorController>(force: true);
        }
        Get.put<AllCalculatorController>(
          AllCalculatorController(),
          permanent: false,
        );
      }),
    ),

    GetPage(
      name: Routes.PRIVACY_POLICY,
      page: () => const PrivacyPolicyView(),
    ),
    GetPage(
      name: Routes.TERMS_CONDITIONS,
      page: () => const TermsConditionsView(),
    ),
    GetPage(
      name: Routes.CONTACT_US,
      page: () => const ContactUsView(),
    ),
  ];
}
