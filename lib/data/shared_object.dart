import 'package:arch_app_flutter/data/remote/header_helper.dart';
import 'package:arch_app_flutter/data/remote/remote_module_imp.dart';
import 'package:arch_app_flutter/data/repository/user_repository.dart';

import 'local/local_data.dart';

class SharedObject{
  static SharedObject sharedObject = SharedObject();
  LocalData localData = LocalData();
  late RemoteModuleImpl remoteModule =  RemoteModuleImpl(localData: localData);
  HeaderHelper headerHelper =  HeaderHelper();
  late UserRepository userRepository = UserRepository(
      remoteModule: remoteModule,
      localData: localData,
      headerHelper: headerHelper
  );
}