import 'package:flutter/material.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Function() onBackButtonPressed;
  final Function() onOptionsPressed;

  const TopBar({
    super.key,
    required this.title,
    required this.onBackButtonPressed,
    required this.onOptionsPressed,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: onBackButtonPressed,
      ),
      title: Text(title),
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.more_vert),
          onPressed: onOptionsPressed,
        ),
      ],
    );
  }
}
