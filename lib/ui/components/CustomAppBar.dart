import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({Key? key, this.rightIcon, this.leading, required this.title, this.onpressed}) : super(key: key);
  final String title;
  final Widget? leading;
  final void Function()? onpressed;
  final Icon? rightIcon;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(color: Colors.black, fontSize: 14.sp),
      ),
      elevation: 5,
      leading: leading,
      actions: [
        rightIcon != null ? IconButton(icon: rightIcon!, color: Colors.purple, onPressed: onpressed) : SizedBox(),
      ],
      backgroundColor: Colors.white,
      centerTitle: false,
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);
}
