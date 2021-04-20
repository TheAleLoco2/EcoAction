import 'package:eco_action/main.dart';
import 'package:eco_action/models/user_model.dart';
import 'package:eco_action/utils/constants.dart';
import 'package:eco_action/widgets/profile_photo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FriendsPage extends StatefulWidget {
  @override
  _FriendsPageState createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  bool _isLoggedIn = false;
  UserModel _user;
  var _userData;

  FirebaseAuth _auth = FirebaseAuth.instance;
  FacebookAuth _facebookAuth = FacebookAuth.instance;

  Future<void> _signOut() async {
    await _auth.signOut().then((value) {
      _facebookAuth.logOut();
      Provider.of<FacebookProvider>(context, listen: false).setLoggedIn(false);
      Provider.of<FacebookProvider>(context, listen: false).setActualUser(null);
    });
  }

  Future<void> _currentAuth() async {
    FirebaseAuth.instance.authStateChanges().listen((User user) async {
      if (user == null) {
        print('User is currently signed out!');
        Provider.of<FacebookProvider>(context, listen: false)
            .setLoggedIn(false);
        //Provider.of<FacebookProvider>(context, listen: false)
        //.setActualUser(null);
      } else {
        print('User is signed in!');
        Provider.of<FacebookProvider>(context, listen: false).setLoggedIn(true);
        Provider.of<FacebookProvider>(context, listen: false)
            .setActualUser(await getUserData());
      }
    });
  }

  Future<UserModel> getUserData() async {
    _userData = await _facebookAuth.getUserData(
        fields: "name,email,picture.width(200),friends");
    print(_userData);
    return UserModel(
      _userData["name"],
      _userData["email"],
      _userData["picture"]["data"]["url"],
      _auth.currentUser.uid,
    );
  }

  Future<void> handleLogin() async {
    final _result = await _facebookAuth
        .login(permissions: ["email", "public_profile", "user_friends"]);
    FacebookAuth.instance.login();
    switch (_result.status) {
      case LoginStatus.cancelled:
        print("Cancelled by user");
        break;
      case LoginStatus.failed:
        print("An error has ocurred");
        break;
      case LoginStatus.success:
        _loginWithFacebook(_result);
        break;
      case LoginStatus.operationInProgress:
        print("...");
        break;
    }
  }

  Future<void> _loginWithFacebook(_result) async {
    AccessToken _accessToken = _result.accessToken;
    AuthCredential _credential =
        FacebookAuthProvider.credential(_accessToken.token);

    await _auth.signInWithCredential(_credential);
    Provider.of<FacebookProvider>(context, listen: false).setLoggedIn(true);
    Provider.of<FacebookProvider>(context, listen: false)
        .setActualUser(await getUserData());
  }

  @override
  void initState() {
    super.initState();

    _currentAuth();
  }

  @override
  Widget build(BuildContext context) {
    _isLoggedIn = context.watch<FacebookProvider>().isLoggedIn;
    _user = context.watch<FacebookProvider>().user;
    return SafeArea(
      child: _isLoggedIn && _user != null
          ? Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  margin: EdgeInsets.all(16),
                  elevation: 4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(16),
                        child: ProfilePhoto(_user.picture, _user.level),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 16),
                          Text(
                            _user.name ?? "",
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                OutlinedButton(
                  onPressed: () async {
                    await _signOut();
                  },
                  child: Text("Sign Out"),
                ),
              ],
            )
          : noUser(),
    );
  }

  noUser() {
    return Container(
      width: double.infinity,
      height: 100,
      child: Center(
        child: OutlinedButton(
          onPressed: () async {
            await handleLogin();
          },
          child: Text("Log In with Facebook"),
        ),
      ),
    );
  }
}
