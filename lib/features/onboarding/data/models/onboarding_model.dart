import 'package:flutter/material.dart';

class OnBoardingModel {
  final String title;
  final String description;
  final Widget illustration;
  final IconData icon;
  final Color iconBgColor;
  final Color iconColor;

  OnBoardingModel({
    required this.title,
    required this.description,
    required this.illustration,
    required this.icon,
    required this.iconBgColor,
    required this.iconColor,
  });
}
