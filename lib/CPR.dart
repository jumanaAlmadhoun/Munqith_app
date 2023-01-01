import 'dart:convert';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class CPR extends StatefulWidget {
  const CPR({Key? key}) : super(key: key);
  @override
  State<CPR> createState() => _CPRState();
}

class _CPRState extends State<CPR> {
  VideoPlayerController? videoPlayerController;
  //ChewieController? chewieController;
  List video = [];

  _initData() async {
    await DefaultAssetBundle.of(context)
        .loadString("lib/video.json")
        .then((value) {
      setState(
        () {
          video = json.decode(value);
        },
      );
    });
  }

  @override
  void initState() {
    super.initState();
    _initData();
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
            children: const [
              Align(
                alignment: AlignmentDirectional(-0.5, 0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 10),
                  child: Text(
                    'Step 1',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          _chewieVideoPlayer(),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 29, 0, 29),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Press 30 times on \nthe patient chest',
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
                      onPressed: () {
                        print('IconButton pressed ...');
                      },
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_right_outlined,
                      color: Colors.black,
                      size: 50,
                    ),
                    onPressed: () {
                      print('IconButton pressed ...');
                    },
                  ),
                ],
              ),
            ),
          ),
        ]));
  }

  _playView(BuildContext context) {}
  Widget _chewieVideoPlayer() {
    return SizedBox(
      height: 300,
      child: videoPlayerController!.value.isInitialized
          ? AspectRatio(
              aspectRatio: videoPlayerController!.value.aspectRatio,
              child: VideoPlayer(videoPlayerController!),
            )
          : Container(),
    );
  }
}
