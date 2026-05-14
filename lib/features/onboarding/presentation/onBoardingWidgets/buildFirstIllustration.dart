import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/Utils/app_colors.dart';
import 'custom_circle.dart';

class BuildFirstIllustration extends StatelessWidget {
  const BuildFirstIllustration({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      width: 220.w,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Left Circle
          Positioned(
            left: 25.w,
            top: 40.h,
            child: _buildDoubleCircle(
              color: AppColors.primary,
              outerSize: 66.r,
              innerSize: 42.r,
            ),
          ),
          // Right Circle
          Positioned(
            right: 25.w,
            top: 40.h,
            child: _buildDoubleCircle(
              color: AppColors.chartPink,
              outerSize: 66.r,
              innerSize: 42.r,
            ),
          ),
          // Center Circle
          Positioned(
            top: 65.h,
            child: _buildDoubleCircle(
              color: AppColors.chartBlue,
              outerSize: 66.r,
              innerSize: 42.r,
            ),
          ),
          // Smile Curve
          Positioned(
            top: 120.h,
            child: CustomPaint(
              size: Size(110.w, 20.h),
              painter: SmilePainter(color: AppColors.primary),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDoubleCircle({
    required Color color,
    required double outerSize,
    required double innerSize,
  }) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CustomCircle(color: color, size: outerSize, opacity: 0.15),
        CustomCircle(color: color, size: innerSize, opacity: 1.0),
      ],
    );
  }
}

class SmilePainter extends CustomPainter {
  final Color color;

  SmilePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5.w
      ..strokeCap = StrokeCap.round;

    final path = Path();
    path.moveTo(0, 0);
    // Smooth quadratic curve for the smile
    path.quadraticBezierTo(size.width / 2, size.height * 1.2, size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(SmilePainter oldDelegate) => false;
}
