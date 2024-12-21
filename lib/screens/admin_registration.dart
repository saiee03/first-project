import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import for input formatters
import 'package:image_picker/image_picker.dart';
import 'package:sample_ui/widget/colors.dart';
import 'package:sample_ui/widget/password.dart';

class AadhaarInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final rawText = newValue.text.replaceAll(' ', ''); // Remove existing spaces
    final buffer = StringBuffer();
    for (int i = 0; i < rawText.length; i++) {
      if (i > 0 && i % 4 == 0) buffer.write(' '); // Add space after every 4 digits
      buffer.write(rawText[i]);
    }
    final formattedText = buffer.toString();
    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}

class DateOfBirthInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final rawText = newValue.text.replaceAll('-', ''); // Remove existing hyphens
    final buffer = StringBuffer();
    for (int i = 0; i < rawText.length; i++) {
      if ((i == 4 || i == 6) && i < rawText.length) buffer.write('-'); // Add hyphen at appropriate positions
      buffer.write(rawText[i]);
    }
    final formattedText = buffer.toString();
    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}

class JoiningDateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final rawText = newValue.text.replaceAll('-', ''); // Remove existing hyphens
    final buffer = StringBuffer();
    for (int i = 0; i < rawText.length; i++) {
      if ((i == 4 || i == 6) && i < rawText.length) {
        buffer.write('-'); // Add hyphen after year and month
      }
      buffer.write(rawText[i]);
    }
    final formattedText = buffer.toString();
    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}

class adminregistration extends StatelessWidget {
  adminregistration({super.key});

  // Controllers for all the fields
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController panController = TextEditingController();
  final TextEditingController aadhaarController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController alternateContactController = TextEditingController();
  final TextEditingController designationController = TextEditingController();
  final TextEditingController salaryController = TextEditingController();
  final TextEditingController joiningDateController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController emergencyContactController = TextEditingController();
  final TextEditingController departmentController = TextEditingController();

  File? _image;

  // Function to pick an image
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _image = File(pickedFile.path);
      print("Image selected: \${_image?.path}");
      // You can use setState if you need to update the UI, but since the widget is Stateless, you may need to refactor to StatefulWidget if required.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.babyBlue, AppColors.charcoalGray],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const Text(
                      'Create Your Account',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Name Field
                    TextFormField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        labelText: 'Name',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Name is required';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    // DOB Field
                    TextFormField(
                      controller: dobController,
                      decoration: const InputDecoration(
                        labelText: 'Date of Birth (yyyy-mm-dd)',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.cake),
                      ),
                      keyboardType: TextInputType.datetime,
                      inputFormatters: [
                        DateOfBirthInputFormatter(), // Custom DOB formatter
                        LengthLimitingTextInputFormatter(10), // Limit to 10 characters
                      ],
                      validator: (value) {
                        final regex = RegExp(r'^\d{4}-\d{2}-\d{2}\$');
                        if (value == null || value.isEmpty) {
                          return 'Date of Birth is required';
                        } else if (!regex.hasMatch(value)) {
                          return 'Enter DOB in yyyy-mm-dd format';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    // Email Field
                    TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.email),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email is required';
                        } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                          return 'Enter a valid email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    // Password Field
                    PasswordTextBox(
                      controller: passwordController,
                      onChanged: (value) {},
                    ),
                    const SizedBox(height: 16),
                    // PAN Field
                    TextFormField(
                      controller: panController,
                      decoration: const InputDecoration(
                        labelText: 'PAN',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.credit_card),
                      ),
                      keyboardType: TextInputType.text,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(10),
                      ],
                      validator: (value) {
                        final rawValue = value?.replaceAll(' ', '');
                        if (rawValue == null || rawValue.isEmpty) {
                          return 'PAN is required';
                        } else if (rawValue.length != 10) {
                          return 'PAN must be exactly 10 characters';
                        } else if (!RegExp(r'^[A-Z]{5}\d{4}[A-Z]{1}\$').hasMatch(rawValue)) {
                          return 'Enter a valid PAN';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    // Aadhaar Field
                    TextFormField(
                      controller: aadhaarController,
                      decoration: const InputDecoration(
                        labelText: 'Aadhaar',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.fingerprint),
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        AadhaarInputFormatter(),
                        LengthLimitingTextInputFormatter(14),
                      ],
                      validator: (value) {
                        final rawValue = value?.replaceAll(' ', '');
                        if (rawValue == null || rawValue.isEmpty) {
                          return 'Aadhaar is required';
                        } else if (rawValue.length != 12) {
                          return 'Aadhaar must be exactly 12 digits';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    // Contact Field
                    TextFormField(
                      controller: contactController,
                      decoration: const InputDecoration(
                        labelText: 'Contact Number',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.phone),
                      ),
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(10),
                      ],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Contact Number is required';
                        } else if (value.length != 10) {
                          return 'Enter a valid 10-digit phone number';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    // Alternate Contact Field
                    TextFormField(
                      controller: alternateContactController,
                      decoration: const InputDecoration(
                        labelText: 'Alternate Contact Number',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.phone_callback),
                      ),
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(10),
                      ],
                      validator: (value) {
                        if (value != null && value.isNotEmpty && value.length != 10) {
                          return 'Enter a valid 10-digit phone number';
                        }
                        return null;
                      },
                    ),
                   const SizedBox(height: 16),
                    // Photo Upload Button
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: _pickImage,
                      icon: const Icon(Icons.photo_camera),
                      label: const Text('Upload Photo'),
                    ),
                    if (_image != null)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Image.file(
                          _image!,
                          height: 150,
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                      ),

                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Handle form submission
                          print('Form is valid and ready for submission');
                        }
                      },
                      child: const Text('Register'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
