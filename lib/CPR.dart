import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:video_player/video_player.dart';
import 'package:alan_voice/alan_voice.dart';

class CPR extends StatefulWidget {
  const CPR({Key? key}) : super(key: key);
  @override
  State<CPR> createState() => _CPRState();
}

class _CPRState extends State<CPR> {
  //ChewieController? chewieController;
  VideoPlayerController? videoPlayerController;
  List step = ["1", "2", "3", "4", "5", "6"];
  List _video = [
    "assets/images/STEP1.mp4",
    "assets/images/STEP2.mp4",
    "assets/images/STEP3.mp4",
    "assets/images/STEP4.mp4",
    "assets/images/STEP5.mp4",
    "assets/images/STEP6.mp4",
  ];
  List CPR = [
    "Look around and make sure the area is safe, shake them, and ask them Are you ok?, Shout for help",
    "Tilt head back & Check for breathing",
    "Call an ambulance",
    "place the heal of one hand on the chest and place the other hand above it and interlock your fingers",
    "Press down hard and fast. Start the compression by pushing the chest down 5cm 30 times fast",
    "Give two rescue breaths (block the nose and tilt the head back. Cover his/her mouth with yours and exhale).",
  ];

  static int index = 0;
  bool left = false;
  bool right = true;

  @override
  void initState() {
    super.initState();
    test();
    _MyHomePageState();

    //AlanSpeech();
  }

  @override
  void dispose() {
    videoPlayerController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //AlanSpeech();
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color(0xFF1EAFCD),
          automaticallyImplyLeading: false,
          title: Image.asset(
            'assets/images/MONQITH-WHITE.png',
            width: 180,
            height: 180,
            fit: BoxFit.contain,
          ),
          actions: const [],
          centerTitle: true,
          elevation: 2,
        ),
        body: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: AlignmentDirectional(-0.5, 0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 10),
                  child: Text(
                    "Step " + step[index] + "/" + step.length.toString(),
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          run(),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 29, 0, 29),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                    child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(30, 0, 30, 0),
                  child: Text(
                    CPR[index],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                )),
              ],
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0, 0.55),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: const AlignmentDirectional(0, 0),
                    child: IconButton(
                      icon: Icon(
                        left ? Icons.arrow_left_outlined : null,
                        color: Colors.black,
                        size: 50,
                      ),
                      onPressed: () {
                        setState(() {
                          index--;
                          test();
                          index == 0 ? left = false : left = true;
                        });
                      },
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      right ? Icons.arrow_right_outlined : null,
                      color: Colors.black,
                      size: 50,
                    ),
                    onPressed: () {
                      //AlanSpeech();
                      setState(() {
                        //AlanSpeech();
                        index++;
                        test();
                        if (index == 5) {
                          right = false;
                        }
                        index == 0 ? left = false : left = true;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ]));
  }

  test() {
    //AlanSpeech();
    videoPlayerController = VideoPlayerController.asset(_video[index])
      ..initialize().then((_) {
        setState(() {});
        videoPlayerController!.play();
        videoPlayerController!.setVolume(0);
        // videoPlayerController!.setLooping(true);
      });
  }

  Widget run() {
    //AlanSpeech();
    return SizedBox(
        height: 300,
        child: videoPlayerController!.value.isInitialized
            ? AspectRatio(
                aspectRatio: videoPlayerController!.value.aspectRatio,
                child: VideoPlayer(videoPlayerController!))
            : const FaIcon(
                FontAwesomeIcons.spinner,
              ));
  }

  _MyHomePageState() {
    /// Init Alan Button with project key from Alan Studio
    AlanVoice.addButton(
        "5e55de6450d3616d38f815f481cda4f62e956eca572e1d8b807a3e2338fdd0dc/stage");

    /// Handle commands from Alan Studio
    AlanVoice.onCommand.add((command) {
      // Debugs the output to the console

      if (command.data['command'].toString() == "next" && index < 5) {
        setState(() {
          _CPRState.index++;
          test();
          index == 0 ? left = false : left = true;
        });
      } else if (command.data['command'].toString() == 'back' &&
          index > 0 &&
          index < 6) {
        setState(() {
          _CPRState.index--;
          test();
          index == 0 ? left = false : left = true;
        });
      }
    });
  }
}
