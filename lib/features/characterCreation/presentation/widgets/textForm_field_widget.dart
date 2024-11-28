import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String? labelText;
  final String? hintText;
  final TextInputType? keyboardType;
  final EdgeInsetsGeometry? contentPadding;

  const TextFormFieldWidget({
    Key? key,
    required this.controller,
    this.validator,
    this.labelText,
    this.hintText,
    this.keyboardType,
    this.contentPadding = const EdgeInsets.only(left: 16),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        contentPadding: contentPadding,
        labelText: labelText,
        hintText: hintText,
      ),
    );
  }
}
