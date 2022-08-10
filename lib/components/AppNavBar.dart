import 'package:flutter/material.dart';

class AppNavBar extends StatelessWidget implements PreferredSizeWidget {
  final String label;
  final Widget? actionWidget;

  AppNavBar({required this.label, this.actionWidget});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        label,
        style: TextStyle(fontSize: 24),
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      actions: [actionWidget ?? Container()],
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(AppBar().preferredSize.height);
}