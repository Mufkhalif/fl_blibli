import 'package:flutter/material.dart';

class CustomePointerBottomNavigation extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.3254520, size.height * 0.006135019);
    path_0.cubicTo(
        size.width * 0.2355118,
        size.height * 0.001505389,
        size.width * 0.04450626,
        size.height * -0.004976093,
        0,
        size.height * 0.006135019);
    path_0.lineTo(0, size.height * 0.9968796);
    path_0.lineTo(size.width * 0.9993046, size.height * 0.9968796);
    path_0.lineTo(size.width * 0.9993046, size.height * 0.006135019);
    path_0.lineTo(size.width * 0.6773296, size.height * 0.006135019);
    path_0.cubicTo(
        size.width * 0.5827538,
        size.height * 0.006135019,
        size.width * 0.5741822,
        size.height * 0.4324194,
        size.width * 0.5514604,
        size.height * 0.5385426);
    path_0.cubicTo(
        size.width * 0.5180807,
        size.height * 0.6944444,
        size.width * 0.4707928,
        size.height * 0.6527778,
        size.width * 0.4443672,
        size.height * 0.5385426);
    path_0.cubicTo(
        size.width * 0.4221140,
        size.height * 0.3703704,
        size.width * 0.3956885,
        size.height * 0.009750463,
        size.width * 0.3254520,
        size.height * 0.006135019);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = Colors.white.withOpacity(1.0);
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
