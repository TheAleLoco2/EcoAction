import 'package:eco_action/main.dart';
import 'package:eco_action/models/user_model.dart';
import 'package:eco_action/screens/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'friends_page.dart';
import 'home_page.dart';

class ParentPage extends StatefulWidget {
  @override
  _ParentPageState createState() => _ParentPageState();
}

class _ParentPageState extends State<ParentPage> {
  FacebookAuth _facebookAuth = FacebookAuth.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;

  int _selectedIndex = 1;
  var _userData;

  List<Widget> _pages = <Widget>[
    ProfilePage(),
    HomePage(),
    FriendsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();

    //isLoggedIn();
  }

  void isLoggedIn() {
    _auth.authStateChanges().listen((User user) async {
      if (user == null) {
        print('User is currently signed out!');
        Provider.of<FacebookProvider>(context, listen: false)
            .setLoggedIn(false);
        Provider.of<FacebookProvider>(context, listen: false)
            .setActualUser(null);
      } else {
        print('User is signed in!');
        Provider.of<FacebookProvider>(context, listen: false).setLoggedIn(true);
        Provider.of<FacebookProvider>(context, listen: false)
            .setActualUser(await getUserData());
      }
    });
  }

  Future<UserModel> getUserData() async {
    _userData = await _facebookAuth.getUserData();
    return UserModel(
      _userData["name"],
      _userData["email"],
      _userData["picture"]["data"]["url"],
      _auth.currentUser.uid,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.poll),
            label: 'Statistics',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Friends',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
