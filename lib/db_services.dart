import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'models/Incidents.dart';

class DbServices {
  static DbServices instance = DbServices();
  FirebaseFirestore storage = FirebaseFirestore.instance;

  Future<Incidents?> getNumOfIncidents() async {
    final firebaseUser = FirebaseAuth.instance.currentUser?.email;
    var snap = await FirebaseFirestore.instance
        .collection("history")
        .doc(firebaseUser)
        .get();

    return Incidents.fromMap(snap);
  }

  getNumOfIncident() async {
    final firebaseUser = FirebaseAuth.instance.currentUser?.email;
    var snap = await FirebaseFirestore.instance
        .collection("history")
        .doc(firebaseUser)
        .get();

    return snap.data()!['NumOfIncident'] as int;
  }
}
