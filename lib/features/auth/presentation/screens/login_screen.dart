import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:performix_hrx/features/auth/presentation/screens/custom_logo.dart';
import 'package:performix_hrx/features/auth/presentation/screens/login_card.dart';

import '../../../../core/Utils/app_styles.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF0F172A), Color(0xFF134E4A)],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo Section
                  Column(
                    children: [
                      CustomLogo(),
                      SizedBox(height: 16.h),
                      Text(
                        'Performix HR',
                        style: AppStyles.h1.copyWith(
                          color: Colors.white,
                          fontSize: 28.sp,
                          letterSpacing: 0.5,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        'Smart HRMS Platform',
                        style: AppStyles.caption.copyWith(
                          color: const Color(0xFF94A3B8),
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 40.h),

                  // Login Card
                  const LoginCard()
                ],
              ),
            ),
          ),
        ),)
      ,
    );
  }
}
