
import 'package:flutter/material.dart';
import 'package:taaki/reportWriter.dart';
import 'scan.dart';
import 'dart:async';
import 'package:flutter_buttons/flutter_buttons.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MainPage> {
  Scanner scanner = new Scanner();
  ReportWriter reportWriter = new ReportWriter();
  String barcode = '';

  get b => null;

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('QR Scanner'),
        ),
        body: new Center(
          child: new ButtonBar(
            children: <Widget>[
              new KRaisedButton(
                radius: 30.0,
                color: Colors.teal,
                text: 'Send Report',
                textColor: Colors.white,
                textFontWeight: FontWeight.bold,
                onPressed: _sendReport,
              ),
              new KRaisedButton(
                radius: 30.0,
                color: Colors.teal,
                text: 'Scan',
                textColor: Colors.white,
                textFontWeight: FontWeight.bold,
                onPressed: _scanQrCode,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future _scanQrCode() async {
    scanner.scan((b) => reportWriter.write(b));
  }

  Future _sendReport() async {

  }
}
