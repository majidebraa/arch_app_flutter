import 'package:arch_app_flutter/common/app_bar_main_widget.dart';
import 'package:arch_app_flutter/constant/app_colors.dart';
import 'package:arch_app_flutter/core/extension/context_extension.dart';
import 'package:arch_app_flutter/features/detail/detail_page.dart';
import 'package:arch_app_flutter/features/home/user_list_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constant/app_strings.dart';
import '../../data/local/local_data.dart';
import '../../data/model/user.dart';
import '../../data/remote/api_response.dart';
import 'home_view_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<User>? userList = [];

  @override
  void initState() {
    WidgetsBinding
        .instance
        .addPostFrameCallback((_){
      context.read<HomeViewModel>().getUsersList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ApiResponse apiResponse = context.watch<HomeViewModel>().response;
    return Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: const AppBarMainWidget(title: AppStrings.appName,),
        body: usersUI(apiResponse)
    );
  }

  Widget usersUI(ApiResponse apiResponse){
    userList = apiResponse.data as List<User>?;
    switch (apiResponse.status) {
      case Status.initial:
      case Status.loading:
        return const Center(child: CircularProgressIndicator());
      case Status.completed:
        return RefreshIndicator(
          onRefresh: () {
            return context.read<HomeViewModel>().getUsersList();
          },
          child: Builder(builder: (context) => UserListViewWidget(
              userList: userList!,
              onFolderItemClick: onUserItemClick
          )),
        );
      case Status.error:
        return RefreshIndicator(
          onRefresh: () {
            return context.read<HomeViewModel>().getUsersList();
          },
          child: context.statusErrorHandling(
              apiResponse.message!,
              context.read<LocalData>()
          ),
        );
      default:
        return const Center(
          child: Text(AppStrings.loading),
        );
    }
  }

  void onUserItemClick(int position){
    context.slidePushTransition(DetailPage(login: userList![position].login!,));
  }
}
