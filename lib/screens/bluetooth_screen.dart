import 'package:flutter/material.dart';
import 'package:easacc_task/widgets/printer.dart';
import 'dart:typed_data';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class BlueToothScreen extends StatelessWidget {
  static final routeName = '/bluetooth-screen';
  BlueToothScreen(this.title);
  final doc = pw.Document();
  final String title;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text(title)),
        body: PdfPreview(
          build: (format) => _generatePdf(format, title),
        ),
      ),
    );
  }

  Future<Uint8List> _generatePdf(PdfPageFormat format, String title) async {
    final pdf = pw.Document();
    PdfPreview(
      build: (format) => doc.save(),
    );
    pdf.addPage(
      pw.Page(
        pageFormat: format,
        build: (context) {
          return pw.Center(
            child: pw.Text(title),
          );
        },
      ),
    );

    return pdf.save();
  }
  // static final routeName = '/bluetooth-screen';
  // //
  // /// Example Data
  // final List<Map<String, dynamic>> data = [
  //   {
  //     'title': 'Product 1',
  //     'price': 10000,
  //     'qty': 2,
  //     'total_price': 20000,
  //   },
  //   {
  //     'title': 'Product 2',
  //     'price': 20000,
  //     'qty': 2,
  //     'total_price': 40000,
  //   },
  //   {
  //     'title': 'Product 3',
  //     'price': 12000,
  //     'qty': 1,
  //     'total_price': 12000,
  //   },
  // ];
  //
  // @override
  // Widget build(BuildContext context) {
  //   int _total = 0;
  //
  //   for (var i = 0; i < data.length; i++) {
  //     _total += data[i]['total_price'];
  //   }
  //
  //   return Scaffold(
  //     appBar: AppBar(title: Text('BlueTooth Printer')),
  //     body: Column(
  //       children: <Widget>[
  //         Expanded(
  //           child: ListView.builder(
  //             itemCount: data.length,
  //             itemBuilder: (c, i) {
  //               return ListTile(
  //                 title: Text(data[i]['title']),
  //                 subtitle: Text('Rp ${data[i]['price']} x ${data[i]['qty']}'),
  //                 trailing: Text('Rp ${data[i]['total_price']}'),
  //               );
  //             },
  //           ),
  //         ),
  //         Container(
  //           color: Colors.grey[200],
  //           padding: EdgeInsets.all(20),
  //           child: Row(
  //             children: <Widget>[
  //               Column(
  //                 children: <Widget>[
  //                   Text(
  //                     'Total :',
  //                     style: TextStyle(fontWeight: FontWeight.bold),
  //                   ),
  //                   Text(
  //                     'Rp $_total :',
  //                     style: TextStyle(fontWeight: FontWeight.bold),
  //                   )
  //                 ],
  //               ),
  //               SizedBox(width: 20),
  //               Expanded(
  //                 child: FlatButton(
  //                   color: Theme.of(context).primaryColor,
  //                   textColor: Colors.white,
  //                   child: Text('Print'),
  //                   onPressed: () {
  //                     Navigator.push(context,
  //                         MaterialPageRoute(builder: (_) => Print(data)));
  //                   },
  //                 ),
  //               )
  //             ],
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }
}
