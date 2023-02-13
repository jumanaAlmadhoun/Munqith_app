import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:video_player/video_player.dart';
import 'package:http/http.dart' as http;
import '../db_services.dart';
import '../models/Incidents.dart';
import 'alarm_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  File? _video;
  String? msg;
  VideoPlayerController? videoPlayerController;
  final picker = ImagePicker();
  int? numOfIncident;
  Widget? detectedIncidents;

  noDrown() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        content: const Text("No drowning incident has been detected"),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              setState(() {
                _video = null;
              });
            },
            child: Container(
              color: const Color(0xFF1EAFCD),
              padding: const EdgeInsets.all(14),
              child: const Text(
                "Ok",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 9,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }

//------------------------------------------------------------------------------
  updateDatabase() async {
    setState(() async {
      numOfIncident = await DbServices.instance.getNumOfIncident();
      int h = numOfIncident! + 1;
      final firebaseUser = FirebaseAuth.instance.currentUser;

      var collection = FirebaseFirestore.instance.collection('history');
      collection.doc(firebaseUser!.email).update({'NumOfIncident': h});
      //------------------------------------
      FirebaseFirestore.instance
          .collection('history')
          .doc(firebaseUser.email)
          .collection('incidents')
          .doc((h).toString())
          .set({"Date": DateTime.now()});
      //-------------------------------------
      await Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const AlarmPage(),
        ),
      );
    });
  }

//------------------------------------------------------------------------------
  uploadVideo() async {
    final request = http.MultipartRequest(
        "POST", Uri.parse("https://524d-5-82-74-156.eu.ngrok.io/upload"));
    final headers = {"Content-type": "multipart/form-data"};
    request.files.add(
      http.MultipartFile(
        'video',
        _video!.readAsBytes().asStream(),
        _video!.lengthSync(),
        filename: _video!.path.split("/").last,
      ),
    );

    request.headers.addAll(headers);
    var response = await request.send();
    http.Response res = await http.Response.fromStream(response);
    final resJson = jsonDecode(res.body);
    msg = resJson['message'];
    setState(() async {
      msg.toString() == "drowning" ? updateDatabase() : noDrown();
    });
  }

//------------------------------------------------------------------------------
  _picVideo() async {
    final video = await picker.pickVideo(source: ImageSource.gallery);
    _video = File(video!.path);
    videoPlayerController = VideoPlayerController.file(_video!)
      ..initialize()
          .then((_) => {setState(() {}), videoPlayerController!.play()});

    uploadVideo();
  }

//------------------------------------------------------------------------------
  @override
  void initState() {
    super.initState();
  }

//------------------------------------------------------------------------------
  Widget playVideo() {
    return SizedBox(
        width: 300,
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
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
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
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 30, 0, 30),
                          child: Text(
                            'Swimming is meant to be enjoyed!',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
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
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                          child: Container(
                            width: 300,
                            height: 130,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 188, 214, 218),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.file_upload),
                                    iconSize: 50,
                                    onPressed: () {
                                      setState(() {
                                        _picVideo();
                                      });
                                    },
                                  ),
                                  const Text("Upload the video",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 19,
                                          fontWeight: FontWeight.w500)),
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
                            const EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                        child: Container(
                          width: 300,
                          height: 130,
                          decoration: BoxDecoration(
                            color: const Color(0xFF1EAFCD),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: InkWell(
                            onTap: () async {
                      
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
                                FutureBuilder<Incidents?>(
                                    future:
                                        DbServices.instance.getNumOfIncidents(),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        return Text(
                                            "Detected incidents: ${snapshot.data!.numOfIncident!}",
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600));
                                      }
                                      return const Text(
                                          "No incidents were detected!",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600));
                                    }),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // const Shape()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
