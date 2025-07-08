import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuoday/core/themes/app_colors.dart';
import 'package:fuoday/features/bottom_nav/providers/bottom_nav_provider.dart';
import 'package:provider/provider.dart';

class EmployeeBottomNav extends StatelessWidget {
  const EmployeeBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavProvider>(
      builder: (context, bottomNavProvider, child) {
        return Scaffold(
          body: bottomNavProvider.currentPage,
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: bottomNavProvider.currentIndex,
            onTap: (index) {
              bottomNavProvider.setCurrentIndex(index);
            },
            selectedIconTheme: IconThemeData(size: 24.h),
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: AppColors.primaryColor,
            unselectedItemColor: Colors.black,
            items: const [
              // Message
              BottomNavigationBarItem(
                icon: Icon(Icons.message_outlined),
                activeIcon: Icon(Icons.message),
                label: '',
              ),
              // Leave Tracker
              BottomNavigationBarItem(
                icon: Icon(Icons.account_tree_outlined),
                activeIcon: Icon(Icons.account_tree),
                label: '',
              ),
              // Home Employee
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month_outlined),
                activeIcon: Icon(Icons.calendar_month),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                activeIcon: Icon(Icons.person),
                label: '',
              ),
            ],
          ),
        );
      },
    );
  }
}
