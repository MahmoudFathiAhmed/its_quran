import 'package:flutter/material.dart';
import './video_player_widget.dart';
import 'package:video_player/video_player.dart';

// import '../../main.dart';
// import '../other/floating_action_button_widget.dart';
// import '../other/textfield_widget.dart';

class NetworkVideoPlayerWidget extends StatefulWidget {
  @override
  _NetworkVideoPlayerWidgetState createState() => _NetworkVideoPlayerWidgetState();
}

class _NetworkVideoPlayerWidgetState extends State<NetworkVideoPlayerWidget> {
  // final textController = TextEditingController();
  VideoPlayerController controller;

  @override
  void initState() {
    super.initState();

    controller = VideoPlayerController.network('https://www.youtube.com/watch?v=h6WI9YDvipw')
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((_) => controller.play());
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            VideoPlayerWidget(controller: controller),
          ],
        ),
      );
}