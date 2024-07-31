import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/util/style/colors.dart';

class DatePickerWidget extends StatelessWidget {
  const DatePickerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return EasyDateTimeLine(
      initialDate: DateTime.now(),
      onDateChange: (selectedDate) {},
      headerProps: const EasyHeaderProps(
        monthPickerType: MonthPickerType.switcher,
        padding: EdgeInsets.all(24),
        dateFormatter: DateFormatter.custom("MMMM yyyy"),
      ),
      dayProps: EasyDayProps(
        dayStructure: DayStructure.dayStrDayNum,
        height: 80,
        width: 50,
        activeDayStyle: DayStyle(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            color: AppColors.mainColor,
          ),
          dayNumStyle: Get.theme.textTheme.bodyMedium!.copyWith(
              color: AppColors.whiteColor,
              fontWeight: FontWeight.bold),
          dayStrStyle: Get.theme.textTheme.bodySmall!.copyWith(
              fontSize: 12,
              color: AppColors.whiteColor,
              fontWeight: FontWeight.bold),
        ),
        inactiveDayStyle: DayStyle(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            color: AppColors.whiteColor,
          ),
          dayNumStyle: Get.theme.textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.bold),
          dayStrStyle: Get.theme.textTheme.bodySmall!.copyWith(
              color: AppColors.grey500Color,
              fontSize: 12,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
