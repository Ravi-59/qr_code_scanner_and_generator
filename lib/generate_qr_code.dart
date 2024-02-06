import'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateQRCode extends StatefulWidget {
  const GenerateQRCode({super.key});

  @override
  State<GenerateQRCode> createState() => _GenerateQRCodeState();
}

class _GenerateQRCodeState extends State<GenerateQRCode> {
  TextEditingController urlContoller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Generate QR Code'),),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if(urlContoller.text.isNotEmpty)
                QrImageView(data:urlContoller.text,size:200,),
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: TextField(
                  controller: urlContoller,
                  decoration: InputDecoration(
                    hintText: 'Enter Your Data',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                    labelText: 'Enter Your Data'
                  ),
                ),
              ),
              SizedBox(height: 10,),
              ElevatedButton(onPressed: (){
                setState(() {
                });
              }, child: Text('Generete QR Code')),
            ],
          ),
        ),
      ),
    );
  }
}
