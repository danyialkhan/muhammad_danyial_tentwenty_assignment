import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:muhammad_danyial_tentwenty_assignment/utils/constants/color_constants.dart';
import 'package:muhammad_danyial_tentwenty_assignment/utils/extensions/navigator_extensions.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PlayVideoScreen extends StatefulWidget {
  final String videoKey;
  const PlayVideoScreen({Key? key, required this.videoKey}) : super(key: key);

  @override
  State<PlayVideoScreen> createState() => _PlayVideoScreenState();
}

class _PlayVideoScreenState extends State<PlayVideoScreen> {
  late YoutubePlayerController _controller;
  bool _isPlayerReady = false;
  @override
  void initState() {
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoKey,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    )..addListener(listener);
    super.initState();
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {}
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      onExitFullScreen: () {
        SystemChrome.setPreferredOrientations(DeviceOrientation.values);
      },
      player: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.blueAccent,
        topActions: <Widget>[
          const SizedBox(width: 8.0),
          Expanded(
            child: Text(
              _controller.metadata.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
        onReady: () {
          _isPlayerReady = true;
        },
        onEnded: (data) {
          context.pop();
        },
      ),
      builder: (context, player) {
        return Scaffold(
          backgroundColor: ColorConstants.secondaryAppColor,
          appBar: AppBar(
            title: Text(_controller.metadata.title),
          ),
          body: Center(
            child: player,
          ),
        );
      },
    );
  }
}
