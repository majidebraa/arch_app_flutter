import 'package:arch_app_flutter/common/app_bar_general_widget.dart';
import 'package:arch_app_flutter/constant/app_strings.dart';
import 'package:flutter/material.dart';

class AvatarPage extends StatefulWidget {
  final String avatarUrl;
  const AvatarPage({super.key, required this.avatarUrl});

  @override
  State<AvatarPage> createState() => _AvatarPageState();
}

class _AvatarPageState extends State<AvatarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarGeneralWidget(
        title: AppStrings.userAvatar,
        backIcon: Icons.close,
      ),
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Image.network(
            widget.avatarUrl,
            fit: BoxFit.fill,
          ),
        )
    );
  }
}
