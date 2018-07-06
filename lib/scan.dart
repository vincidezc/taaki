import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
import 'dart:async';

class Scanner {
  String barcode = "";

  Future scan(delegate) async {
    try {
      String barcode = await BarcodeScanner.scan();
      delegate(barcode);
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        delegate('The user did not grant the camera permission!');
      } else {
        delegate('Unknown error: $e');
      }
    } on FormatException {
      // setState(() => this.barcode =
      // 'null (User returned using the "back"-button before scanning anything. Result)');
    } catch (e) {
      delegate('Unknown error: $e');
    }
  }
}
