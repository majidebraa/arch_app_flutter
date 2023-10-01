import 'package:flutter/material.dart';
import '../../../constant/app_images.dart';
import '../../../constant/app_strings.dart';

class AppNameSplashWidget extends StatelessWidget {
  const AppNameSplashWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
                AppImages.icLogo,
                width: 150,
                height: 150,
              ),
            const Text(
                AppStrings.appName,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16
                )
            ),

          ],
        ),
    );
  }
}