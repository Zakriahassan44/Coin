import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoinSizeDiagram extends StatelessWidget {
  final String imagePath;

  const CoinSizeDiagram({required this.imagePath, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          imagePath,
          fit: BoxFit.contain,
          width: 1.sw,
          height: 0.6.sh,
        ),
        Positioned(
          left: 20.w,
          top: 60.h,
          child: CustomPaint(
            size: Size(200.w, 200.h),
            painter: LinePainter(),
          ),
        ),
        Positioned(
          left: 15.w,
          top: 25.h,
          child: const Text(
            'Weight\n3.92 g',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ),
        Positioned(
          left: 140.w,
          bottom: 0.h,
          child: const Text(
            'Thickness\n1.67 mm',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ),
        Positioned(
          right: 15.w,
          top: 50.h,
          child: const Text(
            'Diameter\n21.25 mm',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}

class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 1;

    // Line for Weight
    canvas.drawLine(
        Offset(40.w, 10.h), Offset(102.w, 95.h), paint);
    canvas.drawLine(Offset(40.w, 10.h), Offset(-10.w, 10.h), paint);

    // Line for Thickness
    canvas.drawLine(Offset(150.w, 120.h), Offset(150.w, 180.h), paint);

    // Line for Diameter
    canvas.drawLine(Offset(270.w, 30.h), Offset(212.w, 86.h), paint);
    canvas.drawLine(Offset(330.w, 30.h), Offset(270.w, 30.h), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
