import 'package:flutter/material.dart';
import 'package:kablosuzbeyin/authentication/AuthService.dart';
import 'package:kablosuzbeyin/screens/home/Events.dart';
import 'package:kablosuzbeyin/screens/home/Profile.dart';
import 'package:titled_navigation_bar/titled_navigation_bar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();

  int _currentIndex = 0;
  final List<Widget> _children = [Events(), Profile()];
  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      
      body: _children[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.white),
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewPadding.bottom),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: onTappedBar,
          items: [
            BottomNavigationBarItem(
              label: 'Anasayfa',
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(label: 'Profil', icon: Icon(Icons.school)),
          ],
        ),
      ),
    );
  }
}
