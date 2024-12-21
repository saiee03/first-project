// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:sample_ui/screens/registration_screen.dart';
import 'package:sample_ui/widget/colors.dart';
import 'salary_slip_screen.dart';
import 'weekly_summary_screen.dart';
import 'overtime_employees_screen.dart';
import 'qr_code_screen.dart';
import 'registration_screen.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.babyBlue , AppColors.charcoalGray],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Card(
            elevation: 8,
            margin: const EdgeInsets.all(16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Welcome to the Attendance System!',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Divider(height: 32, thickness: 2),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const QRCodeScreen()),
                      );
                    },
                    icon: const Icon(Icons.qr_code),
                    label: const Text('Mark Attendance (QR Code)'),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegistrationScreen()),
                      );
                    },
                    icon: const Icon(Icons.badge),
                    label: const Text('Employee Registration'),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SalarySlipScreen()),
                      );
                    },
                    icon: const Icon(Icons.attach_money),
                    label: const Text('Generate Salary Slip'),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const WeeklySummaryScreen()),
                      );
                    },
                    icon: const Icon(Icons.calendar_today),
                    label: const Text('Weekly Summary Report'),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const OvertimeEmployeesScreen()),
                      );
                    },
                    icon: const Icon(Icons.timelapse),
                    label: const Text('Overtime Employees'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
