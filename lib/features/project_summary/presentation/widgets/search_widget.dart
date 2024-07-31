import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../core/util/assets/assets.dart';
import '../../../../core/util/widgets/general_text_field.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        Text(
          "Search",
          style: Get.theme.textTheme.bodySmall,
        ),
        const SizedBox(height: 8),
        DefaultTextFormField(
          hint: "Search project here",
          controller: TextEditingController(),
          keyboardType: TextInputType.text,
          suffixWidgetIcon: Padding(
            padding: const EdgeInsets.all(20),
            child: SvgPicture.asset(ImageAssets.searchIcon),
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
