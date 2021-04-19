import 'package:easacc_task/screens/bluetooth_screen.dart';
import 'package:easacc_task/screens/webView_page.dart';
import 'package:easacc_task/screens/wifi_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

// import 'package:printing/printing.dart';
class SettingPage extends StatefulWidget {
  static final routeName = '/setting-screen';
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  TextEditingController _urlController = TextEditingController();

  String dropdownValue = 'bluetooth';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: Text(
                      "Enter Url :",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: MediaQuery.of(context).size.height * 0.08,
                      padding: const EdgeInsets.only(top: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: TypeAheadFormField(
                        textFieldConfiguration: TextFieldConfiguration(
                            controller: this._urlController,
                            decoration: InputDecoration(labelText: 'Url')),
                        onSaved: (value) => _urlController.text = value,
                        hideOnError: true,
                      ),
                      // TextFormField(
                      //     // autofocus: true,
                      //     textDirection: TextDirection.ltr,
                      //     decoration: InputDecoration(
                      //       border: OutlineInputBorder(),
                      //       labelText: 'Url ..',
                      //     ),
                      //     keyboardType: TextInputType.url,
                      //     onChanged: (newValueSelected) {
                      //       setState(() {
                      //         _urlController.text = newValueSelected;
                      //       });
                      //     },
                      //     controller: _urlController),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pushNamed(
                      WebViewPage.routeName,
                      arguments: {'url': _urlController.text}),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      width: MediaQuery.of(context).size.width * .5,
                      height: MediaQuery.of(context).size.height * .06,
                      color: Colors.black26,
                      child: Center(
                        child: Text(
                          "Submit to WebView",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              // Row(
              //   children: [
              //     Text(
              //       "choose by :",
              //       style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              //     ),
              //     SizedBox(
              //       width: 10,
              //     ),
              //     DropdownButton<String>(
              //       value: dropdownValue,
              //       icon: const Icon(Icons.arrow_downward),
              //       iconSize: 24,
              //       elevation: 16,
              //       style: const TextStyle(color: Colors.deepPurple),
              //       underline: Container(
              //         height: 2,
              //         color: Colors.deepPurpleAccent,
              //       ),
              //       onChanged: (String newValue) {
              //         print(newValue);
              //         setState(() {
              //           dropdownValue = newValue;
              //           if (newValue == 'bluetooth') {
              //             Navigator.of(context)
              //                 .pushNamed(BlueToothScreen.routeName);
              //           } else {
              //             Navigator.of(context).pushNamed(WifiScreen.routeName);
              //           }
              //         });
              //       },
              //       items: <String>['bluetooth', 'Wifi']
              //           .map<DropdownMenuItem<String>>((String value) {
              //         return DropdownMenuItem<String>(
              //           value: value,
              //           child: Text(value),
              //         );
              //       }).toList(),
              //     ),
              //   ],
              // ),
              Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pushNamed(
                    BlueToothScreen.routeName,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      width: MediaQuery.of(context).size.width * .7,
                      height: MediaQuery.of(context).size.height * .06,
                      color: Colors.purple,
                      child: Center(
                        child: Text(
                          "Print By Bluetooth Or Wifi",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
