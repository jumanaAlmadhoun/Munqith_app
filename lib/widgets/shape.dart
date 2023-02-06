import 'package:flutter/material.dart';

class Shape extends StatelessWidget {
  const Shape({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint(
        size: const Size(400, 250),
        painter: CurvedPainter(),
      ),
    );
  }
}

class CurvedPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.teal
      ..strokeWidth = 10;

    var path = Path();

    path.moveTo(0, size.height * 1);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.7,
        size.width * 0.5, size.height * 0.8);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.9,
        size.width * 1.0, size.height * 0.8);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
//-----------------------------------------------------------------------------

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height / 2);

    path.cubicTo(size.width / 4, 2 * (size.height / 2), 3 * (size.width / 4),
        size.height / 3, size.width, size.height);

    /* path.cubicTo(size.height * 0.9, size.width, size.height / 2,
        3 * (size.width / 4), 3 * (size.height / 2), size.width / 4);*/
    path.lineTo(0, size.width);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
