import 'package:flutter/material.dart';

class AppBarPokedex extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final IconData? leadingIcon;
  final IconData? actionIcon;

  const AppBarPokedex({
    super.key,
    required this.title,
    this.leadingIcon,
    this.actionIcon,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: const Text(
        'Pokedex',
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w800,
          letterSpacing: 1,
          color: Color.fromRGBO(210, 35, 42, 1),
        ),
      ),
      leading: Icon(leadingIcon),
      actions: [Icon(actionIcon)],
    );
  }

  @override
  // TOO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60);
}
