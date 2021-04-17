// import 'package:easacc_task/provider/google_sign_in.dart';
// import 'package:easacc_task/screens/home_screen.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:provider/provider.dart';
//
// class LoginScreenGoogle extends StatefulWidget {
//   static final routeName = '/socialLogin-screen';
//
//   @override
//   _LoginScreenGoogleState createState() => _LoginScreenGoogleState();
// }
//
// class _LoginScreenGoogleState extends State<LoginScreenGoogle> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold();
//   }
// }
import 'package:easacc_task/provider/google_sign_in.dart';
import 'package:easacc_task/screens/logged_in_google.dart';
import 'package:easacc_task/widgets/background_painter.dart';
import 'package:easacc_task/widgets/sign_up_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreenGoogle extends StatelessWidget {
  static final routeName = '/socialLoginGoogle-screen';
  @override
  Widget build(BuildContext context) => Scaffold(
        body: ChangeNotifierProvider(
          create: (context) => GoogleSignInProvider(),
          child: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              final provider = Provider.of<GoogleSignInProvider>(context);

              if (provider.isSigningIn) {
                return buildLoading();
              } else if (snapshot.hasData) {
                return LoggedInGoogle();
              } else {
                return SignUpWidget();
              }
            },
          ),
        ),
      );

  Widget buildLoading() => Stack(
        fit: StackFit.expand,
        children: [
          CustomPaint(painter: BackgroundPainter()),
          Center(child: CircularProgressIndicator()),
        ],
      );
}
