import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../models/user_model.dart';

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
          CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(currentUser.imageUrl),
          ),
          const VerticalDivider(color: Colors.white),
          Text(
            currentUser.name,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
