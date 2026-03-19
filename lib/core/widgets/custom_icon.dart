import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:streamview/core/themes/app_colors.dart';

class CustomIcon extends StatelessWidget {
  final String iconName;
  final double size;
  final Color color;

  const CustomIcon({
    super.key,
    required this.iconName,
    this.size = 24,
    this.color = AppColors.black,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/$iconName.svg',
      height: size,
      width: size,
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
    );
  }
}
