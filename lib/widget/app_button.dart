import 'package:animation_test/utils/extension/context_extension.dart';
import 'package:animation_test/values/app_colors.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    required this.buttonText,
    required this.isActive,
    super.key,
    this.onPressed,
    this.backgroundColor,
    this.fontColor,
    this.textStyle,
    this.borderRadius,
  });

  final String buttonText;
  final bool isActive;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? fontColor;
  final TextStyle? textStyle;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      padding: const EdgeInsets.symmetric(vertical: 14),
      onPressed: isActive ? onPressed : null,
      fillColor: isActive ? AppColors.blueColor : AppColors.bgBlackColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: Text(
        buttonText,
        style: context.textStyleTheme.mediumM4.copyWith(
          color: isActive ? AppColors.colorWhite : AppColors.bgBlackColor,
        ),
      ),
    );
  }
}
