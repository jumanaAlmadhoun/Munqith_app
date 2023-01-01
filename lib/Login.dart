import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../pre_loginpage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'Nav.dart';
import 'User.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  TextEditingController? EmailController;
  TextEditingController? textController2;

  late bool passwordVisibility;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late SharedPreferences sharedPreferences;

  @override
  void initState() {
    super.initState();
    EmailController = TextEditingController();
    textController2 = TextEditingController();
    passwordVisibility = false;
  }

  @override
  void dispose() {
    EmailController?.dispose();
    textController2?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: Align(
          alignment: AlignmentDirectional(0.15, 0),
          child: InkWell(
            onTap: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PreLoginpageWidget(),
                ),
              );
            },
            child: const FaIcon(
              FontAwesomeIcons.angleLeft,
              color: Color(0xFF5B5E66),
              size: 27,
            ),
          ),
        ),
        title: Align(
          alignment: const AlignmentDirectional(-0.5, 0),
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
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                  child: SizedBox(
                    width: 350,
                    child: TextFormField(
                      controller: EmailController,
                      autofocus: true,
                      obscureText: false,
                      decoration: const InputDecoration(
                        hintText: 'Email',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF5B5F67),
                            width: 1,
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 50),
                  child: SizedBox(
                    width: 350,
                    child: TextFormField(
                      controller: textController2,
                      autofocus: true,
                      obscureText: !passwordVisibility,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF5B5F67),
                            width: 1,
                          ),
                        ),
                        suffixIcon: InkWell(
                          onTap: () => setState(
                            () => passwordVisibility = !passwordVisibility,
                          ),
                          focusNode: FocusNode(skipTraversal: true),
                          child: Icon(
                            passwordVisibility
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: const Color(0xFF757575),
                            size: 22,
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.visiblePassword,
                    ),
                  ),
                ),
                SizedBox(
                  width: 330,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async {
                      FocusScope.of(context).unfocus();
                      final email = EmailController!.text.trim();
                      final password = textController2!.text.trim();

                      if (email.isEmpty) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("Email is still empty!"),
                        ));
                      } else if (password.isEmpty) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("Password is still empty!"),
                        ));
                      } else {
                        QuerySnapshot snap = await FirebaseFirestore.instance
                            .collection("users")
                            .where('email', isEqualTo: email)
                            .get();

                        try {
                          if (password == snap.docs[0]['password']) {
                            sharedPreferences =
                                await SharedPreferences.getInstance();

                            sharedPreferences
                                .setString('email', email)
                                .then((_) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Nav()));
                            });
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Password is not correct!"),
                            ));
                          }
                        } catch (e) {
                          String error = " ";

                          if (e.toString() ==
                              "RangeError (index): Invalid value: Valid value range is empty: 0") {
                            setState(() {
                              error = "Email does not exist!";
                            });
                          } else {
                            setState(() {
                              error = "Error occurred!";
                            });
                          }

                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(error),
                          ));
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        primary: const Color(0xFF1BB4D3),
                        shape: const StadiumBorder()),
                    child: const Text('Log in'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /*Future signIn({required String email, required String password}) async {
    Stream<List<User>> readUsers() => FirebaseFirestore.instance
        .collection('users')
        .snapshots()
        .map((snapshots) =>
            snapshots.docs.map((doc) => User.fromJson(doc.data())).toList());
  }*/
}
