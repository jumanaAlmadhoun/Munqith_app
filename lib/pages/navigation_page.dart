import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:munqith_app/pages/history_page.dart';
import 'package:munqith_app/pages/profile_page.dart';
import 'package:munqith_app/widgets/layout.dart';
import 'cpr_page.dart';
import 'home_page.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _selectedIndex = 0;

  final List<Widget> pages = <Widget>[
    const HomePage(),
    const HistoryPage(),
    const CPRPage(),
    const ProfilePage(),
  ];

  void _onNavigatonItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Layout(
          body: pages.elementAt(_selectedIndex),
          withSignOutButton: _selectedIndex == 3),
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
              FontAwesomeIcons.heartPulse,
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
        onTap: _onNavigatonItemTap,
        selectedFontSize: 14.0,
        selectedItemColor: const Color(0xFF1BB4D3),
        unselectedItemColor: const Color(0xFF757575),
        showUnselectedLabels: true,
        unselectedFontSize: 14.0,
      ),
    );
  }
}
