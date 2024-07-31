import 'dart:developer';
import 'dart:math';

import 'package:calendar_view/calendar_view.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:task/core/util/assets/assets.dart';
import 'package:task/features/calender/presentation/widgets/date_picker_widget.dart';
import 'package:task/features/calender/presentation/widgets/tabs_widget.dart';
import 'package:task/features/calender/presentation/widgets/task_item.dart';

import '../../../../core/util/style/colors.dart';

class CalenderScreen extends StatefulWidget {
  const CalenderScreen({super.key});

  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  @override
  Widget build(BuildContext context) {
    EventController? controller = EventController();

    DateTime now = DateTime.now();
    List<CalendarEventData> events = [
      CalendarEventData(
        date: now,
        title: "Project meeting",
        description: "Today is project meeting.",
        startTime: DateTime(now.year, now.month, now.day, 1),
        endTime: DateTime(now.year, now.month, now.day, 2),
        color: AppColors.pink,
      ),
      CalendarEventData(
        date: now,
        startTime: DateTime(now.year, now.month, now.day, 3),
        endTime: DateTime(now.year, now.month, now.day, 4),
        title: "Wedding anniversary",
        description: "Attend uncle's wedding anniversary.",
        color: AppColors.orange,
      ),
      CalendarEventData(
        date: now,
        startTime: DateTime(now.year, now.month, now.day, 5),
        endTime: DateTime(now.year, now.month, now.day, 6),
        title: "Football Tournament",
        description: "Go to football tournament.",
        color: AppColors.green,
      ),
    ];

    controller.addAll(events);

    return DefaultTabController(
      length: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(color: AppColors.grey200Color),
          const DatePickerWidget(),
          const TabsWidget(),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                DayView(
                  controller: controller,
                  heightPerMinute: 1.5,
                  eventTileBuilder: (date, event, boundry, start, end) {
                    return Row(
                      children: [
                        Container(
                          width: 5,
                          decoration: BoxDecoration(
                              color: event.first.color,
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  bottomLeft: Radius.circular(8))),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          padding:  const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: event.first.color.withOpacity(0.2),
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(8),
                                  bottomRight: Radius.circular(8))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                event.first.title,
                                style: Get.theme.textTheme.bodySmall!
                                    .copyWith(fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  Image.asset(
                                    ImageAssets.clockIcon,
                                    color: AppColors.grey500Color,
                                    width: 16,
                                    height: 16,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    "${DateFormat("HH:mm a").format(event.first.startTime!)} - ${DateFormat("HH:mm a").format(event.first.endTime!)}",
                                    style: Get.theme.textTheme.bodySmall!
                                        .copyWith(
                                            fontSize: 12,
                                            color: AppColors.grey500Color),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                  pageViewPhysics: const NeverScrollableScrollPhysics(),
                  scrollPhysics: const NeverScrollableScrollPhysics(),
                  dayTitleBuilder: DayHeader.hidden,
                  initialDay: DateTime.now(),
                  maxDay: DateTime.now(),
                  minDay: DateTime.now(),
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => const TaskItem(),
                  itemCount: 10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
