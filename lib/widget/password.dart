import 'package:flutter/material.dart';
import 'package:sample_ui/widget/colors.dart';

class PasswordTextBox extends StatefulWidget {
  final TextEditingController controller;
  final Function(String) onChanged;

  const PasswordTextBox({
    Key? key,
    required this.controller,
    required this.onChanged,
  }) : super(key: key);

  @override
  _PasswordTextBoxState createState() => _PasswordTextBoxState();
}

class _PasswordTextBoxState extends State<PasswordTextBox> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: !_isPasswordVisible,
      decoration: InputDecoration(
        labelText: 'Password',
        prefixIcon: Icon(Icons.lock, color: AppColors.iconColor),
        suffixIcon: IconButton(
          icon: Icon(
            _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            color: AppColors.iconColor,
          ),
          onPressed: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.textColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).dividerColor),
        ),
        labelStyle: TextStyle(color: AppColors.textColor),
      ),
      onChanged: widget.onChanged,
      controller: widget.controller,
    );
  }
}