import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/util/style/colors.dart';
import 'package:task/core/util/widgets/general_app_bar.dart';
import 'package:task/core/util/widgets/main_layout_widget.dart';
import 'package:task/features/calender/presentation/pages/calender_screen.dart';
import 'package:task/features/main_layout/presentation/bloc/main_layout_bloc.dart';
import 'package:task/features/project_summary/presentation/pages/project_summery_screen.dart';
import '../widgets/custom_bottom_nav.dart';


class MainLayoutScreen extends StatelessWidget {
  MainLayoutScreen({super.key});

  List<Widget> screens = [
     ProjectSummeryScreen(),
     CalenderScreen(),
     ProjectSummeryScreen(),
     CalenderScreen(),
  ];

  List<String> titles = [
    "Project Summary",
    "Calender",
    "Project Summary",
    "Calender",
  ];
  @override
  Widget build(BuildContext context) {
    MainLayoutBloc bloc = BlocProvider.of<MainLayoutBloc>(context);
    return BlocBuilder(
      bloc: bloc,
      builder: (context, state) => Scaffold(
        backgroundColor: AppColors.lightBgColor,
        appBar: PreferredSize(preferredSize: const Size(double.maxFinite, 60), child: GeneralAppBar(title: titles[bloc.screenIndex]),),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          isExtended: true,
          shape: const CircleBorder(),
          child: const Icon(Icons.add),
        ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: const CustomBottomNav(),
        body: screens[bloc.screenIndex]
      )

    );
  }
}
