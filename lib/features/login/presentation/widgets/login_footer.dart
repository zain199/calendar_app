import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/util/style/colors.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account? ",
          style: Get.theme.textTheme.bodySmall!
              .copyWith(color: AppColors.grey500Color),
        ),
        Text(
          "Register Here",
          style: Get.theme.textTheme.bodySmall!
              .copyWith(fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}
