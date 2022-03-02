import 'package:facebook_clone_responsive_ui/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';

import '../models/user_model.dart';
import 'create_room_button.dart';

class Room extends StatelessWidget {
  const Room({
    Key? key,
    required this.onlineUser,
  }) : super(key: key);
  final List<User> onlineUser;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 80,
      child: Row(
        children: [
          const VerticalDivider(width: 10),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: onlineUser.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    if (index == 0) const RoomButton(),
                    ProfileAvatar(onlineUser: onlineUser, index: index),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
