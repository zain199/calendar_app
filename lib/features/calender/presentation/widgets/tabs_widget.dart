import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../core/util/style/colors.dart';
import '../bloc/calendar_bloc.dart';

class TabsWidget extends StatefulWidget {
  const TabsWidget({super.key});

  @override
  State<TabsWidget> createState() => _TabsWidgetState();
}

class _TabsWidgetState extends State<TabsWidget> with SingleTickerProviderStateMixin{

  TabController? tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CalendarBloc bloc = BlocProvider.of<CalendarBloc>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      child: TabBar(
        padding: const EdgeInsets.symmetric(vertical: 12),
        dividerColor: Colors.transparent,
        indicatorWeight: 1,
        unselectedLabelColor: AppColors.grey500Color,
        indicatorPadding: const EdgeInsets.symmetric(vertical: -10),
        indicatorSize: TabBarIndicatorSize.tab,
        controller: tabController,
        onTap: (value) => setState(() {
          bloc.add(UpdateCurrentTabEvent(value));
          log(value.toString());
        }),
        tabs: [
          Text(
            "Schedule",
            style: Get.theme.textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.w700,
                color: bloc.tabIndex == 0 ? null : AppColors.grey500Color),
          ),
          Text(
            "Task",
            style: Get.theme.textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.w700,
                color: bloc.tabIndex == 1 ? null : AppColors.grey500Color),
          ),
        ],
      ),
    );
  }
}
