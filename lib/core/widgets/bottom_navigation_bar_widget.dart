import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:streamview/core/themes/app_colors.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavigationBarWidget({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      backgroundColor: AppColors.white,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.gray90,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        BottomNavigationBarItem(
          icon: _buildIcon(FontAwesomeIcons.house, currentIndex == 0),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: _buildIcon(FontAwesomeIcons.magnifyingGlass, currentIndex == 1),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: _buildIcon(FontAwesomeIcons.download, currentIndex == 2),
          label: 'Downloads',
        ),
        BottomNavigationBarItem(
          icon: _buildIcon(FontAwesomeIcons.user, currentIndex == 3),
          label: 'Profile',
        ),
      ],
    );
  }

  Widget _buildIcon(FaIconData icon, bool isSelected) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FaIcon(
          icon,
          size: 22,
          color: isSelected ? AppColors.primary : AppColors.gray60,
        ),
        const SizedBox(height: 4),
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: isSelected ? 18 : 0,
          height: 2,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    );
  }
}
