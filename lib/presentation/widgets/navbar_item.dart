import 'package:flutter/material.dart';

class IconNavBar extends StatelessWidget {
  final String? iconPath;

  final Icon? icon;

  const IconNavBar({
    this.iconPath,
    this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        icon != null
            ? icon!
            : iconPath != null
                ? Image.asset(
                    iconPath!,
                    height: 20,
                    width: 20,
                    fit: BoxFit.cover,
                  )
                : const SizedBox(),
      ],
    );
  }
}
