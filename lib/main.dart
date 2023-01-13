import 'package:flutter/material.dart';
import 'dart:async';
import 'package:audioplayers/audioplayers.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.a
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const SettingPage(),
    );
  }
}

class SettingPage extends StatefulWidget {
  const SettingPage({
    Key? key,
  }) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}
int musicStart = 0;
Icon play = Icon(Icons.play_circle,
  color: Colors.black,
  size: 40,);
final player = AudioPlayer();

class _SettingPageState extends State<SettingPage> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 100,
                child: Text("음성 안내",
                  style: TextStyle(
                      fontSize: 20),
                ),),
              IconButton(
                icon: play,
                iconSize:45,
                padding: EdgeInsets.all(0.0),
                splashRadius: 25.0,
                onPressed: ()=> setState(() {
                  if (musicStart == 0) {
                    player.play(AssetSource('pretender.mp3'),);
                    musicStart = 1;
                    play = Icon(
                      Icons.stop_circle,
                    );
                    print("music started");}
                  else {
                    player.stop();
                    musicStart = 0;
                    play = Icon(
                      Icons.play_circle,
                    );
                    print("music stopped");}
                },
                ),),
              SizedBox(
                  height: 50,
                  child: Text("앱 안내 듣기")),
              SizedBox(
                  height: 50,
                  child: Text("SettingPage")),

            ],
          ),
        ),
      ),
    );
  }
}