import 'package:arch_app_flutter/constant/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart' as custom_top_snack_bar;
import '../../constant/app_colors.dart';
import '../../data/local/local_data.dart';
import '../../data/remote/app_exception.dart';
import '../utility.dart';

extension ContextExtension on BuildContext{

  void pushTransition(StatefulWidget page){
    Navigator.of(this).push(PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 500),
      pageBuilder: (BuildContext context,
          Animation<double> animation,
          Animation<double> secondAnimation) {
        return page;
      },)
    );
  }

  void pushReplacementUntilLogin(StatefulWidget page){
    Navigator.of(this)
        .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
  }

  void pushReplacementTransition(StatefulWidget page){
    Navigator.of(this).pushReplacement(PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 500),
      pageBuilder: (BuildContext context,
          Animation<double> animation,
          Animation<double> secondAnimation) {
        return page;
      },)
    );
  }

  void slidePushTransition(StatefulWidget page){
    Navigator.of(this).push(PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (BuildContext context,
            Animation<double> animation,
            Animation<double> secondAnimation) {
          return page;
        },
        transitionsBuilder: (BuildContext context,
            Animation<double> animation,
            Animation<double> secondAnimation,
            Widget child) {
          return SlideTransition(
            position:
            Tween<Offset>(begin: const Offset(1, 0), end: const Offset(0, 0)).animate(animation),
            child: child,
          );
        }));
  }

  void slidePushReplacementTransition(StatefulWidget page){
    Navigator.of(this).pushReplacement(PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (BuildContext context,
            Animation<double> animation,
            Animation<double> secondAnimation) {
          return page;
        },
        transitionsBuilder: (BuildContext context,
            Animation<double> animation,
            Animation<double> secondAnimation,
            Widget child) {
          return SlideTransition(
            position:
            Tween<Offset>(begin: const Offset(1, 0), end: const Offset(0, 0))
                .animate(animation),
            child: child,
          );
        }));
  }

  void easeInOutTransition(StatefulWidget page){
    Navigator.of(this).push(PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (BuildContext context,
            Animation<double> animation,
            Animation<double> secondAnimation) {
          return page;
        },
        transitionsBuilder: (BuildContext context,
            Animation<double> animation,
            Animation<double> secondAnimation,
            Widget child) {
          return SlideTransition(
            position:
            Tween<Offset>(begin: const Offset(0, 1), end: const Offset(0, 0))
                .chain(CurveTween(curve: Curves.fastEaseInToSlowEaseOut)).animate(animation),
            child: child,
          );
        }));
  }

  void showSnackBar(String message,{bool isTop = true}){
    ScaffoldMessenger.of(this).clearSnackBars();
    ScaffoldMessenger.of(this).showSnackBar(
        SnackBar(
          dismissDirection: DismissDirection.startToEnd,
          backgroundColor: AppColors.blueLightColor,
          content: SizedBox(
            height: 30,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  message,style: const TextStyle(fontSize: 16,),
                ),
              ],
            ),
          ),
          duration: const Duration(milliseconds: 1000),
          behavior: SnackBarBehavior.floating,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                  Radius.circular(20)
              )
          ),
          margin: EdgeInsets.only(
              left:20,
              right:20,
              bottom: isTop? MediaQuery.of(this).size.height - 130:20
          ),
        )
    );
  }

  void showTopSnackBar(String message,{SnackBarState state = SnackBarState.error}){
    Widget child;
    switch(state){
      case SnackBarState.error:
        child = CustomSnackBar.error(
          message: message,
        );
        break;

      case SnackBarState.info:
        child = CustomSnackBar.info(
          message: message,
        );
        break;
      case SnackBarState.success:
        child = CustomSnackBar.success(
          message: message,
        );
        break;
    }
    custom_top_snack_bar.showTopSnackBar(
      OverlayState(),
      child,
      displayDuration: const Duration(milliseconds: 400),
    );
  }



  Widget statusErrorHandling(String message,LocalData localData){
    if(message == AppStrings.invalidClient){
      return const Center();
    }
    return  Center(
      child: Text(
        message,
        textDirection: TextDirection.rtl,
      ),
    );
  }

}