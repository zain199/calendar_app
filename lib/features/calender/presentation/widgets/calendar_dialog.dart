import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/util/style/colors.dart';
import '../../../../core/util/widgets/general_button.dart';

class CalendarDialog extends StatelessWidget {
  const CalendarDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.7,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.close,
                    color: Colors.transparent,
                  )),
              Text(
                "Choose Data",
                textAlign: TextAlign.center,
                style: Get.theme.textTheme.bodyMedium!
                    .copyWith(fontWeight: FontWeight.w700),
              ),
              IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(Icons.close))
            ],
          ),
          Divider(color: AppColors.grey200Color),
          CalendarDatePicker2(
            config: CalendarDatePicker2Config(selectedDayTextStyle: TextStyle(color: AppColors.whiteColor)),
            value: [
              DateTime.now(),
            ],
            onValueChanged: (dates) => {},
          ),
          GeneralButton(text: "Continue", onPressed: () {})
        ],
      ),
    );
  }
}
