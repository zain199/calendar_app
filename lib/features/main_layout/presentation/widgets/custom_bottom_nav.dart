import 'dart:developer';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../../../../core/util/assets/assets.dart';
import '../../../../core/util/style/colors.dart';

class CustomBottomNav extends StatefulWidget {
  const CustomBottomNav({super.key});

  @override
  State<CustomBottomNav> createState() => _CustomBottomNavState();
}

class _CustomBottomNavState extends State<CustomBottomNav> {
  final iconList = [
    ImageAssets.categoryIcon,
    ImageAssets.folderIcon,
    ImageAssets.calenderIcon,
    ImageAssets.profileIcon,
  ];
  var bottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar.builder(
        activeIndex: bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.smoothEdge,
        leftCornerRadius: 24,
        rightCornerRadius: 24,
        height: 55,
        onTap: (index) {
          setState(() => bottomNavIndex = index);
          log(index.toString());
        },
        itemCount: iconList.length,
        tabBuilder: (int index, bool isActive) => Padding(
          padding: const EdgeInsets.all(12),
          child: Image.asset(iconList[index] , color: isActive ? AppColors.mainColor:null ),
        )
    );
  }
}
