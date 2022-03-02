import 'package:flutter/material.dart';

import '../config/palette.dart';

class RoomButton extends StatelessWidget {
  const RoomButton({
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
