import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);

    path.quadraticBezierTo(size.width, size.height, size.width / 2.15, size.height);

    path.quadraticBezierTo(size.width - (size.width / 1.94), size.height - 95, size.width,
        size.height - size.height * 0.35);

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class WaveClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);

    path.quadraticBezierTo(
        size.width / 4, size.height - 100, size.width / 2, size.height - 100);

    path.quadraticBezierTo(size.width - (size.width / 4), size.height - 100, size.width,
        size.height - size.height * 0.6);

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
