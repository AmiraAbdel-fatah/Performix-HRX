import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/Utils/app_colors.dart';
import '../../core/Utils/app_styles.dart';

class CustomElevatedButton extends StatelessWidget {
  final Color? backgroundColor;
  final Widget? suffixIcon;
  final String text;
  final TextStyle? textStyle;
  final VoidCallback onPressed;

  const CustomElevatedButton({
    super.key,
    required this.text,
    this.textStyle,
    required this.onPressed,
    this.suffixIcon,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 16.h),
          backgroundColor: backgroundColor ?? AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          elevation: 0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: textStyle ?? AppStyles.button.copyWith(fontSize: 16.sp),
            ),
            if (suffixIcon != null) ...[
              SizedBox(width: 8.w),
              suffixIcon!,
            ],
          ],
        ),
      ),
    );
  }
}
