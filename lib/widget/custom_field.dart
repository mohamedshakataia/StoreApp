import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  CustomField({
    super.key,
    required this.hint,
    this.onchanged,
    this.obscureText = false,
    this.inputType,
  });
  Function(String)? onchanged;
  final String hint;
  bool? obscureText;
  TextInputType? inputType;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextField(
        keyboardType: inputType,
        obscureText: obscureText!,
        onChanged: onchanged,

        decoration: InputDecoration(
          hintText: hint,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
        ),
      ),
    );
  }
}
