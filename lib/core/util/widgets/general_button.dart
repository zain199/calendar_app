import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../style/colors.dart';


class GeneralButton extends StatelessWidget {
  final String text;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? backgroundColor;
  final Color? borderColor;
  final void Function()? onPressed;
  final double widthMargin;
  final double heightMargin;
  final double? width;
  final double borderWidth;
  final double? pHorizontal;
  final double? pVertical;
  final double? height;
  final IconData? iconData;
  final Widget? icon;
  final Widget? child;
  final double elevation;
  final double? borderRadius;
  final bool? enabled;

  const GeneralButton(
      {Key? key,
      this.child,
      this.icon,
      required this.text,
      required this.onPressed,
      this.borderRadius,
      this.fontWeight,
      this.textColor,
        this.enabled,
      this.elevation = 0,
      this.backgroundColor,
      this.borderColor,
      this.widthMargin = 0.0,
      this.fontSize,
      this.width = double.infinity,
      this.borderWidth = 1,
      this.pHorizontal,
      this.pVertical,
      this.heightMargin = 8,
      this.height = 60,
      this.iconData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      // decoration: BoxDecoration(
      //   boxShadow: [mainColorShadow]
      // ),
      child: RawMaterialButton(
        elevation: elevation,
        fillColor: enabled == null ||( enabled != null&&enabled == true)?backgroundColor ?? AppColors.mainColor : AppColors.grey400Color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            borderRadius ?? 8,
          ),
          side: borderColor != null
              ? BorderSide(color: borderColor!,width: borderWidth)
              : BorderSide.none,
        ),

        onPressed: enabled == null ||( enabled != null&&enabled == true)? onPressed : null,
        child: FittedBox(
          fit: BoxFit.cover,
          child: child ??
              Row(
                children: [
                  if (iconData != null)
                    Row(
                      children: [
                        Icon(
                          iconData,
                          color: Get.isDarkMode ? AppColors.darkBgColor : Colors.white,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                      ],
                    ),
                  if (icon != null)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        icon!,
                        const SizedBox(
                          width: 30,
                        ),
                      ],
                    ),
                  Text(
                    text,
                    style: Get.theme.textTheme.bodyMedium!.copyWith(
                      color:enabled == null ||( enabled != null&&enabled == true)? textColor ??
                          (Get.isDarkMode ? AppColors.darkBgColor : Colors.white):AppColors.grey400Color,
                      fontWeight: fontWeight ?? FontWeight.bold,
                      fontSize: fontSize,

                    ),
                  )
                ],
              ),
        ),
      ),
    );
  }
}
