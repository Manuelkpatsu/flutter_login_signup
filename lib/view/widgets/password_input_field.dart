import 'package:flutter/material.dart';

class PasswordInputField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final FormFieldValidator<String>? validator;
  final TextCapitalization textCapitalization;
  final bool obscureText;
  final VoidCallback? toggle;
  final String? labelText;
  final Color color;

  const PasswordInputField({
    Key? key,
    required this.controller,
    required this.color,
    this.inputType,
    this.inputAction,
    this.validator,
    this.obscureText = true,
    this.toggle,
    this.textCapitalization = TextCapitalization.none,
    this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: color,
      style: TextStyle(color: color),
      controller: controller,
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: color),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: color),
        ),
        labelText: labelText,
        labelStyle: TextStyle(color: color),
        suffixIcon: IconButton(
          icon: obscureText
              ? Icon(Icons.visibility_off, color: color)
              : Icon(Icons.visibility, color: color),
          onPressed: toggle,
        ),
      ),
      keyboardType: inputType,
      textInputAction: inputAction,
      obscureText: obscureText,
      validator: validator,
      textCapitalization: textCapitalization,
    );
  }
}
