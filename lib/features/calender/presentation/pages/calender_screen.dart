import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/features/calender/presentation/bloc/calendar_bloc.dart';
import 'package:task/features/calender/presentation/widgets/date_picker_widget.dart';
import 'package:task/features/calender/presentation/widgets/tabs_widget.dart';
import 'package:task/features/calender/presentation/widgets/task_item.dart';

import '../../../../core/util/style/colors.dart';
import '../widgets/day_view.dart';

class CalenderScreen extends StatefulWidget {
  const CalenderScreen({super.key});

  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen>  with SingleTickerProviderStateMixin{

  TabController? tabController;

  @override
  void initState() {
  tabController = TabController(length: 2, vsync: this);
  super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CalendarBloc bloc = BlocProvider.of<CalendarBloc>(context);

    return BlocListener(
      bloc: bloc,
      listener: (BuildContext context, state) {
        if(state is UpdateCurrentTabDone)
          tabController!.animateTo(bloc.tabIndex,);

      },
      child: DefaultTabController(
        length: 2,
        initialIndex: bloc.tabIndex,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(color: AppColors.grey200Color),
            const DatePickerWidget(),
            const TabsWidget(),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: tabController,
                  children: [
                    const DayViewComponent(),
                    ListView.builder(
                      itemBuilder: (context, index) => const TaskItem(),
                      itemCount: 10,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
