import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/incidents.dart';

class HistoryCard extends StatelessWidget {
  final Incidents _incidents;

  const HistoryCard(this._incidents, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Image.asset(
                  'assets/images/drowning.png',
                  height: 30,
                  width: 30,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: const [
                  Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: Text("Drowning incident detected",
                          style: TextStyle(
                              color: Color(0xFF1EAFCD),
                              fontSize: 15,
                              fontWeight: FontWeight.w600))),
                ],
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 5),
                    child: Icon(
                      Icons.access_time,
                      color: Color(0xFF757575),
                    ),
                  ),
                  Text(
                    DateFormat.yMMMd().add_jm().format(_incidents.date!),
                    style: const TextStyle(
                        color: Color(0xFF757575),
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  )
                ],
              )
            ],
          ),
        ]),
      ),
    );
  }
}
