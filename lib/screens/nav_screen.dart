import 'package:facebook_clone_responsive_ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../config/palette.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({Key? key}) : super(key: key);

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens = [
    const HomeScreen(),
    const Scaffold(),
    const Scaffold(),
    const Scaffold(),
    const Scaffold(),
    const Scaffold(),
  ];
  static final List icons = [
    Icons.home_outlined,
    Icons.ondemand_video,
    MdiIcons.accountCircleOutline,
    MdiIcons.accountGroupOutline,
    MdiIcons.bellOutline,
    Icons.menu,
  ];
  static int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: icons.length,
      child: Scaffold(
        body: _screens[selectedIndex],
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8),
          child: TabBar(
            padding: const EdgeInsets.all(0),
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            tabs: List.generate(
              icons.length,
              (index) => Icon(
                icons[index],
                color: index == selectedIndex
                    ? Palette.facebookBlue
                    : Colors.black45,
                size: 30,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
