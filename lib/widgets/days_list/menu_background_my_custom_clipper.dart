import 'package:flutter/material.dart';

class MenuBackgroundMyCustomClipper extends CustomClipper<Path> {
  final int currentDayIndex;

  MenuBackgroundMyCustomClipper(this.currentDayIndex);

  @override
  Path getClip(Size size) {
    if (currentDayIndex == 0) {
      Path path = Path()
        ..moveTo(16, 0)
        ..arcToPoint(const Offset(0, 16),
            radius: const Radius.circular(16), clockwise: false)
        ..lineTo(0, 48)
        ..arcToPoint(const Offset(16, 64),
            radius: const Radius.circular(16), clockwise: false)
        ..lineTo(40, 64)
        ..arcToPoint(const Offset(56, 80),
            radius: const Radius.circular(16), clockwise: true)
        ..lineTo(56, size.height - 16)
        ..arcToPoint(Offset(72, size.height),
            radius: const Radius.circular(16), clockwise: false)
        ..lineTo(size.width - 16, size.height)
        ..arcToPoint(Offset(size.width, size.height - 16),
            radius: const Radius.circular(16), clockwise: false)
        ..lineTo(size.width, 16)
        ..arcToPoint(Offset(size.width - 16, 0),
            radius: const Radius.circular(16), clockwise: false)
        ..close();
      return path;
    }
    if (currentDayIndex >= 1 && currentDayIndex <= 6) {
      Path path = Path()
        ..moveTo(72, 0)
        ..arcToPoint(const Offset(56, 16),
            radius: const Radius.circular(16), clockwise: false)
        ..lineTo(56, 64 * currentDayIndex.toDouble() - 16)
        ..arcToPoint(Offset(40, 64 * currentDayIndex.toDouble()),
            radius: const Radius.circular(16))
        ..lineTo(16, 64 * currentDayIndex.toDouble())
        ..arcToPoint(Offset(0, 64 * currentDayIndex.toDouble() + 16),
            radius: const Radius.circular(16), clockwise: false)
        ..lineTo(0, 64 * currentDayIndex.toDouble() + 48)
        ..arcToPoint(Offset(16, 64 * currentDayIndex.toDouble() + 64),
            radius: const Radius.circular(16), clockwise: false)
        ..lineTo(40, 64 * currentDayIndex.toDouble() + 64)
        ..arcToPoint(Offset(56, 64 * currentDayIndex.toDouble() + 80),
            radius: const Radius.circular(16), clockwise: true)
        ..lineTo(56, size.height - 16)
        ..arcToPoint(Offset(72, size.height),
            radius: const Radius.circular(16), clockwise: false)
        ..lineTo(size.width - 16, size.height)
        ..arcToPoint(Offset(size.width, size.height - 16),
            radius: const Radius.circular(16), clockwise: false)
        ..lineTo(size.width, 16)
        ..arcToPoint(Offset(size.width - 16, 0),
            radius: const Radius.circular(16), clockwise: false)
        ..close();
      return path;
    } else {
      Path path = Path()
        ..moveTo(60, 0)
        ..arcToPoint(const Offset(50, 10),
            radius: const Radius.circular(10), clockwise: false)
        ..lineTo(50, size.height-60)
        ..arcToPoint(Offset(40, size.height-50), radius: const Radius.circular(10))
        ..lineTo(10, size.height-50)
        ..arcToPoint(Offset(0, size.height-40),
            radius: const Radius.circular(10), clockwise: false)
        ..lineTo(0, size.height-10)
        ..arcToPoint(Offset(10, size.height),
            radius: const Radius.circular(10), clockwise: false)
        ..lineTo(size.width - 10, size.height)
        ..arcToPoint(Offset(size.width, size.height - 10),
            radius: const Radius.circular(10), clockwise: false)
        ..lineTo(size.width, 10)
        ..arcToPoint(Offset(size.width - 10, 0),
            radius: const Radius.circular(10), clockwise: false)
        ..close();
      return path;
    }
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}