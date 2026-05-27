/*
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:rbx_calculator/routes/app_pages.dart';
import 'package:rbx_calculator/routes/app_routes.dart';

import 'core/theme/app_string.dart';
import 'core/theme/app_theme.dart';
import 'modules/theme/theme_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp();

  final themeController = Get.put(ThemeController());
  await themeController.loadTheme();
  
  runApp(
    ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MyApp();
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      builder: (controller) => GetMaterialApp(
        title: AppString.hourlyChime,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: controller.themeMode,
        initialRoute: Routes.SPLASH,
        getPages: AppPages.routes,
      ),
    );
  }
}

*/
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rbx_calculator/routes/app_pages.dart';
import 'package:rbx_calculator/routes/app_routes.dart';
import 'package:rbx_calculator/services/firebase_init_service.dart';
import 'package:rbx_calculator/services/remote_config_service.dart';

import 'core/theme/app_string.dart';
import 'core/theme/app_theme.dart';
import 'firebase_options.dart';
import 'modules/theme/theme_controller.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    print('✅ Firebase initialized successfully');

    await RemoteConfigService().initialize();

    print('✅ Remote Config initialized');

  } catch (e) {
    print('❌ Firebase initialization error: $e');
  }

  runApp(const MyApp());

  Future.microtask(() async {
    try {
      await FirebaseInitService.initializeAdSenseConfig();

      await FirebaseInitService.testAdSenseConfig();

      print('✅ AdSense initialized');
    } catch (e) {
      print('❌ AdSense initialization error: $e');
    }
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ThemeController());

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppString.hourlyChime,
          theme: AppTheme.lightTheme,
          themeMode: ThemeMode.dark,
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
        );
        // return GetBuilder<ThemeController>(
        //   builder: (controller) => GetMaterialApp(
        //     title: AppString.hourlyChime,
        //     debugShowCheckedModeBanner: false,
        //     theme: AppTheme.lightTheme,
        //     darkTheme: AppTheme.darkTheme,
        //     themeMode: controller.themeMode,
        //     initialRoute: Routes.SPLASH,
        //     getPages: AppPages.routes,
        //   ),
        // );
      },
    );
  }
}