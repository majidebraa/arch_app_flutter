import 'package:flutter/material.dart';
import '../../constant/app_colors.dart';

class AppBarGeneralWidget extends StatelessWidget implements  PreferredSizeWidget {
  const AppBarGeneralWidget({Key? key, required this.title, this.backIcon = Icons.arrow_back_ios}) : super(key: key);
  final String title;
  final IconData backIcon;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                Text(
                  title,
                  style:  const TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 16,
                  ),
                ),
              ],
            ),
        ),
        actions:  <Widget>[
          IconButton(
            icon:  const SizedBox(
                height: double.infinity,
            ),
            onPressed: () {
            },
          ),
        ],
        leading: IconButton(
          icon: SizedBox(
              height: double.infinity,
              width: 50,
              child: Icon(backIcon, size: 30,color: Colors.white,)
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        automaticallyImplyLeading: false

    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
