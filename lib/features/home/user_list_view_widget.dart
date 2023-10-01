import 'package:flutter/cupertino.dart';
import '../../data/model/user.dart';
import 'item_user.dart';

typedef OnUserItemClick = Function(int position);

class UserListViewWidget extends StatefulWidget {
  final List<User> userList;
  final OnUserItemClick onFolderItemClick;
  const UserListViewWidget({
    Key? key,
    required this.userList,
    required this.onFolderItemClick
  }) : super(key: key);

  @override
  State<UserListViewWidget> createState() => _UserListViewWidgetState();
}

class _UserListViewWidgetState extends State<UserListViewWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: ListView.builder(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: widget.userList.length,
          itemBuilder: (context,position){
            return ItemUser(
                user: widget.userList[position],
                onItemClick: widget.onFolderItemClick,
                position: position
            );
          }
      ),
    );
  }
}
