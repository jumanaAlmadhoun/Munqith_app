import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../pages/pre_login_page.dart';

class Layout extends StatelessWidget {
  final withSignOutButton;

  Layout({Key? key, required this.body, required this.withSignOutButton})
      : super(key: key);
  final Widget body;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
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
        actions: withSignOutButton
            ? [
                IconButton(
                  icon: const Icon(
                    Icons.exit_to_app_rounded,
                    color: Colors.white,
                    size: 35,
                  ),
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                    FirebaseAuth.instance.userChanges();
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PreLoginPage()));
                  },
                ),
              ]
            : const [],
        centerTitle: true,
        elevation: 2,
      ),
      body: SafeArea(
          // child: SingleChildScrollView(child: body),
          child: CustomScrollView(
        slivers: [
          SliverFillRemaining(hasScrollBody: false, child: body),
        ],
      )),
    );
  }
}
