import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_clone_responsive_ui/widgets/circle_button.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../config/palette.dart';
import '../models/user_model.dart';
import 'custom_tab_bar.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    required this.icon,
    required this.currentUser,
    required this.selectedIndex,
    required this.onTap,
  }) : super(key: key);
  final User currentUser;
  final int selectedIndex;
  final Function onTap;
  final List icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 4.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              'Facebook',
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: Palette.facebookBlue,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -1.2,
                  ),
            ),
          ),
          SizedBox(
            width: 600,
            child: CustomTabBar(
              icons: icon,
              selectedIndex: selectedIndex,
              onTap: (index) => onTap(index),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                UserCard(currentUser: currentUser),
                const SizedBox(width: 12.0),
                CircleButton(
                  icon: Icons.search,
                  onTap: onTap,
                  iconSize: 30.0,
                ),
                CircleButton(
                  icon: MdiIcons.facebookMessenger,
                  onTap: onTap,
                  iconSize: 30.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class UserCard extends StatelessWidget {
  const UserCard({
    Key? key,
    required this.currentUser,
  }) : super(key: key);
  final User currentUser;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => print('Clicked'),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 40,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: Image(
              image: CachedNetworkImageProvider(currentUser.imageUrl),
            ),
          ),
          Text(
            currentUser.name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
