import 'package:flutter/material.dart';

class CustomRoundedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color color;
  final String text;

  const CustomRoundedButton({
    Key? key,
    required this.onPressed,
    required this.color,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: color,
          onPrimary: Colors.white,
          shape: const StadiumBorder(),
        ),
      ),
    );
  }
}
