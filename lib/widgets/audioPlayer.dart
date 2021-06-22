// import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AudioPlayerWidget extends StatefulWidget {
  @override
   _AudioPlayerWidgetState createState() => _AudioPlayerWidgetState();
}

class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
  // AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;

  double _value = 0;

  // Future _playPause() async {
  //      await _audioPlayer.pause();
  //     setState(() {
  //       _isPlaying = !_isPlaying;
  //       print("Audio Paused");
  //     });
  //   } else if (_audioPlayer.state == PlayerState.PAUSED) {
  //     await _audioPlayer.resume();
  //     setState(() {
  //       _isPlaying = !_isPlaying;
  //       print("Audio Resumed");
  //     });
  //   } else {
  //     await _audioPlayer.play(
  //       // 'https://luan.xyz/files/audio/nasa_on_a_mission.mp3',
  //       // 'https://luan.xyz/files/audio/ambient_c_motion.mp3',
  //       'http://www.everyayah.com/data/Abdullaah_3awwaad_Al-Juhaynee_128kbps/002007.mp3',
  //       isLocal: false,
  //     );
  //     setState(() {
  //       _isPlaying = true;
  //       print("Started Playing");
  //     });
  //   }
  // }

  @override
  void initState() {
    // _audioPlayer = AudioPlayer(mode: PlayerMode.MEDIA_PLAYER, playerId: 'p0');
    // _audioPlayer.onPlayerError.listen((msg) {
    //   print('audioPlayer error : $msg');
    //   setState(() {
    //     _audioPlayer.state = PlayerState.STOPPED;
    //   });
    // });
    // // _audioPlayer.onPlayerCompletion
    // super.initState();
  }

  @override
  void dispose() {
    // _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                child: Image.asset(
              'assets/music.png',
              height: 150,
            )),
            SizedBox(height: 100.0),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                children: <Widget>[
                  _sliderText(context, "0:00"),
                  Expanded(
                    child: Slider(
                      value: _value,
                      onChanged: (value) {
                        setState(() {
                          _value = value;
                        });
                      },
                      label: '$_value',
                      activeColor: Theme.of(context).accentColor,
                      inactiveColor:
                          Theme.of(context).primaryColor.withOpacity(0.3),
                    ),
                  ),
                  _sliderText(context, "5:00"),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              height: 60.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                    onTap: () async {},
                    child: Image.asset(
                      'assets/next.png',
                      width: 30.0,
                    ),
                  ),

                  InkWell(
                    onTap: () async {
                      //await _playPause();
                      // await _playPause();
                      // await _audioPlayer.play(
                      //   'https://luan.xyz/files/audio/nasa_on_a_mission.mp3',
                      //   // 'https://luan.xyz/files/audio/ambient_c_motion.mp3',
                      //   // 'http://www.everyayah.com/data/Abdullaah_3awwaad_Al-Juhaynee_128kbps/002007.mp3',
                      //   isLocal: false,
                      //);
                    },
                    child: Image.asset(
                      !_isPlaying ? 'assets/playsm.png' : 'assets/pause.png',
                      width: 150.0,
                    ),
                  ),
                  //
                  InkWell(
                    onTap: () {},
                    child: Image.asset(
                      'assets/prev.png',
                      width: 30.0,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Text _sliderText(BuildContext context, String time) {
    return Text(
      time,
      style: GoogleFonts.openSans(
        textStyle: Theme.of(context).textTheme.caption,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
