import 'package:flutter/material.dart';

import '../models/user_model.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({
    Key? key,
    required this.onlineUser,
    required this.index,
    this.isActive = true,
  }) : super(key: key);

  final List<User> onlineUser;
  final int index;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(onlineUser[index].imageUrl),
          ),
          isActive
              ? const PositionedDirectional(
                  child: CircleAvatar(
                    child:
                        CircleAvatar(backgroundColor: Colors.green, radius: 5),
                    radius: 6,
                    backgroundColor: Colors.white,
                  ),
                  bottom: 1,
                  end: 1,
                )
              : const SizedBox.shrink(),
        ],
      ),
      margin: const EdgeInsetsDirectional.all(4),
    );
  }
}
