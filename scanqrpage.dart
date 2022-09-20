import 'package:flutter/material.dart';
import 'package:letmeyoureyes/screens/MapPage.dart';
import 'package:letmeyoureyes/screens/qrpage.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanQRPage extends StatefulWidget {
  const ScanQRPage({Key? key}) : super(key: key);
  @override
  State<ScanQRPage> createState() => _ScanQRPageState();
}

class _ScanQRPageState extends State<ScanQRPage> {
  GlobalKey qrKey = GlobalKey();
  var qrText = "";
  late QRViewController controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: QRView(
                overlayMargin: EdgeInsets.all(20),
                onPermissionSet: (p0, p1) => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MapPage())),
                key: qrKey,
                overlay: QrScannerOverlayShape(
                  borderRadius: 10,
                  borderColor: Colors.cyanAccent,
                  borderLength: 30,
                  borderWidth: 10,
                  cutOutSize: 300,
                ),
                onQRViewCreated: _onQRViewCreate),
          ),
          Expanded(
            child: Center(
              child: Text("scan result: $qrText"),
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _onQRViewCreate(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        qrText = "$scanData";

        print(qrText);

        // if(scanData == qrKey){

        // }
        final qrState = QRPageState();
        qrState.letToPass(passed: true);

        final qr = QRPage();

        if (qr.passed == true) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MapPage()));
        }
      });
    });
  }
}
