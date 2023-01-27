import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/incidents.dart';
import '../widgets/history_card.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List<Object> _historylist = [];
  Future getUserIncidents() async {
    final firebaseUser = FirebaseAuth.instance.currentUser?.email;
    var data = await FirebaseFirestore.instance
        .collection('history')
        .doc(firebaseUser)
        .collection('incidents')
        .orderBy("Date", descending: true)
        .get();
    setState(() {
      _historylist =
          List.from(data.docs.map((doc) => Incidents.fromSnapshot(doc)));
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getUserIncidents();
  }

//------------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return _historylist.isEmpty
        ? Container(
            color: Colors.white,
            child: Center(
                child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(30, 0, 30, 0),
              child: Text(
                "No drowning case has been determined! Everyone is safe",
                style: Theme.of(context).textTheme.titleMedium,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            )),
          )
        : Scaffold(
            body: SafeArea(
              child: ListView.builder(
                itemCount: _historylist.length,
                itemBuilder: (context, index) {
                  return HistoryCard(_historylist[index] as Incidents);
                },
              ),
            ),
          );
  }
}
