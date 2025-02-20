import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    super.key,
    required this.emailController,
    required this.labelText,
  });

  final TextEditingController emailController;
  final String labelText;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 255, 255, 255),
      child: TextField(
        controller: emailController,
        decoration: InputDecoration(
            hintText: labelText,
            border: OutlineInputBorder(borderSide: BorderSide.none)),
      ),
    );
  }
}
