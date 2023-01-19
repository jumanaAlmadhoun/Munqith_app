import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:munqith_app/profile.dart';
import 'CPR.dart';
import 'home.dart';

class Nav extends StatefulWidget {
  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const HomeWidget(),
    const Text('Everyone is safe! No drowning incident was detected'),
    const CPR(),
    const ProfileWidget(),
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: SizedBox(
          height: 2000,
          child: Flexible(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
        )),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Home',
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.history,
              ),
              label: 'History',
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.heartbeat,
              ),
              label: 'CPR',
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                label: 'Profile',
                backgroundColor: Colors.white),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTap,
          selectedFontSize: 14.0,
          selectedItemColor: Color(0xFF1BB4D3),
          unselectedItemColor: Color(0xFF757575),
          showUnselectedLabels: true,
          unselectedFontSize: 14.0,
        ),
      ),
    );
  }
}
