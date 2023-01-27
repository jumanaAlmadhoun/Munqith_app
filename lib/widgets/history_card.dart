import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:munqith_app/pages/incidents.dart';

class HistoryCard extends StatelessWidget {
  final Incidents _incidents;

  HistoryCard(this._incidents);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Text(_incidents.query!),
                )
              ],
            ),
            Row(
              children: [
                Text(
                    "Date: ${DateFormat('MM/dd/yyyy').format(_incidents.date!)}"),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
