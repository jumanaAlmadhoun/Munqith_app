import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:munqith_app/Nav.dart';
import 'package:munqith_app/profile.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFF1EAFCD),
      appBar: AppBar(
        backgroundColor: Color(0xFF1EAFCD),
        automaticallyImplyLeading: false,
        title: Image.asset(
          'assets/images/MONQITH-WHITE.png',
          width: 180,
          height: 180,
          fit: BoxFit.contain,
        ),
        actions: [],
        centerTitle: true,
        elevation: 2,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xFF1EAFCD),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: double.infinity,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Color(0xFF1EAFCD),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-0.05, 0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 20, 0, 8),
                                child: Text(
                                  'Welcome',
                                ),
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
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                              child: Container(
                                width: 350,
                                height: 190,
                                decoration: BoxDecoration(
                                  color: Color(0xFFECE4E4),
                                  borderRadius: BorderRadius.circular(25),
                                ),
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
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                              child: Container(
                                width: 350,
                                height: 130,
                                decoration: BoxDecoration(
                                  color: Color(0xFF1EAFCD),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: InkWell(
                                  onTap: () async {
                                    await Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Nav(),
                                      ),
                                    );
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      const Text('HISTORY',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 50)),
                                      Image.asset(
                                        'assets/images/home-icon-h.png',
                                        width: 100,
                                        height: 100,
                                        fit: BoxFit.cover,
                                      ),
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
                                color: Color(0xFFBE0815),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: InkWell(
                                onTap: () => print('hello'),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 100, 0),
                                      child: Text('CPR',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 50)),
                                    ),
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(0.4, 0),
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
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
