import 'package:facebook_clone_responsive_ui/widgets/user_card.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../config/palette.dart';
import '../models/user_model.dart';

class MoreOptionList extends StatelessWidget {
  const MoreOptionList({Key? key, required this.users}) : super(key: key);
  final User users;
  static final List<List> _moreOptionsList = [
    [MdiIcons.shieldAccount, Colors.deepPurple, 'COVID-19 Info Center'],
    [MdiIcons.accountMultiple, Colors.cyan, 'Friends'],
    [MdiIcons.facebookMessenger, Palette.facebookBlue, 'Messenger'],
    [MdiIcons.flag, Colors.orange, 'Pages'],
    [MdiIcons.storefront, Palette.facebookBlue, 'Marketplace'],
    [Icons.ondemand_video, Palette.facebookBlue, 'Watch'],
    [MdiIcons.calendarStart, Colors.red, 'Events'],
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _moreOptionsList.length,
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: UserCard(currentUser: users),
          );
        }
        return ListTile(
          leading: Icon(
            _moreOptionsList[index][0],
            color: _moreOptionsList[index][1],
          ),
          title: Text(_moreOptionsList[index][2].toString()),
        );
      },
    );
  }
}
