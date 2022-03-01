import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  const CircleButton({
    Key? key,
    required this.icon,
    required this.onTap,
    required this.iconSize,
  }) : super(key: key);
  final IconData icon;
  final Function onTap;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.all(6),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: () => onTap(),
        icon: Icon(
          icon,
          size: iconSize,
          color: Colors.black,
        ),
      ),
    );
  }
}
