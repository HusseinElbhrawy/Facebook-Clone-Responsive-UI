import 'package:facebook_clone_responsive_ui/data/data.dart';
import 'package:facebook_clone_responsive_ui/screens/home_screen.dart';
import 'package:facebook_clone_responsive_ui/widgets/responsive_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../widgets/custom_appbar.dart';
import '../widgets/custom_tab_bar.dart';

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
    var screenSize = MediaQuery.of(context).size;
    return DefaultTabController(
      length: icons.length,
      child: Scaffold(
        appBar: ResponsiveWidget.isDesktop(context)
            ? PreferredSize(
                child: CustomAppBar(
                  currentUser: currentUser,
                  icon: icons,
                  selectedIndex: selectedIndex,
                  onTap: (index) {
                    selectedIndex = index;
                    setState(() {});
                  },
                ),
                preferredSize: Size(screenSize.width, 100),
              )
            : null,
        body: _screens[selectedIndex],
        bottomNavigationBar: !ResponsiveWidget.isDesktop(context)
            ? Container(
                padding: const EdgeInsets.all(8),
                child: CustomTabBar(
                  icons: icons,
                  selectedIndex: selectedIndex,
                  onTap: (index) {
                    selectedIndex = index;
                    setState(() {});
                  },
                ),
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
