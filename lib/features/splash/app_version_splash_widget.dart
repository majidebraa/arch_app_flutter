import 'package:flutter/material.dart';
import '../../../constant/app_colors.dart';
import '../../../constant/app_strings.dart';

class AppVersionSplashWidget extends StatelessWidget {
  const AppVersionSplashWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text(AppStrings.version + AppStrings.versionName,
              style: TextStyle(
                color: AppColors.blackColor,
                fontSize: 14,
              )
          ),
          SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}