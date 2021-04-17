import 'package:easacc_task/screens/settingPage_screen.dart';
import 'package:easacc_task/screens/socialLogin_faceBook_screen.dart';
import 'package:easacc_task/screens/socialLogin_google_screen.dart';
import 'package:easacc_task/screens/webView_page.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static final routeName = '/home-screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EASACC Task"),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () => Navigator.of(context)
                    .pushNamed(LoginScreenGoogle.routeName),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    width: MediaQuery.of(context).size.width * .8,
                    height: MediaQuery.of(context).size.height * .1,
                    color: Colors.black26,
                    child: Center(
                      child: Text(
                        "Social Login Page Google",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () => Navigator.of(context)
                    .pushNamed(LoginScreenFaceBook.routeName),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    width: MediaQuery.of(context).size.width * .8,
                    height: MediaQuery.of(context).size.height * .1,
                    color: Colors.black26,
                    child: Center(
                      child: Text(
                        "Social Login Page FaceBook",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () =>
                    Navigator.of(context).pushNamed(SettingPage.routeName),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    width: MediaQuery.of(context).size.width * .8,
                    height: MediaQuery.of(context).size.height * .1,
                    color: Colors.black26,
                    child: Center(
                      child: Text(
                        "Setting Page",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
              // SizedBox(
              //   height: 50,
              // ),
              // GestureDetector(
              //   onTap: () =>
              //       Navigator.of(context).pushNamed(WebViewPage.routeName),
              //   child: ClipRRect(
              //     borderRadius: BorderRadius.circular(20),
              //     child: Container(
              //       width: MediaQuery.of(context).size.width * .8,
              //       height: MediaQuery.of(context).size.height * .1,
              //       color: Colors.black26,
              //       child: Center(
              //         child: Text(
              //           "Web View Page",
              //           style: TextStyle(
              //               color: Colors.white,
              //               fontSize: 20,
              //               fontWeight: FontWeight.bold),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
