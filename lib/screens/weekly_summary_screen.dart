import 'package:flutter/material.dart';

class WeeklySummaryScreen extends StatelessWidget {
  const WeeklySummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dummyData = [
      {'Week': '1st - 7th', 'Present': 5, 'Absent': 2},
      {'Week': '8th - 14th', 'Present': 6, 'Absent': 1},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Weekly Summary')),
      body: DataTable(
        columns: const [
          DataColumn(label: Text('Week')),
          DataColumn(label: Text('Present')),
          DataColumn(label: Text('Absent')),
        ],
        rows: dummyData.map((data) {
          return DataRow(cells: [
            DataCell(Text(data['Week'] as String)),
            DataCell(Text(data['Present'].toString())),
            DataCell(Text(data['Absent'].toString())),
          ]);
        }).toList(),
      ),
    );
  }
}
