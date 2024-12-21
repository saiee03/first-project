import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRCodeScreen extends StatefulWidget {
  const QRCodeScreen({super.key});

  @override
  State<QRCodeScreen> createState() => _QRCodeScreenState();
}

class _QRCodeScreenState extends State<QRCodeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scan QR Code')),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: MobileScanner(
              onDetect: (barcode) {
                if (barcode.rawValue != null) {
                  final String code = barcode.rawValue!;
                  // Handle QR code result
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Scanned: $code')),
                  );
                  // Stop the scanner and navigate back
                  Navigator.pop(context);
                }
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Back to Home'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

extension on BarcodeCapture {
  get rawValue => null;
}
