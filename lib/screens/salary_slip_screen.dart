import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class SalarySlipScreen extends StatelessWidget {
  const SalarySlipScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Generate Salary Slip')),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final pdf = pw.Document();
            pdf.addPage(
              pw.Page(
                build: (context) => pw.Center(
                  child: pw.Text('Salary Slip\nEmployee Name: John Doe\nSalary: \$2000'),
                ),
              ),
            );
            await Printing.layoutPdf(onLayout: (format) => pdf.save());
          },
          child: const Text('Generate PDF'),
        ),
      ),
    );
  }
}