import 'package:flutter/material.dart';
import 'package:streamview/core/themes/app_colors.dart';

class SearchTextFieldWidget extends StatelessWidget {
  const SearchTextFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search',
        prefixIcon: const Icon(
          Icons.search_outlined,
          size: 20,
          color: AppColors.gray70,
        ),
        hintStyle: TextStyle(fontSize: 14, color: AppColors.gray70),
        suffixIcon: const Icon(
          Icons.filter_list,
          size: 20,
          color: AppColors.gray70,
        ),
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
