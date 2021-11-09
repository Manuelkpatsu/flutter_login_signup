import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color color;

  const CustomBackButton({
    Key? key,
    required this.onPressed,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: color,
      icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
      onPressed: onPressed,
    );
  }
}
