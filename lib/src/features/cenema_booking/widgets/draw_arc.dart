import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:muhammad_danyial_tentwenty_assignment/utils/constants/color_constants.dart';


class CustomArc extends StatelessWidget {
  const CustomArc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
     size: Size(20.h, 20.h),
      painter: DrawArc(),
    );
  }
}


class DrawArc extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = ColorConstants.buttonColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    Path path = Path();
    path.moveTo(0, size.width);
    path.quadraticBezierTo(size.height/2, size.width/2, size.height, size.height);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}
