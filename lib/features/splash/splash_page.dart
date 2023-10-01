import 'dart:async';
import 'package:arch_app_flutter/core/extension/context_extension.dart';
import 'package:arch_app_flutter/features/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../constant/app_colors.dart';
import 'app_name_splash_widget.dart';
import 'app_version_splash_widget.dart';



class SplashPage extends StatefulWidget{

  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();

}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3), () async {
      context.slidePushReplacementTransition(
        const HomePage(),
      );
          }
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: AppColors.primaryColor
    ));
    return const Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Stack(
          children: [
            AppNameSplashWidget(),
            AppVersionSplashWidget(),
          ]
        ),
    );
  }
}



