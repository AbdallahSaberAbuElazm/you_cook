import 'package:flutter/material.dart';

class IconWithBackground extends StatelessWidget {
  final Color backgroundColor;
  final double containerWidth;
  final double containerHeight;
  final IconData icon;
  final Color iconColor;
  final double iconSize;
  final dynamic onPressed;
  const IconWithBackground(
      {super.key,
      required this.backgroundColor,
      required this.containerWidth,
      required this.containerHeight,
      required this.icon,
      required this.iconColor,
      required this.iconSize,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: InkWell(
        onTap: onPressed,
        child: Container(
          alignment: Alignment.center,
          width: containerWidth,
          height: containerHeight,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          child: Icon(
            icon,
            color: iconColor,
            size: iconSize,
          ),
        ),
      ),
    );
  }
}
