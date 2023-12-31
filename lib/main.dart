import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kf_ocs/controllers/keyboard_controller.dart';
import 'package:kf_ocs/ui/splash_screen.dart';
import 'package:kf_ocs/utils/app_colors.dart';
import 'package:kf_ocs/utils/app_strings.dart';
import 'package:kf_ocs/utils/screen_unit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(KeyboardController());
    return ScreenUtilInit(
        designSize: getNormalSize(context),
        minTextAdapt: true,
        splitScreenMode: true,
        useInheritedMediaQuery: true,
        builder: (BuildContext context, Widget? child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            defaultTransition: Transition.fadeIn,
            title: AppStrings.appName,
            theme: ThemeData(
              platform: TargetPlatform.iOS,
              primaryColor: AppColors.standardBtnColor,
              iconTheme: const IconThemeData(color: Colors.white),
            ),
            // home: const KeyboardVisibilityProvider(child: SplashScreen())
            home: const SplashScreen(),
          );
        });
  }
}
