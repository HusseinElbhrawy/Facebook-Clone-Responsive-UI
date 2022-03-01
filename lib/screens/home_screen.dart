import 'package:facebook_clone_responsive_ui/config/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../widgets/circlue_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Palette.scaffold,
            floating: true,
            centerTitle: false,
            elevation: 0.0,
            systemOverlayStyle: SystemUiOverlayStyle.light,
            title: Text(
              'Facebook',
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: Palette.facebookBlue,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -1.2,
                  ),
            ),
            actions: [
              CircleButton(icon: Icons.search, onTap: () {}, iconSize: 30),
              CircleButton(
                icon: MdiIcons.facebookMessenger,
                onTap: () {},
                iconSize: 30,
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate([]),
          ),
        ],
      ),
    );
  }
}
