import 'package:facebook_clone_responsive_ui/config/palette.dart';
import 'package:facebook_clone_responsive_ui/data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../widgets/circle_button.dart';
import '../widgets/create_post_container.dart';
import '../widgets/post_container.dart';
import '../widgets/room.dart';
import '../widgets/stories.dart';

class HomeScreen extends StatelessWidget {
  static const testImage =
      'https://scontent.faly1-2.fna.fbcdn.net/v/t1.6435-1/87108822_2599119643709186_2235360216474451968_n.jpg?stp=dst-jpg_p240x240&_nc_cat=109&ccb=1-5&_nc_sid=7206a8&_nc_eui2=AeGccnH_2jJpKGscC1g3TmyVD8In7towNKcPwifu2jA0p7rEcyyBSdhq6T11XQX58Xz0zNZONxS__yoN76xoC62v&_nc_ohc=L5xBg-tsnU0AX8_IcTW&_nc_ht=scontent.faly1-2.fna&oh=00_AT8VlGVRunqAVoTnXRtEKSsNSTGyiSuFTe4GKorBMM3ONg&oe=6245A14F';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
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
              CircleButton(
                icon: Icons.search,
                onTap: () => print('Search Icon'),
                iconSize: 30,
              ),
              CircleButton(
                icon: MdiIcons.facebookMessenger,
                onTap: () => print('Message Icon'),
                iconSize: 30,
              ),
            ],
          ),
          const SliverToBoxAdapter(
              child: CreatePostContainer(currentUser: currentUser)),
          SliverPadding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 5.0),
            sliver: SliverToBoxAdapter(
              child: Room(onlineUser: onlineUsers),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
            sliver: SliverToBoxAdapter(
              child: Stories(currentUser: currentUser, stories: stories),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return PostContainer(
                  posts: posts,
                  index: index,
                );
              },
              childCount: posts.length,
            ),
          ),
        ],
      ),
    );
  }
}
