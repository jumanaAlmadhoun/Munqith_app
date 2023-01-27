import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:munqith_app/pages/navigation_page.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:video_player/video_player.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  File? _video;
  VideoPlayerController? videoPlayerController;
  final picker = ImagePicker();
  String? numOfIncident;

  Future history() async {
    final firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      QuerySnapshot snap = await FirebaseFirestore.instance
          .collection("history")
          .where('email', isEqualTo: firebaseUser.email)
          .get();
      if (!mounted) return;
      setState(() {
        numOfIncident = snap.docs[0]['NumOfIncident'].toString();
      });
    }
  }

//-----------------------------------------------------------------------------
  _picVideo() async {
    final video = await picker.pickVideo(source: ImageSource.gallery);
    _video = File(video!.path);
    videoPlayerController = VideoPlayerController.file(_video!)
      ..initialize().then((_) => {
            setState(() {}),
            videoPlayerController!.play(),
          });
  }

//------------------------------------------------------------------------------
  @override
  void initState() {
    super.initState();
    history();
  }

//------------------------------------------------------------------------------
  Widget playVideo() {
    return SizedBox(
        height: 130,
        child: videoPlayerController!.value.isInitialized
            ? AspectRatio(
                aspectRatio: videoPlayerController!.value.aspectRatio,
                child: VideoPlayer(videoPlayerController!))
            : const FaIcon(
                FontAwesomeIcons.spinner,
              ));
  }

//------------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xFF1EAFCD),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            height: 30,
            decoration: const BoxDecoration(
              color: Color(0xFF1EAFCD),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
                shape: BoxShape.rectangle,
                border: Border.all(
                  color: Colors.white,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 30, 0, 8),
                          child: Text(
                            'Swimming is meant to be enjoyed!',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 19,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (_video != null)
                        playVideo()
                      else
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0, 30, 0, 20),
                          child: Container(
                            width: 350,
                            height: 130,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 188, 214, 218),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text("Upload the video",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 19,
                                          fontWeight: FontWeight.w500)),
                                  IconButton(
                                    icon: const Icon(Icons.file_upload),
                                    iconSize: 50,
                                    onPressed: () {
                                      setState(() {
                                        _picVideo();
                                      });
                                    },
                                  )
                                ]),
                          ),
                        ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                        child: Container(
                          width: 350,
                          height: 130,
                          decoration: BoxDecoration(
                            color: const Color(0xFF1EAFCD),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: InkWell(
                            onTap: () async {
                              await Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const NavigationPage(),
                                ),
                              );
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset(
                                  'assets/images/home-icon-h.png',
                                  width: 70,
                                  height: 70,
                                  fit: BoxFit.cover,
                                ),
                                Text("Detected incidents: $numOfIncident",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontWeight: FontWeight.w600)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 350,
                        height: 130,
                        decoration: BoxDecoration(
                          color: const Color(0xFFBE0815),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 100, 0),
                              child: Text('CPR',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 50)),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0.4, 0),
                              child: Image.asset(
                                'assets/images/hom-icon-CPR.png',
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
