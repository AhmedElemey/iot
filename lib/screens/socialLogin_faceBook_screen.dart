import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';

class LoginScreenFaceBook extends StatefulWidget {
  static final routeName = '/socialLoginFacebook-screen';
  @override
  _LoginScreenFaceBookState createState() => _LoginScreenFaceBookState();
}

class _LoginScreenFaceBookState extends State<LoginScreenFaceBook> {
  bool _isLogin = false;
  FirebaseAuth _auth = FirebaseAuth.instance;
  FacebookLogin _facebookLogin = FacebookLogin();
  User _user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: !_isLogin
          ? Center(
              child: OutlinedButton(
                onPressed: () async {
                  await _handelLogin();
                },
                child: Text(
                  "Login With Facebook",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            )
          : Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  CircleAvatar(
                    radius: 80,
                    backgroundImage: NetworkImage(_user.photoURL),
                  ),
                  Text(
                    _user.displayName,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  OutlinedButton(
                    onPressed: () async {
                      await _signOut();
                    },
                    child: Text(
                      "LogOut",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Future _handelLogin() async {
    FacebookLoginResult _result = await _facebookLogin.logIn();
    switch (_result.status) {
      case FacebookLoginStatus.cancel:
        print("CancelledByUser");
        break;
      case FacebookLoginStatus.error:
        print("error");
        break;
      case FacebookLoginStatus.success:
        await _loginWithFacebook(_result);
        break;
    }
  }

  Future _loginWithFacebook(FacebookLoginResult _result) async {
    FacebookAccessToken _accessToken = _result.accessToken;
    AuthCredential _credential =
        FacebookAuthProvider.credential(_accessToken.token);
    var a = await _auth.signInWithCredential(_credential);
    setState(() {
      _isLogin = true;
      _user = a.user;
    });
  }

  Future _signOut() async {
    await _auth.signOut().then((value) {
      setState(() {});
      _facebookLogin.logOut();
      _isLogin = false;
    });
  }
}
