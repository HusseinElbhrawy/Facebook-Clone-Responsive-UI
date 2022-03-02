import 'package:flutter/material.dart';

import '../config/palette.dart';
import '../models/user_model.dart';

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
      height: 70,
      child: Row(
        children: [
          const VerticalDivider(width: 10),
          Expanded(
            flex: 2,
            child: ListView.builder(
              itemCount: onlineUser.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    if (index == 0) const _RoomButton(),
                    Container(
                      child: Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          CircleAvatar(
                            backgroundImage:
                                NetworkImage(onlineUser[index].imageUrl),
                          ),
                          const PositionedDirectional(
                            child: CircleAvatar(
                              child: CircleAvatar(
                                backgroundColor: Colors.green,
                                radius: 5,
                              ),
                              radius: 6,
                              backgroundColor: Colors.white,
                            ),
                            bottom: 1,
                            end: 1,
                          ),
                        ],
                      ),
                      margin: const EdgeInsetsDirectional.all(4),
                    ),
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

class _RoomButton extends StatelessWidget {
  const _RoomButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () => print('Create Room Button'),
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        ),
        side: MaterialStateProperty.all(
          const BorderSide(
            color: Colors.blue,
            width: 2,
          ),
        ),
      ),
      icon: ShaderMask(
        shaderCallback: (rect) => Palette.createRoomGradient.createShader(rect),
        child: const Icon(Icons.video_call),
      ),
      label: const Text('Create\nRoom'),
    );
  }
}
