import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:munqith_app/pages/navigation_page.dart';
import 'package:munqith_app/pages/pre_login_page.dart';

class SplashPageWidget extends StatefulWidget {
  const SplashPageWidget({Key? key}) : super(key: key);

  @override
  State<SplashPageWidget> createState() => _SplashPageWidgetState();
}

class _SplashPageWidgetState extends State<SplashPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  _navigateToNextScreen() {
    Future.delayed(const Duration(milliseconds: 3500), () {
      Widget nextPage = FirebaseAuth.instance.currentUser == null
          ? const PreLoginPage()
          : const NavigationPage();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: ((context) => nextPage),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color(0xFF1BB4D3),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            color: Color(0xFF1BB4D3),
          ),
          child: Align(
            alignment: const AlignmentDirectional(0, 0),
            child: Image.asset(
              'assets/images/MONQITH-WHITE.png',
              width: 300,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
