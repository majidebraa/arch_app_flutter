import 'package:flutter/material.dart';
import '../../../constant/app_colors.dart';


class AppBarMainWidget extends StatefulWidget implements  PreferredSizeWidget {
  final String title;
  const AppBarMainWidget({Key? key, required this.title}) : super(key: key);

  @override
  State<AppBarMainWidget> createState() => _AppBarMainWidgetState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AppBarMainWidgetState extends State<AppBarMainWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                Text(
                  widget.title,
                  style:  const TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const SizedBox(
                height: double.infinity,
                width: 40,
            ),
            onPressed: () {

            },
          ),
        ],
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        automaticallyImplyLeading: false

    );
  }


}
