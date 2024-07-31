import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../style/colors.dart';


class GeneralAppBar extends StatelessWidget {
  final String title;
  const GeneralAppBar({super.key , required this.title });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const Icon(Icons.menu),
      backgroundColor: AppColors.lightBgColor,
      title: Text(title , style: Get.theme.textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w700),),
      actions: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.transparent,
            border: Border.all(color: AppColors.grey200Color),
          ),
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.redColor
                ),
              ),
              const Icon(Icons.notifications_none),
            ],
          ),
        ),
        const SizedBox(width: 20),
      ],
    );
  }
}
