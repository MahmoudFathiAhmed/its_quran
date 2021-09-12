import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share/share.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

/// Homepage
class YoutubeSalem extends StatefulWidget {
  final String link;
  final String attachments;
  YoutubeSalem(this.link, this.attachments);

  @override
  _YoutubeSalemState createState() => _YoutubeSalemState();
}

class _YoutubeSalemState extends State<YoutubeSalem> {
  bool _isEnded = false;

  YoutubePlayerController _controller;
  TextEditingController _idController;
  TextEditingController _seekToController;

  PlayerState _playerState;
  YoutubeMetaData _videoMetaData;
  double _volume = 100;
  bool _muted = false;
  bool _isPlayerReady = false;

  final List<String> _ids = [
    'nPt8bK2gbaU',
    'gQDByCdjUXw',
    'iLnmTe5Q2Qw',
    '_WoCV4c6XOE',
    'KmzdUe0RSJo',
    '6jZDSSZZxjQ',
    'p2lYr3vM_1w',
    '7QUtEmBT_-w',
    '34_PXCzGw1M',
  ];

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: _extractVideoId(this.widget.link),
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
    _idController = TextEditingController();
    _seekToController = TextEditingController();
    _videoMetaData = const YoutubeMetaData();
    _playerState = PlayerState.unknown;
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    _idController.dispose();
    _seekToController.dispose();
    super.dispose();
  }

  String _extractVideoId(String link) {
    var result = '';
    if (link.contains("https://youtu.be/")) {
      result = link.split("be/").toList()[1];
      print("case0: ID= $result");
      return result;
    } else if (link.contains("https://www.youtube.com/watch?v=")) {
      result = link.split("v=").toList()[1].toString();
      if (result.length == 11) {
        print("case2: length is 11 characters= $result");
        return result;
      } else {
        result = result.substring(0, 11);
        print("case2: more than 11 characters ID= $result");
        return result;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      onExitFullScreen: () {
        // The player forces portraitUp after exiting fullscreen. This overrides the behaviour.
        SystemChrome.setPreferredOrientations(DeviceOrientation.values);
      },
      player: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Theme.of(context).accentColor,
        topActions: <Widget>[
          // const SizedBox(width: 8.0),
          // IconButton(
          //   icon: const Icon(
          //     Icons.settings,
          //     color: Colors.white,
          //     size: 25.0,
          //   ),
          //   onPressed: () {
          //     print('Settings Tapped!');
          //   },
          // ),
        ],
        onReady: () {
          _isPlayerReady = true;
        },
        onEnded: (data) {
          setState(() {
            _isEnded = true;
          });
        },
      ),
      builder: (context, player) => Scaffold(
        // appBar: AppBar(
        //   leading: IconButton(
        //     onPressed: () {
        //       setState(() {
        //         _isEnded = !_isEnded;
        //       });
        //     },
        //     icon: Icon(
        //       Icons.toggle_off,
        //       color: Colors.white,
        //     ),
        //   ),
        // ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          color: Theme.of(context).primaryColor,
          child: Center(
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.topCenter,
              children: [
                Opacity(
                  opacity: 0.1,
                  child: Image.asset(
                    'assets/logo.png',
                    scale: 0.1,
                  ),
                ),
                AnimatedAlign(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  alignment: Alignment(0,_isEnded?0.6: 0),
                  // bottom: _isEnded ? -80 : 100,
                  child: Container(
                    width: 100,
                    height: 100,
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      borderRadius: BorderRadius.circular(250.0),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () async {
                String shareText = widget.attachments != null
                    ? "تابع درس  \"${_videoMetaData.title}\" \n${widget.link}" +
                        "\nويمكنك تحميل ملف الدرس من هنا👇\n${widget.attachments}" +
                        "\n-تطبيق إنه القرءان-"
                    : "تابع درس  \"${_videoMetaData.title}\" \n${widget.link}" +
                        "\n-تطبيق إنه القرءان-";
                await Share.share(shareText);
              },
                            icon: Icon(
                              Icons.share_outlined,
                              size: 30.0,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          Text(
                            'شارك الفيديو',
                            style: TextStyle(
                              fontSize: 10.0,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                AnimatedAlign(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  alignment: Alignment(0,_isEnded?-0.9: -0.3),
                    // top: _isEnded ? -80 : 0,
                    child: player),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.stretch,
                //     children: [
                //       _space,
                //       _text('Title', _videoMetaData.title),
                //       _space,
                //       _text('Channel', _videoMetaData.author),
                //       _space,
                //       _text('Video Id', _videoMetaData.videoId),
                //       _space,
                //       Row(
                //         children: [
                //           _text(
                //             'Playback Quality',
                //             _controller.value.playbackQuality ?? '',
                //           ),
                //           const Spacer(),
                //           _text(
                //             'Playback Rate',
                //             '${_controller.value.playbackRate}x  ',
                //           ),
                //         ],
                //       ),
                //       _space,
                //       TextField(
                //         enabled: _isPlayerReady,
                //         controller: _idController,
                //         decoration: InputDecoration(
                //           border: InputBorder.none,
                //           hintText: 'Enter youtube \<video id\> or \<link\>',
                //           fillColor: Colors.blueAccent.withAlpha(20),
                //           filled: true,
                //           hintStyle: const TextStyle(
                //             fontWeight: FontWeight.w300,
                //             color: Colors.blueAccent,
                //           ),
                //           suffixIcon: IconButton(
                //             icon: const Icon(Icons.clear),
                //             onPressed: () => _idController.clear(),
                //           ),
                //         ),
                //       ),
                //       _space,
                //       Row(
                //         children: [
                //           _loadCueButton('LOAD'),
                //           const SizedBox(width: 10.0),
                //           _loadCueButton('CUE'),
                //         ],
                //       ),
                //       _space,
                //       Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //         children: [
                //           IconButton(
                //             icon: const Icon(Icons.skip_previous),
                //             onPressed: _isPlayerReady
                //                 ? () => _controller.load(_ids[
                //                     (_ids.indexOf(_controller.metadata.videoId) -
                //                             1) %
                //                         _ids.length])
                //                 : null,
                //           ),
                //           IconButton(
                //             icon: Icon(
                //               _controller.value.isPlaying
                //                   ? Icons.pause
                //                   : Icons.play_arrow,
                //             ),
                //             onPressed: _isPlayerReady
                //                 ? () {
                //                     _controller.value.isPlaying
                //                         ? _controller.pause()
                //                         : _controller.play();
                //                     setState(() {});
                //                   }
                //                 : null,
                //           ),
                //           IconButton(
                //             icon: Icon(_muted ? Icons.volume_off : Icons.volume_up),
                //             onPressed: _isPlayerReady
                //                 ? () {
                //                     _muted
                //                         ? _controller.unMute()
                //                         : _controller.mute();
                //                     setState(() {
                //                       _muted = !_muted;
                //                     });
                //                   }
                //                 : null,
                //           ),
                //           FullScreenButton(
                //             controller: _controller,
                //             color: Colors.blueAccent,
                //           ),
                //           IconButton(
                //             icon: const Icon(Icons.skip_next),
                //             onPressed: _isPlayerReady
                //                 ? () => _controller.load(_ids[
                //                     (_ids.indexOf(_controller.metadata.videoId) +
                //                             1) %
                //                         _ids.length])
                //                 : null,
                //           ),
                //         ],
                //       ),
                //       _space,
                //       Row(
                //         children: <Widget>[
                //           const Text(
                //             "Volume",
                //             style: TextStyle(fontWeight: FontWeight.w300),
                //           ),
                //           Expanded(
                //             child: Slider(
                //               inactiveColor: Colors.transparent,
                //               value: _volume,
                //               min: 0.0,
                //               max: 100.0,
                //               divisions: 10,
                //               label: '${(_volume).round()}',
                //               onChanged: _isPlayerReady
                //                   ? (value) {
                //                       setState(() {
                //                         _volume = value;
                //                       });
                //                       _controller.setVolume(_volume.round());
                //                     }
                //                   : null,
                //             ),
                //           ),
                //         ],
                //       ),
                //       _space,
                //       AnimatedContainer(
                //         duration: const Duration(milliseconds: 800),
                //         decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(20.0),
                //           color: _getStateColor(_playerState),
                //         ),
                //         padding: const EdgeInsets.all(8.0),
                //         child: Text(
                //           _playerState.toString(),
                //           style: const TextStyle(
                //             fontWeight: FontWeight.w300,
                //             color: Colors.white,
                //           ),
                //           textAlign: TextAlign.center,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _text(String title, String value) {
    return RichText(
      text: TextSpan(
        text: '$title : ',
        style: const TextStyle(
          color: Colors.blueAccent,
          fontWeight: FontWeight.bold,
        ),
        children: [
          TextSpan(
            text: value,
            style: const TextStyle(
              color: Colors.blueAccent,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }

  Color _getStateColor(PlayerState state) {
    switch (state) {
      case PlayerState.unknown:
        return Colors.grey[700];
      case PlayerState.unStarted:
        return Colors.pink;
      case PlayerState.ended:
        return Colors.red;
      case PlayerState.playing:
        return Colors.blueAccent;
      case PlayerState.paused:
        return Colors.orange;
      case PlayerState.buffering:
        return Colors.yellow;
      case PlayerState.cued:
        return Colors.blue[900];
      default:
        return Colors.blue;
    }
  }

  Widget get _space => const SizedBox(height: 10);

  Widget _loadCueButton(String action) {
    return Expanded(
      child: MaterialButton(
        color: Colors.blueAccent,
        onPressed: _isPlayerReady
            ? () {
                if (_idController.text.isNotEmpty) {
                  var id = YoutubePlayer.convertUrlToId(
                        _idController.text,
                      ) ??
                      '';
                  if (action == 'LOAD') _controller.load(id);
                  if (action == 'CUE') _controller.cue(id);
                  FocusScope.of(context).requestFocus(FocusNode());
                } else {
                  // _showSnackBar('Source can\'t be empty!');
                }
              }
            : null,
        disabledColor: Colors.grey,
        disabledTextColor: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14.0),
          child: Text(
            action,
            style: const TextStyle(
              fontSize: 18.0,
              color: Colors.white,
              fontWeight: FontWeight.w300,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 16.0,
          ),
        ),
        backgroundColor: Colors.blueAccent,
        behavior: SnackBarBehavior.floating,
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
    );
  }
}
