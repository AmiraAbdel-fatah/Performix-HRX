import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Bar extends StatelessWidget {
  Color color;
  double height;

  Bar({super.key, required this.color, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32.w,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8.r),
      ),
    );
  }
}
