import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class scanScreen extends StatefulWidget {
  const scanScreen({super.key});

  @override
  State<scanScreen> createState() => _scanScreenState();
}

// ini untuk declare barcode default manual
String _scanBarcode = 'Unknown';

class _scanScreenState extends State<scanScreen> {
  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Stack(children: [
            Container(
              height: height,
              width: width,
              color: Colors.red,
            ),
            Positioned(
              top: 260,
              // bottom: 0,
              child: Container(height: 300, width: width, child: Text("Scan")),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: 90,
                width: width,
                color: Colors.green,
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
