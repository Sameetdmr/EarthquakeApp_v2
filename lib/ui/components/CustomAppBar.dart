import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({Key? key, required this.rightIcon, this.leading, required this.title, required this.onpressed}) : super(key: key);
  final String title;
  Widget? leading;
  Function onpressed;
  Icon rightIcon;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(color: Colors.black, fontSize: 24.sp),
      ),
      elevation: 5,
      leading: leading,
      actions: [
        IconButton(
            icon: rightIcon,
            color: Colors.purple,
            onPressed: () {
              onpressed();
            }),
      ],
      backgroundColor: Colors.white,
      centerTitle: false,
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(0.07.sh);
}
