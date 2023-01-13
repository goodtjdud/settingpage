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
        primarySwatch: Colors.green,
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
      appBar: AppBar(title: const Text("설정")),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
            ListView(
              children: [
                  Card(
                    color: Colors.lightGreen[100],
                    elevation: 0,
                    margin: const EdgeInsets.symmetric(vertical: 1),
                    child: ListTile(
                    contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),

                    title: SizedBox(
                    child: Text(
                      "음성 안내",
                    style: TextStyle(
                    fontSize:25),
                    ),
                    ),
                      subtitle: SizedBox(
                        child: Text("인식 결과를 음성으로 알려줍니다.",
                        style: TextStyle(
                          fontSize: 20),
                        ),),
                      trailing: Icon(Icons.fastfood,
                      size: 50,)
                      )
                  ),
                Card(
                    color: Colors.lightGreen[100],
                    elevation: 0,
                    margin: const EdgeInsets.symmetric(vertical: 1),
                    child: ListTile(
                        contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),

                        title: SizedBox(
                          child: Text(
                            "앱 안내 듣기",
                            style: TextStyle(
                                fontSize:25),
                          ),
                        ),
                        subtitle: SizedBox(
                          child: Text("앱 사용 방법을 음성으로 들려줍니다.",

                            style: TextStyle(
                                fontSize: 20),
                          ),),
                        trailing: IconButton(
                                icon: play,
                                iconSize:50,
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
                                ),)
                    )
                ),
                Card(
                    color: Colors.lightGreen[100],
                    elevation: 0,
                    margin: const EdgeInsets.symmetric(vertical: 1),
                    child: ListTile(
                        contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),

                        title: SizedBox(
                          child: Text(
                            "의견 제출",
                            style: TextStyle(
                                fontSize:25),
                          ),
                        ),
                        subtitle: SizedBox(
                          child: Text("앱 사용에 문의사항이 있으면 ...",
                            style: TextStyle(
                                fontSize: 20),
                          ),)
                    )
                ),
            ]
            ),
        ),
      ),
    );
  }
}