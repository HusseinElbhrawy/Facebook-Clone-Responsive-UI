import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_clone_responsive_ui/config/palette.dart';
import 'package:facebook_clone_responsive_ui/data/data.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../models/post_model.dart';

class PostContainer extends StatelessWidget {
  const PostContainer({
    Key? key,
    required this.posts,
    required this.index,
  }) : super(key: key);
  final List<Post> posts;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(vertical: 8),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _PostHeader(index: index, posts: posts),
            const SizedBox(height: 5),
            Text(posts[index].caption),
            if (posts[index].imageUrl.isEmpty)
              const SizedBox.shrink()
            else
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Image(
                  image: CachedNetworkImageProvider(posts[index].imageUrl),
                ),
              ),
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(3),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Palette.facebookBlue,
                      ),
                      child: const Icon(
                        Icons.thumb_up,
                        color: Colors.white,
                        size: 15,
                      ),
                    ),
                    const VerticalDivider(width: 2),
                    Text(posts[index].likes.toString()),
                    const Spacer(),
                    Text('${posts[index].comments}Comments'),
                    const VerticalDivider(width: 10),
                    Text('${posts[index].shares}Shares'),
                  ],
                ),
                const Divider(),
                const _PostStatus()
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _PostStatus extends StatelessWidget {
  const _PostStatus({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TextButton.icon(
          onPressed: () => print('Like'),
          icon: Icon(
            MdiIcons.thumbUpOutline,
            color: Colors.grey.shade600,
          ),
          label: Text(
            'Like',
            style: TextStyle(color: Colors.grey.shade600),
          ),
        ),
        const VerticalDivider(width: 8),
        TextButton.icon(
          onPressed: () => print('Comments'),
          icon: Icon(
            MdiIcons.commentOutline,
            color: Colors.grey.shade600,
          ),
          label: Text(
            'Comment',
            style: TextStyle(
              color: Colors.grey.shade600,
            ),
          ),
        ),
        const VerticalDivider(width: 8),
        TextButton.icon(
          onPressed: () => print('Share'),
          icon: Icon(
            MdiIcons.shareOutline,
            color: Colors.grey.shade600,
          ),
          label: Text(
            'Share',
            style: TextStyle(
              color: Colors.grey.shade600,
            ),
          ),
        ),
      ],
    );
  }
}

class _PostHeader extends StatelessWidget {
  const _PostHeader({
    Key? key,
    required this.index,
    required this.posts,
  }) : super(key: key);

  final int index;
  final List<Post> posts;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        backgroundImage:
            CachedNetworkImageProvider(onlineUsers[index].imageUrl),
      ),
      title: Text(
        posts[index].user.name,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
      subtitle: Row(
        children: [
          Text(posts[index].timeAgo),
          const VerticalDivider(width: 7),
          Icon(
            Icons.public_outlined,
            size: 12,
            color: Colors.grey.shade500,
          ),
        ],
      ),
      trailing: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.more_horiz),
      ),
    );
  }
}
