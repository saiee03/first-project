import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:sample_ui/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Simulate a delay to display the splash screen for a few seconds
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(seconds: 3));

      // Navigate to the next screen (replace 'HomeScreen' with your target screen)
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    });
  }

@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.white, // Set background color to white
    body: Center(
      child: Flexible(
        child: Image.asset(
          'assets/images/ilika_logo.png', // Add your logo path here
          width: 200, // Set desired width
          height: 200, // Set desired height
          fit: BoxFit.contain, // Ensure the image fits within the constraints
        ),
      ),
    ),
  );
}


}