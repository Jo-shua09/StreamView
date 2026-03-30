import 'package:flutter/material.dart';
import 'package:streamview/features/home/view/home_screen.dart';
import 'package:streamview/features/search/view/search_screen.dart';
import 'package:streamview/features/downloads/view/download_screen.dart';
import 'package:streamview/features/profile/view/profile_screen.dart';
import 'package:streamview/core/widgets/bottom_navigation_bar_widget.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  // List of screens for the Bottom Nav
  final List<Widget> _pages = [
    const HomeScreen(),
    const SearchScreen(),
    const DownloadScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // IndexedStack keeps the scroll position alive on all screens
      body: IndexedStack(index: _currentIndex, children: _pages),
      bottomNavigationBar: BottomNavigationBarWidget(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
