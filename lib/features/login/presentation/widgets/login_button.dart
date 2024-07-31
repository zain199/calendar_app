import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/features/main_layout/presentation/pages/main_layout_screen.dart';
import 'package:task/features/project_summary/presentation/pages/project_summery_screen.dart';

import '../../../../core/util/style/colors.dart';
import '../../../../core/util/widgets/general_button.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GeneralButton(text: "Login", onPressed: () => Get.offAll(const MainLayoutScreen())),
        const SizedBox(height: 24),
        Align(
          alignment: Alignment.center,
          child: Text(
            'Or login with account',
            style: Get.theme.textTheme.bodySmall!.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 12,
                color: AppColors.grey500Color),
          ),
        ),
      ],
    );
  }
}
