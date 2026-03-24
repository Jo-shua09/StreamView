import 'package:flutter/material.dart';
import 'package:streamview/core/themes/app_colors.dart';
import 'package:streamview/core/themes/app_text_styles.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.hintText,
    required this.labelText,
    this.suffixIcon,
    this.controller,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
  });

  final String labelText;
  final String hintText;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: AppTextStyles.bodyMediumBold.copyWith(color: AppColors.gray70),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          style: AppTextStyles.bodyMediumBold.copyWith(color: AppColors.black),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: AppTextStyles.bodyMediumBold.copyWith(
              color: AppColors.gray40,
            ),
            suffixIcon: suffixIcon,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 16,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: const BorderSide(color: AppColors.gray20),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: const BorderSide(color: AppColors.gray20),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: const BorderSide(color: AppColors.error),
            ),
          ),
        ),
      ],
    );
  }
}
