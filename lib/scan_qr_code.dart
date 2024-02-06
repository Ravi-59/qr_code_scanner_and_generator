import'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanQRCode extends StatefulWidget {
  const ScanQRCode({super.key});

  @override
  State<ScanQRCode> createState() => _ScanQRCodeState();
}

class _ScanQRCodeState extends State<ScanQRCode> {
  String qrResult = 'Scanned Data Will appear here';
  Future<void> scanQR()async{
    try{
      final qrcode = await FlutterBarcodeScanner.scanBarcode('#ff666', 'Cancel', true, ScanMode.QR);
      if(!mounted)return;
      setState(() {
        this.qrResult = qrcode.toString();
      });
    }on PlatformException{
      qrResult = 'Fail to Read QR Code';

    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('QR Code Scanner'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30,),
            Text('$qrResult', style: TextStyle(color: Colors.black),),
            SizedBox(height: 30,),
            ElevatedButton(onPressed: scanQR, child: Text('Scan QR Code'))
          ],
        ),
      ),
    );
  }
}
