import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:performix_hrx/core/Utils/app_colors.dart';
import 'package:performix_hrx/core/Utils/app_styles.dart';
import 'package:performix_hrx/features/onboarding/data/models/onboarding_model.dart';

class OnBoardingBody extends StatelessWidget {
  final OnBoardingModel model;

  const OnBoardingBody({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 40.h),
        Container(
          height: 320.h,
          width: 320.w,
          margin: EdgeInsets.symmetric(horizontal: 24.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(32.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.03),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Center(child: model.illustration),
        ),
        const Spacer(),
        // Icon Container
        Container(
          padding: EdgeInsets.all(12.w),
          decoration: BoxDecoration(
            color: model.iconBgColor,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Icon(model.icon, color: model.iconColor, size: 28.sp),
        ),
        SizedBox(height: 24.h),
        // Title
        Text(
          model.title,
          style: AppStyles.h1.copyWith(
            fontSize: 28.sp,
            fontWeight: FontWeight.w800,
            color: AppColors.textPrimary,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 16.h),
        // Description
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w),
          child: Text(
            model.description,
            style: AppStyles.bodyLarge.copyWith(
              fontSize: 16.sp,
              color: AppColors.textSecondary,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
