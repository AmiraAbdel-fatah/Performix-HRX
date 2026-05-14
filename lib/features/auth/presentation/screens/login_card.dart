import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/Utils/app_colors.dart';
import '../../../../core/Utils/app_routes.dart';
import '../../../../core/Utils/app_styles.dart';
import '../../../../core/Utils/app_validator.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/custom_text_field.dart';

class LoginCard extends StatefulWidget {
  const LoginCard({super.key});

  @override
  State<LoginCard> createState() => _LoginCardState();
}

class _LoginCardState extends State<LoginCard> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _rememberMe = true;
  bool _isLoading = false;

  void _signIn() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);

      await Future.delayed(const Duration(milliseconds: 1500));

      if (mounted) {
        setState(() => _isLoading = false);
        Navigator.pushReplacementNamed(context, AppRoutes.dashboard);
      }
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 40,
            offset: const Offset(0, 15),
          ),
        ],
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sign in to HRX',
              style: AppStyles.h2.copyWith(fontSize: 22.sp),
            ),
            SizedBox(height: 6.h),
            Text(
              'Welcome Back! Please enter your details.',
              style: AppStyles.bodySmall.copyWith(fontSize: 14.sp),
            ),
            SizedBox(height: 30.h),

            // Email field
            CustomTextField(
              hintText: 'you@company.com',
              labelText: 'Email Address',
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              validator: AppValidator.validateEmail,
              prefixIcon: Icon(
                Icons.email_outlined,
                size: 20.sp,
                color: AppColors.textMuted,
              ),
            ),
            SizedBox(height: 20.h),

            // Password field
            CustomTextField(
              hintText: '••••••••',
              labelText: 'Password',
              controller: _passwordController,
              obSecureText: _obscurePassword,
              validator: AppValidator.validatePassword,
              prefixIcon: Icon(
                Icons.lock_outline_rounded,
                size: 20.sp,
                color: AppColors.textMuted,
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePassword
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  size: 20.sp,
                  color: AppColors.textMuted,
                ),
                onPressed: () =>
                    setState(() => _obscurePassword = !_obscurePassword),
              ),
            ),
            SizedBox(height: 16.h),

            // Remember / Forgot
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 20.w,
                      height: 20.h,
                      child: Checkbox(
                        value: _rememberMe,
                        onChanged: (v) =>
                            setState(() => _rememberMe = v ?? false),
                        activeColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      'Remember me',
                      style: AppStyles.bodySmall.copyWith(
                        fontSize: 13.sp,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Text(
                    'Forgot password?',
                    style: AppStyles.label.copyWith(
                      color: AppColors.primary,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30.h),

            // Sign in button
            _isLoading
                ? const Center(
                    child: CircularProgressIndicator(color: AppColors.primary),
                  )
                : CustomElevatedButton(
                    text: 'Sign In',
                    suffixIcon: Icon(
                      Icons.arrow_forward_rounded,
                      color: Colors.white,
                      size: 18.sp,
                    ),
                    onPressed: _signIn,
                  ),
            SizedBox(height: 24.h),

            Center(
              child: RichText(
                text: TextSpan(
                  style: AppStyles.bodySmall.copyWith(
                    fontSize: 14.sp,
                    color: AppColors.textSecondary,
                  ),
                  children: [
                    const TextSpan(text: "Don't have an account? "),
                    TextSpan(
                      text: 'Sign up',
                      style: AppStyles.label.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
