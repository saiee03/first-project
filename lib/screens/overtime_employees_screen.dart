import 'package:flutter/material.dart';

class OvertimeEmployeesScreen extends StatelessWidget {
  const OvertimeEmployeesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final overtimeData = [
      {'Name': 'John Doe', 'Overtime Hours': 8},
      {'Name': 'Jane Smith', 'Overtime Hours': 10},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Overtime Employees')),
      body: ListView.builder(
        itemCount: overtimeData.length,
        itemBuilder: (context, index) {
          final employee = overtimeData[index];
          return ListTile(
            title: Text(employee['Name'] as String),
            subtitle: Text('Overtime Hours: ${employee['Overtime Hours']}'),
          );
        },
      ),
    );
  }
}
