import 'package:flutter/material.dart';

class CustomInputText extends StatelessWidget {
  final String label;
  final String hintText;
  final IconData prefixIcon;
  final bool? obscureText;

  final Widget? suffixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  const CustomInputText({
    super.key,
    required this.label,
    required this.hintText,
    required this.prefixIcon,
    this.obscureText,
    this.suffixIcon,
    this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        label: Text(
          label,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        hintText: hintText,
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              15,
            ),
          ),
          borderSide: BorderSide(
            color: Colors.blue,
            width: 2,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              15,
            ),
          ),
          borderSide: BorderSide(
            color: Colors.blue,
            width: 2,
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              15,
            ),
          ),
          borderSide: BorderSide(
            color: Colors.red,
            width: 2,
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              15,
            ),
          ),
          borderSide: BorderSide(
            color: Colors.red,
            width: 2,
          ),
        ),
        prefixIcon: Icon(
          prefixIcon,
          color: Colors.blue,
        ),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
