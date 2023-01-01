import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AlarmWidget extends StatefulWidget {
  const AlarmWidget({Key? key}) : super(key: key);

  @override
  _AlarmWidgetState createState() => _AlarmWidgetState();
}

class _AlarmWidgetState extends State<AlarmWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color(0xFFBE0815),
      body: Align(
        alignment: const AlignmentDirectional(0, 0),
        child: SizedBox(
          width: double.infinity,
          child: Stack(
            alignment: const AlignmentDirectional(0, 0),
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    height: 320,
                    decoration: const BoxDecoration(
                      color: Color(0xFFBE0815),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Align(
                          alignment: AlignmentDirectional(0.95, 0),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                            child: Icon(
                              Icons.close,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/alert.png',
                              width: 160,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'DROWNING\nINCIDENT',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 35,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0, 0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 417,
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
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 150, 0, 30),
                              child: SizedBox(
                                width: 330,
                                height: 50,
                                child: ElevatedButton.icon(
                                  onPressed: () async {
                                    await FlutterPhoneDirectCaller.callNumber(
                                        "+997");
                                  },
                                  style: ElevatedButton.styleFrom(
                                      primary: const Color(0xFFBE0815),
                                      shape: const StadiumBorder()),
                                  icon: const Icon(Icons.call),
                                  label: const Text('Call Authorities'),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 330,
                              height: 50,
                              child: OutlinedButton.icon(
                                onPressed: () {
                                  print('Button pressed ...');
                                },
                                style: OutlinedButton.styleFrom(
                                    side: const BorderSide(
                                      width: 3,
                                      color: Color(0xFFBE0815),
                                      style: BorderStyle.solid,
                                    ),
                                    shape: const StadiumBorder()),
                                icon: const FaIcon(
                                  FontAwesomeIcons.heartbeat,
                                  color: Color(0xFFBE0815),
                                ),
                                label: const Text('CPR Instriction',
                                    style: TextStyle(color: Color(0xFFBE0815))),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
