import 'package:api_example/audio_player/audioPlayer.dart';
import 'package:api_example/constants.dart';
import 'package:api_example/form/form.dart';
import 'package:flutter/material.dart';

import 'Api/Api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: change_Screen(),
      ),
    );
  }
}

class change_Screen extends StatefulWidget {
  const change_Screen({super.key});

  @override
  State<change_Screen> createState() => cChange_screeSState();
}

class cChange_screeSState extends State<change_Screen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ecommerceApi(),
                  ),
                );
              },
              child: Text("API Page")),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const UserForm(),
                  ),
                );
              },
              child: Text("Form Page")),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => audio_Player(),
                  ),
                );
              },
              child: Text("Audio Player"))
        ],
      ),
    );
  }
}
