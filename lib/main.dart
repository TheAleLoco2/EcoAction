import 'package:eco_action/models/user_model.dart';
import 'package:eco_action/screens/parent_page.dart';
import 'package:eco_action/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => FacebookProvider(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        accentColor: kAccentColor,
      ),
      home: ParentPage(),
    );
  }
}

class FacebookProvider with ChangeNotifier {
  bool _isLoggedIn = false;
  UserModel _user;

  bool get isLoggedIn => _isLoggedIn;
  UserModel get user => _user;

  void setLoggedIn(bool log) {
    _isLoggedIn = log;
    notifyListeners();
  }

  void setActualUser(UserModel user) {
    _user = user;
    notifyListeners();
  }
}
