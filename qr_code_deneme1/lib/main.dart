import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QRScannerPage(),
    );
  }
}

class QRScannerPage extends StatefulWidget {
  @override
  _QRScannerPageState createState() => _QRScannerPageState();
}

class _QRScannerPageState extends State<QRScannerPage> {
  QRViewController? _controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      _controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      // QR kodu tarandığında yapılacak işlemleri burada gerçekleştirin.
      if (scanData.code!.isNotEmpty) {
        // scanData.code içinde QR kodunun içeriği bulunur.
        // Bu içerik genellikle bir URL olacaktır.
        // Yönlendirme veya ilgili işlemleri burada yapabilirsiniz.

        String? code = scanData.code; // nullable bir String
        if (code != null) {
          String url = code; // nullable olmayan bir String'e atanıyor
          // ignore: deprecated_member_use
          launch(
              url); // Taranan URL'yi tarayıcıda açmak için launch fonksiyonunu kullanabilirsiniz.
        }
      }
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: QRView(
        key: qrKey,
        onQRViewCreated: _onQRViewCreated,
      ),
    );
  }
}
