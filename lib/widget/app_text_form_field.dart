import 'package:animation_test/utils/extension/context_extension.dart';
import 'package:animation_test/values/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    this.filled = true,
    super.key,
    this.controller,
    this.textInputType,
    this.inputFormatters,
    this.textStyle,
    this.hintText,
    this.contentPadding,
    this.padding,
    this.filledColor,
    this.initialValue,
    this.onTap,
    this.disabledBorder,
    this.focusedBorder,
    this.enableBorder,
    this.helpText,
    this.scrollPadding,
    this.textInputAction,
    this.labelText,
    this.validator,
    this.onChanged,
    this.onFieldSubmitted,
  });

  final TextEditingController? controller;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatters;
  final TextStyle? textStyle;
  final String? hintText;
  final EdgeInsetsGeometry? contentPadding;
  final EdgeInsetsGeometry? padding;
  final bool filled;
  final Color? filledColor;
  final String? initialValue;
  final GestureTapCallback? onTap;
  final InputBorder? disabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? enableBorder;
  final String? helpText;
  final EdgeInsets? scrollPadding;
  final TextInputAction? textInputAction;
  final String? labelText;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      scrollPadding: scrollPadding ?? EdgeInsets.zero,
      onTap: onTap,
      validator: validator,
      controller: controller,
      keyboardType: textInputType,
      onChanged: onChanged,
      textInputAction: textInputAction,
      inputFormatters: inputFormatters,
      initialValue: initialValue,
      style: textStyle ?? context.textStyleTheme.regularR4,
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        hintFadeDuration: Duration.zero,
        hintStyle: context.textStyleTheme.regularR4.copyWith(),
        hintText: hintText,
        filled: true,
        fillColor: AppColors.blackColor5,
        contentPadding: contentPadding,
        isDense: true,
        focusedBorder:
            focusedBorder ??
            (OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: const BorderSide(color: AppColors.blueColor),
            )),
        enabledBorder:
            enableBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: const BorderSide(color: AppColors.blueColor),
            ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(color: AppColors.blueColor),
        ),
      ),
    );
  }
}
