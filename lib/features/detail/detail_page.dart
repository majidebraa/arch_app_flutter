import 'package:arch_app_flutter/common/app_bar_general_widget.dart';
import 'package:arch_app_flutter/constant/app_colors.dart';
import 'package:arch_app_flutter/constant/app_images.dart';
import 'package:arch_app_flutter/core/extension/context_extension.dart';
import 'package:arch_app_flutter/features/detail/avatar_page.dart';
import 'package:arch_app_flutter/features/detail/row_title_value_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constant/app_strings.dart';
import '../../data/local/local_data.dart';
import '../../data/model/user.dart';
import '../../data/remote/api_response.dart';
import 'detail_view_model.dart';

class DetailPage extends StatefulWidget {
  final String login;
  const DetailPage({super.key, required this.login});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> with SingleTickerProviderStateMixin {
  late User? userDetail;
  @override
  void initState() {
    WidgetsBinding
        .instance
        .addPostFrameCallback((_){
      context.read<DetailViewModel>().getUserDetail(widget.login);
    });
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    ApiResponse apiResponse = context.watch<DetailViewModel>().response;
    return Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar:  const AppBarGeneralWidget(title: AppStrings.userProfile),
        body: usersUI(apiResponse)
    );
  }

  Widget usersUI(ApiResponse apiResponse){
    double coverHeight = 280;
    double profileHeight = 80;
    final top = coverHeight - profileHeight/2;

    userDetail = apiResponse.data as User?;
    switch (apiResponse.status) {
      case Status.initial:
      case Status.loading:
        return const Center(child: CircularProgressIndicator());
      case Status.completed:
        return Builder(builder: (context) => RefreshIndicator(
          onRefresh: () {
            return context.read<DetailViewModel>().getUserDetail(widget.login);
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    backgroundWidget(coverHeight),
                    avatarWidget(top, profileHeight),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                RowTitleValueWidget(
                    title: userDetail?.login,
                    iconData: Icons.contact_page,
                    onRowClick: (){}
                ),
                RowTitleValueWidget(
                    title: userDetail?.company,
                    iconData: Icons.account_balance,
                    onRowClick: (){}
                ),
                RowTitleValueWidget(
                    title: userDetail?.blog,
                    iconData: Icons.link,
                    onRowClick: (){}
                )
              ],
            ),
          ),
        ));
      case Status.error:
        return RefreshIndicator(
          onRefresh: () {
            return context.read<DetailViewModel>().getUserDetail(widget.login);
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

  Widget avatarWidget(double top, double profileHeight) {
    return Positioned(
              top: top,
              child: GestureDetector(
                child: CircleAvatar(
                  radius: profileHeight/2,
                  backgroundImage: NetworkImage(userDetail!.avatarUrl!),
                ),
                onTap: (){
                  context.easeInOutTransition(AvatarPage(avatarUrl: userDetail!.avatarUrl!));
                },
              ),
          );
  }

  Widget backgroundWidget(double coverHeight) {
    return Container(
            color: AppColors.grey,
            child: Image.asset(
              AppImages.icBackground,
              width: double.infinity,
              height: coverHeight,
              fit: BoxFit.cover
            ),
          );
  }
}
