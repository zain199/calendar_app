import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/core/util/style/colors.dart';
import 'package:task/core/util/widgets/general_button.dart';
import 'package:task/core/util/widgets/main_layout_widget.dart';
import 'package:task/features/login/presentation/widgets/forget_password_button.dart';
import 'package:task/features/login/presentation/widgets/login_button.dart';
import 'package:task/features/login/presentation/widgets/login_footer.dart';
import 'package:task/features/login/presentation/widgets/login_header.dart';
import 'package:task/features/login/presentation/widgets/login_text_fields.dart';
import 'package:task/features/login/presentation/widgets/social_buttons.dart';

import '../../../../size_config.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const MainLayoutWidget(
      widthMargin: 0,
      heightMargin: 0,
      widget: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LoginHeader(),
            LoginTextFields(),
            ForgetPasswordButton(),
            LoginButton(),
            SocialButtons(),
            LoginFooter(),
          ],
        ),
      ),
    );
  }
}
