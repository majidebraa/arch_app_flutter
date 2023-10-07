import 'package:arch_app_flutter/data/repository/user_repository.dart';
import 'package:arch_app_flutter/features/detail/bloc/detail_bloc.dart';
import 'package:arch_app_flutter/features/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'constant/app_colors.dart';
import 'core/utility.dart';
import 'data/shared_instance.dart';
import 'features/splash/splash_page.dart';

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
    return RepositoryProvider(
      create: (BuildContext context)=> UserRepository(
          remoteModule: SharedInstance.instance.remoteModule,
          localData: SharedInstance.instance.localData,
          headerHelper: SharedInstance.instance.headerHelper
      ),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<HomeBloc>(
            create: (BuildContext context) => HomeBloc(userRepository: context.read<UserRepository>()),
          ),
          BlocProvider<DetailBloc>(
            create: (BuildContext context) => DetailBloc(userRepository: context.read<UserRepository>()),
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
      ),
    );
  }
}
