import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Incidents {
  DateTime? date;
  int? numOfIncident;

  Incidents({required this.numOfIncident});
  Map<String, dynamic> toJson() => {'Date': date};
  Incidents.fromSnapshot(snapshot) : date = snapshot.data()['Date'].toDate();

  factory Incidents.fromMap(DocumentSnapshot<Map<String, dynamic>> map) {
    return Incidents(
      numOfIncident: map['NumOfIncident'],
    );
  }
}
