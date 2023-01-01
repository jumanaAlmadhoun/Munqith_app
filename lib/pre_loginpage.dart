import '../CreateAccount.dart';
import '../login.dart';
import 'package:flutter/material.dart';

class PreLoginpageWidget extends StatefulWidget {
  const PreLoginpageWidget({Key? key}) : super(key: key);

  @override
  _PreLoginpageWidgetState createState() => _PreLoginpageWidgetState();
}

class _PreLoginpageWidgetState extends State<PreLoginpageWidget> {
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
          padding: EdgeInsetsDirectional.fromSTEB(80, 0, 0, 0),
          child: Image.asset(
            'assets/images/MONQITH.png',
            width: 200,
            height: 100,
            fit: BoxFit.cover,
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
                  child: SizedBox(
                    width: 330, // <-- Your width
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () async {
                        await Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginWidget(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xFF1BB4D3), shape: StadiumBorder()),
                      child: Text('Log in'),
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
                          builder: (context) => CreateAccountWidget(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xFF5B5F67), shape: StadiumBorder()),
                    child: Text('Sign up'),
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
