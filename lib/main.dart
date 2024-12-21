// Flutter Main Entry Point
import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/splash_screen.dart'; // Import the SplashScreen file

void main() {
  runApp(const AttendanceApp());
}

class AttendanceApp extends StatelessWidget {
  const AttendanceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Attendance System',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const SplashScreen(), // Set SplashScreen as the initial screen
      debugShowCheckedModeBanner: false,
    );
  }
}
