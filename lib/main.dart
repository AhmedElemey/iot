import 'dart:io';

import 'package:easacc_task/provider/google_sign_in.dart';
import 'package:easacc_task/screens/bluetooth_screen.dart';
import 'package:easacc_task/screens/home_screen.dart';
import 'package:easacc_task/screens/bluetooth_screen.dart';
import 'package:easacc_task/screens/logged_in_google.dart';
import 'package:easacc_task/screens/settingPage_screen.dart';
import 'package:easacc_task/screens/socialLogin_faceBook_screen.dart';
import 'package:easacc_task/screens/socialLogin_google_screen.dart';
import 'package:easacc_task/screens/webView_page.dart';
import 'package:easacc_task/screens/wifi_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

Future main() async {
  // HttpOverrides.global = new MyHttpOverrides();
  // WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        // ChangeNotifierProvider.value(value: AuthViewModel()),
        ChangeNotifierProvider.value(value: GoogleSignInProvider()),
      ],
      child: MaterialApp(
        // builder: DevicePreview.appBuilder,
        theme: ThemeData(
          primaryColor: Color(0xff294794),
        ),
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
        routes: {
          HomeScreen.routeName: (ctx) => HomeScreen(),
          LoginScreenGoogle.routeName: (ctx) => LoginScreenGoogle(),
          SettingPage.routeName: (ctx) => SettingPage(),
          WebViewPage.routeName: (ctx) => WebViewPage(),
          LoggedInGoogle.routeName: (ctx) => LoggedInGoogle(),
          LoginScreenFaceBook.routeName: (ctx) => LoginScreenFaceBook(),
          WifiScreen.routeName: (ctx) => WifiScreen(),
          BlueToothScreen.routeName: (ctx) =>
              BlueToothScreen("The PDF you gonna print"),
        },
      ),
    ),
  );
}
