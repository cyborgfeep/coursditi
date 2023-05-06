import 'dart:io';

import 'package:coursditi/main.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  bool isFlash=false;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        print(result!.code);
        print(result!.format);
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 300.0
        : 300.0;
    return Scaffold(
      body: SafeArea(
          child: Stack(
            children: [
              QRView(
                key: qrKey,
                onQRViewCreated: _onQRViewCreated,
                formatsAllowed: [BarcodeFormat.qrcode],
                overlay: QrScannerOverlayShape(
                    borderColor: Colors.white,
                    borderRadius: 10,
                    borderLength: 30,
                    borderWidth: 10,
                    cutOutSize: scanArea),
              ),
              Positioned(
                top: 20,
                right: 16,
                child: InkWell(
                  onTap: (){
                    controller!.toggleFlash();
                    controller!.getFlashStatus().then((value) {
                      setState(() {
                        isFlash=value!;
                      });
                    });
                  },
                  child: Icon(isFlash?Icons.flash_off:Icons.flash_on,color:Colors.white),
                ),
              )
            ],
          )),
    );
  }
}
