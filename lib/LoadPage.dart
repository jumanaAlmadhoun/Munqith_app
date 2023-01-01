import '../pre_loginpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';

class LoadPageWidget extends StatefulWidget {
  const LoadPageWidget({Key? key}) : super(key: key);

  @override
  _LoadPageWidgetState createState() => _LoadPageWidgetState();
}

class _LoadPageWidgetState extends State<LoadPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _navigateToPreLogin();
  }

  _navigateToPreLogin() async {
    await Future.delayed(Duration(milliseconds: 3500), () {});
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: ((context) => PreLoginpageWidget())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFF1BB4D3),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: InkWell(
            onTap: () async {
              await Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => PreLoginpageWidget(),
                ),
                (r) => false,
              );
            },
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFF1BB4D3),
              ),
              child: Align(
                alignment: AlignmentDirectional(0, 0),
                child: Image.asset(
                  'assets/images/MONQITH-WHITE.png',
                  width: 300,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
