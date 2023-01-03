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
  List step = ["1", "2", "3", "4", "5"];
  List _video = ["assets/images/test.mp4", "assets/images/test2.mp4"];
  List CPR = [
    "check for breathing",
    "Put the person on a flat service, kneel next to the person"
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
    test(index);
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
                Text(
                  CPR[0],
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
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
                        test(index);
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ]));
  }

  test(int num) {
    videoPlayerController = VideoPlayerController.asset(_video[num])
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
