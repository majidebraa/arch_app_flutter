import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'constant/app_colors.dart';
import 'core/utility.dart';
import 'features/splash/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: AppColors.primaryColor,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            pageTransitionsTheme: const PageTransitionsTheme(
                builders: {
                  TargetPlatform.android: CupertinoPageTransitionsBuilder(),
                  TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
                }
            ),
          useMaterial3: true,
          colorScheme: ColorScheme.fromSwatch().copyWith(
              secondary: AppColors.accentColor
          ).copyWith(
              primary: Utility.createMaterialColor(
                  AppColors.primaryColor
              ),
              background: AppColors.whiteColor
          ),
        ),
        builder: EasyLoading.init(),
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashPage(),
        },
      );
  }
}
