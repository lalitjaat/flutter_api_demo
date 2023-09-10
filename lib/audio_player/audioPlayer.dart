import 'package:api_example/constants.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

var player = AudioPlayer();

bool? musicOn;

void play() {
  player.play(AssetSource('music/music.mp3'));
  musicOn = true;
}

void pause() {
  player.pause();
  musicOn = false;
}

class audio_Player extends StatefulWidget {
  const audio_Player({super.key});

  @override
  State<audio_Player> createState() => _audio_PlayerState();
}

class _audio_PlayerState extends State<audio_Player> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: app_Bar("Audio Player"),
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/music.jpeg"),
            Center(
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      musicOn == true ? pause() : play();
                    });
                  },
                  icon: musicOn == true
                      ? const Icon(
                          CupertinoIcons.pause_circle,
                          size: 60,
                        )
                      : const Icon(
                          CupertinoIcons.play_circle,
                          size: 60,
                        )),
            ),
          ],
        ),
      ),
    );
  }
}
