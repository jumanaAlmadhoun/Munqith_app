import 'package:flutter/material.dart';
import 'package:munqith_app/pages/navigation_page.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xFF1EAFCD),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: double.infinity,
            height: 30,
            decoration: const BoxDecoration(
              color: Color(0xFF1EAFCD),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
                shape: BoxShape.rectangle,
                border: Border.all(
                  color: Colors.white,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Align(
                        alignment: AlignmentDirectional(-0.05, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 20, 0, 8),
                          child: Text(
                            'History Page',
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
