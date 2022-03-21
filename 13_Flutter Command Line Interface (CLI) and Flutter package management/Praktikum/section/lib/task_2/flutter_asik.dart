import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';

class FlutterAsik extends StatelessWidget {
  const FlutterAsik({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BarcodeWidget(
            barcode: Barcode.qrCode(
              errorCorrectLevel: BarcodeQRCorrectionLevel.high,
            ),
            data: 'Flutter Asik',
            width: 200,
            height: 200,
            drawText: true,
          ),
          const Text('Flutter Asik', style: TextStyle(color: Colors.black, fontSize: 30),)
        ],
      ),
    );
  }
}