import 'package:animation_test/values/app_colors.dart';
import 'package:flutter/material.dart';

class TextStyleTheme extends ThemeExtension<TextStyleTheme> {
  const TextStyleTheme({
    this.regularR3 = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      height: 1.6,
      color: AppColors.textColorPrimary,
    ),
    this.regularR4 = const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      height: 1.6,
      color: AppColors.textColorPrimary,
    ),
    this.regularR5 = const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      height: 1.3,
      color: AppColors.textColorPrimary,
    ),
    this.regularR6 = const TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      height: 1.3,
      color: AppColors.textColorTertiary,
    ),
    this.mediumM1 = const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w500,
      height: 1.2,
      color: AppColors.textColorPrimary,
    ),
    this.mediumM2 = const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      height: 1.6,
      color: AppColors.textColorPrimary,
    ),
    this.mediumM3 = const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      height: 1.3,
      color: AppColors.textColorPrimary,
    ),
    this.mediumM4 = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      height: 1.3,
      color: AppColors.textColorPrimary,
    ),
    this.mediumM5 = const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      height: 1.3,
      color: AppColors.textColorPrimary,
    ),
    this.mediumM6 = const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      height: 1.3,
      color: AppColors.textColorPrimary,
    ),
    this.headerH6 = const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      height: 1.3,
      color: AppColors.textColorPrimary,
    ),
    this.headerH1 = const TextStyle(
      fontSize: 42,
      fontWeight: FontWeight.w400,
      color: AppColors.textColorPrimary,
    ),
  });

  factory TextStyleTheme.light() => const TextStyleTheme();

  factory TextStyleTheme.dark() => const TextStyleTheme();

  final TextStyle mediumM1;
  final TextStyle mediumM2;
  final TextStyle mediumM3;
  final TextStyle mediumM4;
  final TextStyle mediumM5;
  final TextStyle mediumM6;
  final TextStyle regularR4;
  final TextStyle regularR3;
  final TextStyle regularR5;
  final TextStyle regularR6;
  final TextStyle headerH6;
  final TextStyle headerH1;

  @override
  ThemeExtension<TextStyleTheme> copyWith({
    TextStyle? mediumM1,
    TextStyle? mediumM3,
    TextStyle? mediumM4,
    TextStyle? mediumM5,
    TextStyle? regularR4,
    TextStyle? regularR3,
    TextStyle? regularR5,
    TextStyle? mediumM2,
    TextStyle? mediumM6,
    TextStyle? regularR6,
    TextStyle? headerH6,
    TextStyle? headerH1,
  }) {
    return TextStyleTheme(
      regularR4: regularR4 ?? this.regularR4,
      regularR5: regularR5 ?? this.regularR5,
      regularR3: regularR3 ?? this.regularR3,
      mediumM5: mediumM5 ?? this.mediumM5,
      mediumM4: mediumM4 ?? this.mediumM4,
      mediumM3: mediumM3 ?? this.mediumM3,
      mediumM1: mediumM1 ?? this.mediumM1,
      mediumM2: mediumM2 ?? this.mediumM2,
      mediumM6: mediumM6 ?? this.mediumM6,
      regularR6: regularR6 ?? this.regularR6,
      headerH6: headerH6 ?? this.headerH6,
      headerH1: headerH1 ?? this.headerH1,
    );
  }

  @override
  ThemeExtension<TextStyleTheme> lerp(
    covariant ThemeExtension<TextStyleTheme>? other,
    double t,
  ) => this;
}
