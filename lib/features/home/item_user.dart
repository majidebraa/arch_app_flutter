import 'package:flutter/material.dart';
import '../../constant/app_colors.dart';
import '../../data/model/user.dart';


typedef OnItemClick = Function(int position);

class ItemUser extends StatefulWidget {
  final User user;
  final OnItemClick onItemClick;
  final int position;
  const ItemUser({
    Key? key,
    required this.user,
    required this.onItemClick,
    required this.position
  }) : super(key: key);

  @override
  State<ItemUser> createState() => _ItemUserState();
}

class _ItemUserState extends State<ItemUser> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>widget.onItemClick(widget.position),
      child: Container(
        height: 65,
        padding: const EdgeInsets.all(0),
        child: Card(
          color: AppColors.greyLightColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children:  [
              const SizedBox(
                width: 8,
              ),
              CircleAvatar(
                child: ClipOval(child: Image.network(widget.user.avatarUrl!))
              ),
              const SizedBox(
                width: 8,
              ),
              Text(widget.user.login!)
            ],
          ),
        ),
      ),
    );
  }
}
