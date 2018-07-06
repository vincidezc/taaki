import 'package:flutter/material.dart';
import 'package:taaki/fileHelper.dart';
import 'package:taaki/reportReader.dart';
import 'package:taaki/reportWriter.dart';
import 'scan.dart';
import 'dart:async';
import 'package:flutter_buttons/flutter_buttons.dart';
import 'package:share/share.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MainPage> {
  Scanner scanner = new Scanner();
  ReportWriter _reportWriter = new ReportWriter();
  ReportReader _reportReader = new ReportReader();

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
          title: new Text('TAAKI', style: new TextStyle(color: Colors.black)),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: new Center(
          child: new ButtonBar(
            children: <Widget>[
              new KRaisedButton(
                radius: 30.0,
                color: Colors.red,
                text: 'Send to GDrive',
                textColor: Colors.white,
                textFontWeight: FontWeight.bold,
                onPressed: _sendReport,
                icon: new Icon(Icons.send),
              ),
              new KRaisedButton(
                radius: 30.0,
                color: Colors.blue,
                text: 'Scan',
                textColor: Colors.white,
                textFontWeight: FontWeight.bold,
                onPressed: _scanQrCode,
                icon: new Icon(Icons.party_mode),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future _scanQrCode() async {
    scanner.scan(_reportWriter.write);
  }

  Future _sendReport() async {
    _reportReader.read().then(_shareData);
  }

  void _shareData(data) async {
    if (data == "") {
      _noDataAlert();
      return;
    }

    final RenderBox box = context.findRenderObject();
    Share
        .plainText(text: data, title: "data.tab")
        .share(sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }

  Future<Null> _noDataAlert() async {
    return showDialog<Null>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text(widget.title),
          content: new SingleChildScrollView(
            child: new ListBody(
              children: <Widget>[
                new Text("There is no data to share for the day.")
              ],
            ),
          ),
          actions: <Widget>[
            new FlatButton(
              child: new Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
