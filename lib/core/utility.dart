import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart'
    show TargetPlatform, defaultTargetPlatform, kDebugMode, kIsWeb;


class Utility{

  static String getTime(){
    DateTime now = DateTime.now();
    String time = "${now.hour.toString().padLeft(2, '0')}:"
        "${now.minute.toString().padLeft(2, '0')}";
    return time;
  }

  static bool isAndroid(){
    return Platform.isAndroid;
  }
  static bool isMobile(){
    return Platform.isAndroid || Platform.isIOS;
  }
  static bool isWeb(){
    return kIsWeb;
  }
  static bool isDesktop(){
    return (Platform.isWindows||Platform.isLinux||Platform.isMacOS);
  }

  static bool isWebDesktop(){
    return kIsWeb && !isWebMobile();
  }
  static int get(BuildContext context){
    return MediaQuery.of(context).size.width~/60;
  }
  static bool isWebMobile(){
    return kIsWeb && (defaultTargetPlatform == TargetPlatform.iOS ||
        defaultTargetPlatform == TargetPlatform.android);
  }

  static void printLog(Object? object){
    if (kDebugMode) {
      print(object);
    }
  }

  static Future<bool> checkConnectivity()async{
    var connectivityResult = await (Connectivity().checkConnectivity());
    Utility.printLog("connectivityResult$connectivityResult");
    if (connectivityResult == ConnectivityResult.mobile
        || connectivityResult == ConnectivityResult.wifi
        || connectivityResult == ConnectivityResult.ethernet) {
      return true;
    }
    return false;
  }

  static MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    final swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }


}


enum SnackBarState {
  error,
  info,
  success,
}

enum WindowsWebViewState{
  notSupport,
  popUp,
  inApp
}