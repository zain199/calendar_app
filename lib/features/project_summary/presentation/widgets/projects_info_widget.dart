import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/util/assets/assets.dart';
import '../../../../core/util/style/colors.dart';
import '../../../../core/util/style/shadows.dart';

class ProjectsInfoWidget extends StatelessWidget {
  const ProjectsInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> title = [
      "Project In Progress",
      "Project Completed",
      "Project cancelled"
    ];

    List<String> icons = [
      ImageAssets.clockIcon,
      ImageAssets.completeIcon,
      ImageAssets.cancelIcon
    ];

    List<List<Color>> colors = [
      [
        const Color(0xff3A9ADE),
        const Color(0xff5EACE4),
      ],
      [
        const Color(0xff3F8B8D),
        const Color(0xff58B2B4),
      ],
      [
        const Color(0xffDD4A4A),
        const Color(0xffE87777),
      ],
    ];

    return  Row(
      children: List.generate(
        3,
            (index) => Expanded(
          child: Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.all(2.5),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: colors[index]),
              boxShadow: [
                shadow(
                  color: colors[index][0].withOpacity(0.4),
                ),
              ],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "10",
                      style: Get.theme.textTheme.displaySmall!
                          .copyWith(color: AppColors.whiteColor),
                    ),
                    Image.asset(
                      icons[index],
                      width: 16,
                      height: 16,
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  title[index],
                  style: Get.theme.textTheme.bodySmall!.copyWith(
                      color: AppColors.whiteColor, fontSize: 12),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
