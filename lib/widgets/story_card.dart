import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../config/palette.dart';
import '../models/story_model.dart';
import '../models/user_model.dart';

class StoryCard extends StatelessWidget {
  const StoryCard({
    Key? key,
    this.isAddStory = false,
    required this.currentUser,
    this.story,
  }) : super(key: key);
  final bool isAddStory;
  final User currentUser;
  final Story? story;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CachedNetworkImage(
            imageUrl: isAddStory ? currentUser.imageUrl : story!.imageUrl,
            width: 110,
            fit: BoxFit.cover,
            height: double.infinity,
          ),
        ),
        Container(
          width: 110,
          height: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: Palette.storyGradient,
          ),
        ),
        PositionedDirectional(
          start: 8,
          top: 8,
          child: CircleAvatar(
            backgroundColor: isAddStory ? Colors.white : Colors.blue,
            child: isAddStory
                ? IconButton(
                    onPressed: () => print('Add New Story'),
                    icon: const Icon(
                      Icons.add,
                    ),
                  )
                : Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: CachedNetworkImage(
                      imageUrl: story!.user.imageUrl,
                      fit: BoxFit.cover,
                      width: story!.isViewed ? double.infinity : null,
                      height: double.infinity,
                    ),
                  ),
          ),
        ),
        PositionedDirectional(
          bottom: 8,
          start: 8,
          end: 8,
          child: Text(
            isAddStory ? 'Add to Story' : story!.user.name,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                  color: Colors.white,
                ),
          ),
        )
      ],
    );
  }
}
