import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

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
    "assets/images/test2.mp4",
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

  int index = 0;

  /* _initData() async {
    await DefaultAssetBundle.of(context)
        .loadString("json/video/video.json")
        .then((value) {
      setState(
        () {
          _video = json.decode(value);
        },
      );
    });
  }*/

  @override
  void initState() {
    super.initState();

    // _initData();
    test();
  }

  @override
  void dispose() {
    videoPlayerController!.dispose();
    //chewieController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                    "Step " + step[index],
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
                      icon: const Icon(
                        Icons.arrow_left_outlined,
                        color: Colors.black,
                        size: 50,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_right_outlined,
                      color: Colors.black,
                      size: 50,
                    ),
                    onPressed: () {
                      setState(() {
                        index++;
                        test();
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
    videoPlayerController = VideoPlayerController.asset(_video[index])
      ..initialize().then((_) {
        setState(() {});
        videoPlayerController!.play();
        videoPlayerController!.setLooping(true);
      });
  }

  Widget run() {
    return SizedBox(
      height: 300,
      child: videoPlayerController!.value.isInitialized
          ? AspectRatio(
              aspectRatio: videoPlayerController!.value.aspectRatio,
              child: VideoPlayer(videoPlayerController!))
          : Text("j"),
    );
  }

  /* Widget _chewieVideoPlayer() {
    return SizedBox(
      height: 300,
      child: videoPlayerController!.value.isInitialized
          ? AspectRatio(
              aspectRatio: videoPlayerController!.value.aspectRatio,
              child: VideoPlayer(videoPlayerController!),
            )
          : Container(),
    );
  }*/
}
