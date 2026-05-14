import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/Utils/app_colors.dart';
import '../../core/Utils/app_styles.dart';

class CustomTextField extends StatelessWidget {
  final Color? filledColor;
  final Color? borderColor;
  final String hintText;
  final String? labelText;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final TextStyle? style;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int? maxLines;
  final bool obSecureText;
  final bool readOnly;
  final String? Function(String?)? validator;
  final VoidCallback? onTap;
  final TextEditingController? controller;
  final TextInputType? keyboardType;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.controller,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.hintStyle,
    this.labelText,
    this.labelStyle,
    this.style,
    this.maxLines,
    this.filledColor,
    this.obSecureText = false,
    this.borderColor,
    this.readOnly = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      validator: validator,
      controller: controller,
      onTap: onTap,
      readOnly: readOnly,
      maxLines: maxLines ?? 1,
      cursorColor: AppColors.primary,
      style: style ?? AppStyles.bodyMedium,
      obscureText: obSecureText,
      obscuringCharacter: '●',
      decoration: InputDecoration(
        filled: true,
        fillColor: filledColor ?? AppColors.bgWhite,
        hintText: hintText,
        labelText: labelText,
        labelStyle: labelStyle ?? AppStyles.label,
        hintStyle: hintStyle ?? AppStyles.label,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(
            color: borderColor ?? AppColors.border,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: AppColors.primary, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: AppColors.danger, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: AppColors.danger, width: 1.5),
        ),
      ),
    );
  }
}
