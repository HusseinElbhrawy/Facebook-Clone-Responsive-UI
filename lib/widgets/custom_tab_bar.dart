import 'package:flutter/material.dart';

import '../config/palette.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    Key? key,
    required this.onTap,
    required this.selectedIndex,
    required this.icons,
  }) : super(key: key);
  final Function onTap;
  final List icons;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      padding: const EdgeInsets.all(0),
      onTap: (index) => onTap(index),
      tabs: List.generate(
        icons.length,
        (index) => Icon(
          icons[index],
          color: index == selectedIndex ? Palette.facebookBlue : Colors.black45,
          size: 30,
        ),
      ),
    );
  }
}
