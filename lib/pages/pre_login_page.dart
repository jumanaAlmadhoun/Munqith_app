import 'package:munqith_app/pages/login_page.dart';

import 'sign_up_page.dart';
import 'package:flutter/material.dart';

class PreLoginPage extends StatefulWidget {
  const PreLoginPage({Key? key}) : super(key: key);

  @override
  State<PreLoginPage> createState() => _PreLoginPageState();
}

class _PreLoginPageState extends State<PreLoginPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(80, 0, 0, 0),
          child: Image.asset(
            'assets/images/MONQITH.png',
            width: 200,
            height: 100,
            fit: BoxFit.cover,
          ),
        ),
        actions: const [],
        centerTitle: false,
        elevation: 2,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
                  child: SizedBox(
                    width: 330, // <-- Your width
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () async {
                        await Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1BB4D3),
                          shape: const StadiumBorder()),
                      child: const Text('Log in'),
                    ),
                  ),
                ),
                SizedBox(
                  width: 330,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async {
                      await Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpPage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF5B5F67),
                        shape: const StadiumBorder()),
                    child: const Text('Sign up'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
