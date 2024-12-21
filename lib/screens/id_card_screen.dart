// lib/screens/id_card_screen.dart
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class IDCardScreen extends StatelessWidget {
  final String userId;
  const IDCardScreen({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your ID Card')),
      body: Center(
        child: Card(
          elevation: 8,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Employee ID Card',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                QrImageView(
                  data: 'User ID: $userId',
                  version: QrVersions.auto,
                  size: 150,
                ),
                const SizedBox(height: 16),
                Text(
                  'User ID: $userId',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Scan this QR code to mark attendance.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
