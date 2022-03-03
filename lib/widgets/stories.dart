import 'package:facebook_clone_responsive_ui/models/models.dart';
import 'package:facebook_clone_responsive_ui/widgets/responsive_widget.dart';
import 'package:facebook_clone_responsive_ui/widgets/story_card.dart';
import 'package:flutter/material.dart';

class Stories extends StatelessWidget {
  const Stories({
    Key? key,
    required this.stories,
    required this.currentUser,
  }) : super(key: key);
  final User currentUser;
  final List<Story> stories;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ResponsiveWidget.isDesktop(context)
          ? Colors.transparent
          : Colors.white,
      height: 200,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        itemCount: stories.length,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: StoryCard(
                currentUser: currentUser,
                isAddStory: true,
              ),
            );
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: StoryCard(
              currentUser: currentUser,
              story: stories[index],
            ),
          );
        },
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
      ),
    );
  }
}
