import 'dart:async';
import 'package:flutter/services.dart'; // For PlatformException

import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';

//import 'package:qr_flutter/qr_flutter.dart'; Not yet used
import 'package:flutter/rendering.dart';

class ScanQrCodePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new ScanQrCodePageState();
  }
}

class ScanQrCodePageState extends State<ScanQrCodePage> {
  String barcode = "";

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RaisedButton(
            textColor: Colors.white,
            color: Colors.black,
            highlightColor: Colors.black54,
            splashColor: Colors.grey,
            onPressed: scan,
            child: const Text('START CAMERA SCAN')),
        Text(
          barcode,
          textAlign: TextAlign.center,
        )
      ],
    );
  }

  Future scan() async {
    try {
      String barcode = await BarcodeScanner.scan();
      setState(() => this.barcode = barcode);
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          this.barcode = 'The user did not grant the camera permission!';
        });
      } else {
        setState(() => this.barcode = 'Unknown error: $e');
      }
    } on FormatException {
      setState(() => this.barcode =
          'null (User returned using the "back"-button before scanning anything. Result)');
    } catch (e) {
      setState(() => this.barcode = 'Unknown error: $e');
    }
  }
}
