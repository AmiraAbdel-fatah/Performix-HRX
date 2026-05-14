import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/Utils/app_colors.dart';

class CustomLogo extends StatelessWidget {
  const CustomLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(28.r),
        border: Border.all(color: Colors.white.withOpacity(0.1), width: 3),
      ),
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: Image.asset(
          "assets/images/Logo.png",
          errorBuilder: (context, error, stackTrace) =>
              Icon(Icons.bolt, color: AppColors.primary, size: 60.sp),
        ),
      ),
    );
  }
}
