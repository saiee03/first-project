// lib/screens/employee_list_screen.dart
import 'package:flutter/material.dart';
import 'package:sample_ui/model/employee.dart';

class EmployeeListScreen extends StatelessWidget {
  final List<Employee> employees;

  const EmployeeListScreen({super.key, required this.employees});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Employee List')),
      body: employees.isEmpty
          ? const Center(child: Text('No employees registered yet.'))
          : ListView.builder(
              itemCount: employees.length,
              itemBuilder: (context, index) {
                final employee = employees[index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(employee.name),
                    subtitle: Text(employee.designation),
                    trailing: Text(employee.contact),
                  ),
                );
              },
            ),
    );
  }
}

