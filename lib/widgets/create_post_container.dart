import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../models/user_model.dart';

class CreatePostContainer extends StatelessWidget {
  final User currentUser;

  const CreatePostContainer({Key? key, required this.currentUser})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.fromSTEB(12, 12, 12, 0),
      height: 120,
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey.shade200,
                backgroundImage:
                    CachedNetworkImageProvider(currentUser.imageUrl),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: TextFormField(
                  cursorHeight: 30,
                  decoration: const InputDecoration(
                    hintText: "What's on your mind?",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
          const Divider(height: 10, thickness: .5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton.icon(
                onPressed: () => print('Live'),
                icon: const Icon(
                  Icons.videocam,
                  color: Colors.red,
                ),
                label: const Text('Live'),
              ),
              const VerticalDivider(width: 8),
              TextButton.icon(
                onPressed: () => print('Photo'),
                icon: const Icon(Icons.photo_library),
                label: const Text('Photo'),
              ),
              const VerticalDivider(width: 8),
              TextButton.icon(
                onPressed: () => print('Room'),
                icon: const Icon(Icons.video_call),
                label: const Text('Room'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
