import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:munqith_app/pages/pre_login_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? dropDownValue;
  bool loading = true;
  TextEditingController? textController1;
  TextEditingController? textController2;
  TextEditingController? textController3;
  TextEditingController? textController4;
  String? myEmail;
  String? myName;
  String? myPhone;
  String? myPassword;
  late bool passwordVisibility;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  var items = [
    'Jumana',
    'Raneem',
    'Nojood',
    'Shather',
  ];
  String dropdownvalue = 'Jumana';

  Future test() async {
    final firebaseUser = FirebaseAuth.instance.currentUser;

    if (firebaseUser != null) {
      QuerySnapshot snap = await FirebaseFirestore.instance
          .collection("users")
          .where('email', isEqualTo: firebaseUser.email)
          .get();
      if (!mounted) return;
      setState(() {
        myEmail = snap.docs[0]['email'].toString();
        myName = "${snap.docs[0]['firstName']}  ${snap.docs[0]['lastName']}";
        myPhone = snap.docs[0]['phone'].toString();
        myPassword = snap.docs[0]['password'].toString();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    test();
    passwordVisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    // Future.delayed(const Duration(seconds: 2), () {});

    return myName != null
        ? SafeArea(
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height,
                  decoration: const BoxDecoration(
                    color: Color(0xFF1EAFCD),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0, 1.01),
                  child: Container(
                    margin: const EdgeInsets.only(top: 80.0),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      ),
                    ),
                    child: Align(
                      alignment: const AlignmentDirectional(0.15, 0.1),
                      child: SingleChildScrollView(
                        primary: false,
                        child: Center(
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(0, 0),
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 40),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(0, 100, 0, 0),
                                          child: Text(myName!,
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                fontSize: 18,
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      15, 0, 15, 30),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      const Align(
                                        alignment:
                                            AlignmentDirectional(-0.85, -0.55),
                                        child: Text(
                                          'Name:',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color: Color(0xFF1EAFCD),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(15, 0, 0, 0),
                                          child: TextFormField(
                                            controller: textController1 =
                                                TextEditingController(
                                                    text: myName),
                                            obscureText: false,
                                            decoration: const InputDecoration(
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFF5B5F67),
                                                  width: 1,
                                                ),
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFF5B5F67),
                                                  width: 1,
                                                ),
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                              errorBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                              focusedErrorBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                            ),
                                            keyboardType: TextInputType.name,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      15, 0, 15, 30),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      const Align(
                                        alignment:
                                            AlignmentDirectional(-0.85, -0.55),
                                        child: Text(
                                          'Email:',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color: Color(0xFF1EAFCD),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(15, 0, 0, 0),
                                          child: TextFormField(
                                            controller: textController2 =
                                                TextEditingController(
                                                    text: myEmail),
                                            obscureText: false,
                                            decoration: const InputDecoration(
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFF5B5F67),
                                                  width: 1,
                                                ),
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFF5B5F67),
                                                  width: 1,
                                                ),
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                              errorBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                              focusedErrorBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                            ),
                                            keyboardType:
                                                TextInputType.emailAddress,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      15, 0, 15, 30),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      const Align(
                                        alignment:
                                            AlignmentDirectional(-0.85, -0.55),
                                        child: Text(
                                          'Phone:',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color: Color(0xFF1EAFCD),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(15, 0, 0, 0),
                                          child: TextFormField(
                                            controller: textController3 =
                                                TextEditingController(
                                                    text: myPhone),
                                            obscureText: false,
                                            decoration: const InputDecoration(
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFF5B5F67),
                                                  width: 1,
                                                ),
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFF5B5F67),
                                                  width: 1,
                                                ),
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                              errorBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                              focusedErrorBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                            ),
                                            keyboardType: TextInputType.phone,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      15, 0, 15, 30),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      const Align(
                                        alignment:
                                            AlignmentDirectional(-0.85, -0.55),
                                        child: Text(
                                          'Password:',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color: Color(0xFF1EAFCD),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(15, 0, 0, 0),
                                          child: TextFormField(
                                            controller: textController4 =
                                                TextEditingController(
                                                    text: myPassword),
                                            obscureText: !passwordVisibility,
                                            decoration: InputDecoration(
                                              enabledBorder:
                                                  const UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFF5B5F67),
                                                  width: 1,
                                                ),
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                              focusedBorder:
                                                  const UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFF5B5F67),
                                                  width: 1,
                                                ),
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                              errorBorder:
                                                  const UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                              focusedErrorBorder:
                                                  const UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                              suffixIcon: InkWell(
                                                onTap: () => setState(
                                                  () => passwordVisibility =
                                                      !passwordVisibility,
                                                ),
                                                focusNode: FocusNode(
                                                    skipTraversal: true),
                                                child: Icon(
                                                  passwordVisibility
                                                      ? Icons
                                                          .visibility_outlined
                                                      : Icons
                                                          .visibility_off_outlined,
                                                  color:
                                                      const Color(0xFF757575),
                                                  size: 22,
                                                ),
                                              ),
                                            ),
                                            keyboardType:
                                                TextInputType.visiblePassword,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      15, 0, 15, 30),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      const Align(
                                        alignment:
                                            AlignmentDirectional(-0.85, -0.55),
                                        child: Text(
                                          'Alarm Sound:',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color: Color(0xFF1EAFCD),
                                          ),
                                        ),
                                      ),
                                      DropdownButton(
                                        // Initial Value
                                        value: dropdownvalue.isNotEmpty
                                            ? dropdownvalue
                                            : null,

                                        // Down Arrow Icon
                                        icon: const Icon(
                                            Icons.keyboard_arrow_down),

                                        // Array list of items
                                        items: items.map((String items) {
                                          return DropdownMenuItem(
                                            value: items,
                                            child: Text(items),
                                          );
                                        }).toList(),
                                        // After selecting the desired option,it will
                                        // change button value to selected value
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            dropdownvalue = newValue!;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0, -0.95),
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 120),
                    width: 150,
                    height: 150,
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      'assets/images/profile.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
          )
        : Container(
            color: Colors.white,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
  }
}
