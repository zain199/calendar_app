import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/util/assets/assets.dart';
import '../../../../core/util/style/colors.dart';
import '../../../../core/util/widgets/general_button.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24),
        GeneralButton(
          text: "Continue with Google",
          onPressed: () {},
          icon: SvgPicture.asset(ImageAssets.googleIcon),
          backgroundColor: Colors.transparent,
          borderColor: AppColors.grey200Color,
          textColor: AppColors.textColor,
        ),
        const SizedBox(height: 8),
        GeneralButton(
          text: "Continue with Facebook",
          onPressed: () {},
          icon: SvgPicture.asset(ImageAssets.facebookIcon),
          backgroundColor: Colors.transparent,
          borderColor: AppColors.grey200Color,
          textColor: AppColors.textColor,
        ),
        const SizedBox(height: 8),
        GeneralButton(
          text: "Continue with Apple",
          onPressed: () {},
          icon: SvgPicture.asset(ImageAssets.appleIcon),
          backgroundColor: Colors.transparent,
          borderColor: AppColors.grey200Color,
          textColor: AppColors.textColor,
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
