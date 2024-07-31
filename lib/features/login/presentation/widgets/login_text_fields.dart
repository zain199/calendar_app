import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/util/style/colors.dart';
import '../../../../core/util/widgets/general_text_field.dart';

class LoginTextFields extends StatelessWidget {
  const LoginTextFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        
        const SizedBox(height: 40),
        Text(
          'Username / Email',
          style: Get.theme.textTheme.bodySmall!
              .copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        DefaultTextFormField(
          hint: "Enter your username / email",
          controller: TextEditingController(),
          keyboardType: TextInputType.text,
        ),
        const SizedBox(height: 24),
        Text(
          'Password',
          style: Get.theme.textTheme.bodySmall!
              .copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        DefaultTextFormField(
          hint: "*********",
          controller: TextEditingController(),
          password: true,
          keyboardType: TextInputType.visiblePassword,
          suffixIcon: Icons.visibility_off,
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
