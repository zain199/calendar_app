import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/util/assets/assets.dart';
import '../../../../core/util/style/colors.dart';
import 'calendar_dialog.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.bottomSheet(
          isScrollControlled: true,
          const CalendarDialog(),
          backgroundColor: AppColors.whiteColor,
        );
      },
      child: Container(
        padding: const EdgeInsets.all(24),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.whiteColor,
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 8),
                blurRadius: 24,
                spreadRadius: 0,
                color: Colors.black.withOpacity(0.08)),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Meeting Concept",
                  style: Get.theme.textTheme.bodyMedium,
                ),
                const SizedBox(height: 5),
                Text(
                  "Due Date : Mon, 12 Jan 2023",
                  style: Get.theme.textTheme.bodySmall!
                      .copyWith(fontSize: 12, color: AppColors.grey600Color),
                ),
              ],
            ),
            Image.asset(
              ImageAssets.checkIcon,
              width: 24,
              height: 24,
            )
          ],
        ),
      ),
    );
  }
}
