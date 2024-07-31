import 'package:flutter/material.dart';
import 'package:task/core/util/style/colors.dart';
import 'package:task/core/util/widgets/general_app_bar.dart';
import 'package:task/core/util/widgets/main_layout_widget.dart';
import 'package:task/features/calender/presentation/pages/calender_screen.dart';
import 'package:task/features/project_summary/presentation/pages/project_summery_screen.dart';
import '../widgets/custom_bottom_nav.dart';


class MainLayoutScreen extends StatelessWidget {
  const MainLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {

    List<Widget> screens = [
      const ProjectSummeryScreen(),
      const CalenderScreen(),
      const ProjectSummeryScreen(),
      const CalenderScreen(),
    ];

    List<String> titles = [
      "Project Summary",
      "Calender",
      "Project Summary",
      "Calender",
    ];
    return MainLayoutWidget(
        widthMargin: 0,
        heightMargin: 0,
        backGroundColor: AppColors.lightBgColor,
        appBar: GeneralAppBar(title: titles[1]),
        floatingButton: FloatingActionButton(
          onPressed: () {},
          isExtended: true,
          shape: const CircleBorder(),
          child: const Icon(Icons.add),
        ),
        bottomNavigationBar: const CustomBottomNav(),
        widget: screens[1]

    );
  }
}
