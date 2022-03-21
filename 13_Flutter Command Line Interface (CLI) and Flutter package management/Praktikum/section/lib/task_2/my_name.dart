import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';

class NamePage extends StatelessWidget {
  const NamePage({Key? key}) : super(key: key);

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
            data: 'Kevin Pedro Qozzo',
            width: 200,
            height: 200,
            drawText: true,
          ),
         const Text('My Name', style: TextStyle(color: Colors.black, fontSize: 30),)
        ],
      ),
    );
  }
}