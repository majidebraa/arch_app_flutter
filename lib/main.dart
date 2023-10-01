import 'package:arch_app_flutter/data/remote/remote_module_imp.dart';
import 'package:arch_app_flutter/features/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'constant/app_colors.dart';
import 'core/utility.dart';
import 'data/local/local_data.dart';
import 'data/remote/header_helper.dart';
import 'data/repository/user_repository.dart';
import 'features/detail/detail_view_model.dart';
import 'features/splash/splash_page.dart';
import 'features/splash/splash_view_model.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
      providers: [
        Provider<LocalData>(create: (context)=>LocalData()),
        Provider<HeaderHelper>(create: (context)=>HeaderHelper()),
        Provider<RemoteModuleImpl>(create: (context) => RemoteModuleImpl(
            localData: context.read<LocalData>())
        ),
        Provider<UserRepository>(create: (context) => UserRepository(
            remoteModule: context.read<RemoteModuleImpl>(),
            localData: context.read<LocalData>(),
            headerHelper: context.read<HeaderHelper>())
        ),
        ChangeNotifierProvider<SplashViewModel>(
            create: (context)=>SplashViewModel(
                userRepository: context.read<UserRepository>(),
                localData: context.read<LocalData>())
        ),
        ChangeNotifierProvider<HomeViewModel>(
            create: (context)=>HomeViewModel(
                userRepository: context.read<UserRepository>(),
                localData: context.read<LocalData>())
        ),
        ChangeNotifierProvider<DetailViewModel>(
            create: (context)=>DetailViewModel(
                userRepository: context.read<UserRepository>(),
                localData: context.read<LocalData>())
        ),
      ],
      child: MaterialApp(
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
      ),
    );
  }
}
