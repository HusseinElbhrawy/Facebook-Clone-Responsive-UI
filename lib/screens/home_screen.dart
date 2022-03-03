import 'package:facebook_clone_responsive_ui/config/palette.dart';
import 'package:facebook_clone_responsive_ui/data/data.dart';
import 'package:facebook_clone_responsive_ui/widgets/responsive_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../widgets/circle_button.dart';
import '../widgets/contacts_list.dart';
import '../widgets/create_post_container.dart';
import '../widgets/more_options_list.dart';
import '../widgets/post_container.dart';
import '../widgets/room.dart';
import '../widgets/stories.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TrackingScrollController trackingScrollController =
      TrackingScrollController();
  @override
  void dispose() {
    trackingScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: ResponsiveWidget(
        mobile: _HomeScreenMobile(
            trackingScrollController: trackingScrollController),
        desktop: _HomeScreenDesktop(
            trackingScrollController: trackingScrollController),
      ),
    );
  }
}

class _HomeScreenMobile extends StatelessWidget {
  const _HomeScreenMobile({
    Key? key,
    required this.trackingScrollController,
  }) : super(key: key);
  final TrackingScrollController trackingScrollController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: trackingScrollController,
        physics: const BouncingScrollPhysics(),
        slivers: [
          ResponsiveWidget.isDesktop(context)
              ? const SliverToBoxAdapter()
              : SliverAppBar(
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
                    Center(
                      child: CircleButton(
                        icon: Icons.search,
                        onTap: () => print('Search Icon'),
                        iconSize: 30,
                      ),
                    ),
                    Center(
                      child: CircleButton(
                        icon: MdiIcons.facebookMessenger,
                        onTap: () => print('Message Icon'),
                        iconSize: 30,
                      ),
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

class _HomeScreenDesktop extends StatelessWidget {
  const _HomeScreenDesktop({
    Key? key,
    required this.trackingScrollController,
  }) : super(key: key);
  final TrackingScrollController trackingScrollController;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Flexible(
          flex: 1,
          child: Align(
            alignment: AlignmentDirectional.centerStart,
            child: Padding(
              padding: EdgeInsets.all(12),
              child: MoreOptionList(users: currentUser),
            ),
          ),
        ),
        const Spacer(),
        Flexible(
          flex: 2,
          child: CustomScrollView(
            controller: trackingScrollController,
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverPadding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 10.0),
                sliver: SliverToBoxAdapter(
                  child: Stories(currentUser: currentUser, stories: stories),
                ),
              ),
              ResponsiveWidget.isDesktop(context)
                  ? const SliverToBoxAdapter()
                  : SliverAppBar(
                      backgroundColor: Colors.white,
                      floating: true,
                      centerTitle: false,
                      elevation: 0.0,
                      systemOverlayStyle: SystemUiOverlayStyle.light,
                      title: Text(
                        'Facebook',
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  color: Palette.facebookBlue,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: -1.2,
                                ),
                      ),
                      actions: [
                        Center(
                          child: CircleButton(
                            icon: Icons.search,
                            onTap: () => print('Search Icon'),
                            iconSize: 30,
                          ),
                        ),
                        Center(
                          child: CircleButton(
                            icon: MdiIcons.facebookMessenger,
                            onTap: () => print('Message Icon'),
                            iconSize: 30,
                          ),
                        ),
                      ],
                    ),
              const SliverToBoxAdapter(
                child: CreatePostContainer(currentUser: currentUser),
              ),
              SliverPadding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 5.0),
                sliver: SliverToBoxAdapter(
                  child: Room(onlineUser: onlineUsers),
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
        ),
        const Spacer(),
        Flexible(
          flex: 1,
          child: Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: ContactsList(users: onlineUsers),
            ),
          ),
        ),
      ],
    );
  }
}
