import 'dart:developer';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/util/assets/assets.dart';
import '../../../../core/util/style/colors.dart';
import '../bloc/main_layout_bloc.dart';

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

  @override
  Widget build(BuildContext context) {
    MainLayoutBloc bloc = BlocProvider.of<MainLayoutBloc>(context);
    return BlocBuilder(
      bloc: bloc,
      builder: (context, state) => AnimatedBottomNavigationBar.builder(
          activeIndex: bloc.screenIndex,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.smoothEdge,
          leftCornerRadius: 24,
          rightCornerRadius: 24,
          height: 55,
          onTap: (index) {
            bloc.add(UpdateCurrentScreenEvent(index));
            log(index.toString());
          },
          itemCount: iconList.length,
          tabBuilder: (int index, bool isActive) => Padding(
            padding: const EdgeInsets.all(12),
            child: Image.asset(iconList[index] , color: index == bloc.screenIndex ? AppColors.mainColor:null ),
          )
      ),
    );
  }
}
