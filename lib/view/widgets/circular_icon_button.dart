import 'package:flutter/material.dart';

class CircularIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final Color color;

  const CircularIconButton({
    Key? key,
    required this.icon,
    required this.onPressed,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        primary: color,
        onPrimary: Colors.white,
        shape: const CircleBorder(),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Icon(icon, size: 24),
      ),
    );
  }
}
