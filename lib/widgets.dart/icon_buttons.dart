import 'package:flutter/material.dart';

class IconButtons extends StatelessWidget {
  final IconData icon;
  final dynamic color;
  final double iconSize;
  final Function() onPressed;
  const IconButtons(
      {Key? key,
      required this.icon,
      required this.iconSize,
      required this.onPressed,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: IconButton(
      icon: Icon(icon),
      iconSize: iconSize,
      onPressed: onPressed,
      color: color,
    ));
  }
}
