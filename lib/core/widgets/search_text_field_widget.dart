import 'package:flutter/material.dart';
import 'package:streamview/core/themes/app_colors.dart';
import 'package:streamview/core/widgets/custom_icon.dart';

class SearchTextFieldWidget extends StatelessWidget {
  const SearchTextFieldWidget({super.key, required this.onTap, this.onChanged});

  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: onTap,
      onChanged: onChanged,
      style: const TextStyle(fontSize: 14, color: AppColors.gray70),
      decoration: InputDecoration(
        counterStyle: const TextStyle(fontSize: 16, color: AppColors.gray70),
        hintText: 'Search...',
        prefixIcon: Padding(
          padding: const EdgeInsets.fromLTRB(16, 2.5, 5, 0),
          child: CustomIcon(iconName: 'search-normal', size: 16),
        ),
        prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
        hintStyle: TextStyle(fontSize: 14, color: AppColors.gray70),
        suffixIcon: Padding(
          padding: const EdgeInsets.fromLTRB(0, 2.5, 16, 0),
          child: CustomIcon(iconName: 'setting-5', size: 16),
        ),
        suffixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.black, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.error, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primary, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.error, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
      ),
    );
  }
}
