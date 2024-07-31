import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/core/util/style/colors.dart';

class DefaultTextFormField extends StatefulWidget {
  String hint;
  FormFieldValidator<String>? correctionHint;
  VoidCallback? ontap;
  IconData? prefixIcon;
  IconData? suffixIcon;
  bool? password;

  TextInputType? keyboardType;
  TextEditingController controller;
  bool? readOnly;
  bool? lightMode;
  Color? iconColor;
  Color? filledColor;
  Color? textColor;
  Color? borderColor;
  int? maxLines;
  bool? expands;
  bool? enabled;
  Widget? suffixWidgetIcon;
  void Function(String)? onChanged;

  DefaultTextFormField(
      {Key? key,
      this.iconColor,
      this.maxLines,
      this.enabled,
      this.filledColor,
      this.suffixWidgetIcon,
      this.onChanged,
      this.expands,
      this.password,
      this.textColor,
      this.correctionHint,
      this.lightMode,
      required this.hint,
      required this.controller,
      this.ontap,
      this.prefixIcon,
      this.suffixIcon,
      this.borderColor,
      this.keyboardType,
      this.readOnly})
      : super(key: key);

  @override
  State<DefaultTextFormField> createState() => _DefaultTextFormFieldState();
}

class _DefaultTextFormFieldState extends State<DefaultTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: widget.lightMode != null
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(65),
              color: Colors.white,
            )
          : null,
      child: TextFormField(
        readOnly: widget.readOnly ?? false,
        maxLines: widget.maxLines ?? 1,
        minLines: widget.maxLines ?? 1,
        keyboardType: widget.keyboardType,
        obscureText: widget.password != null ? widget.password! : false,
        onChanged: widget.onChanged,
        enabled: widget.enabled ?? true,
        style: widget.textColor != null
            ? const TextStyle(color: Colors.black)
            : const TextStyle(fontSize: 14),
        decoration: InputDecoration(
          suffixIcon: widget.suffixWidgetIcon ?? (widget.suffixIcon != null
                  ? IconButton(
                      icon: Icon(
                        widget.suffixIcon!,
                        color: widget.lightMode != null
                            ? Colors.black
                            : Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          if (widget.suffixIcon == Icons.visibility_off) {
                            widget.suffixIcon = Icons.visibility;
                          } else {
                            widget.suffixIcon = Icons.visibility_off;
                          }
                          widget.password = !widget.password!;
                        });
                      },
                    )
                  : null),
          prefixIcon: widget.prefixIcon != null
              ? Icon(
                  widget.prefixIcon!,
                  color: widget.lightMode != null
                      ? Colors.black
                      : widget.iconColor,
                )
              : null,
          fillColor: widget.filledColor,
          filled: widget.filledColor != null ? true : false,
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.grey200Color)),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.blackColor, width: 1)),
          disabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.grey200Color)),
          errorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1.5)),
          focusedErrorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1.5)),
          hintText: widget.hint,
          hintStyle: Get.theme.textTheme.bodyMedium!.copyWith(
            color: AppColors.grey500Color
          )
        ),
        onTap: widget.ontap,
        magnifierConfiguration: TextMagnifierConfiguration(
          magnifierBuilder:
              (_, __, ValueNotifier<MagnifierInfo> magnifierInfo) =>
                  CustomMagnifier(
            magnifierInfo: magnifierInfo,
          ),
        ),
        controller: widget.controller,
        validator: widget.correctionHint,
      ),
    );
  }
}

class CustomMagnifier extends StatelessWidget {
  const CustomMagnifier({super.key, required this.magnifierInfo});

  static const Size magnifierSize = Size(80, 40);

  final ValueNotifier<MagnifierInfo> magnifierInfo;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<MagnifierInfo>(
        valueListenable: magnifierInfo,
        builder: (BuildContext context, MagnifierInfo currentMagnifierInfo, _) {
          Offset magnifierPosition = currentMagnifierInfo.globalGesturePosition;

          magnifierPosition = Offset(
            clampDouble(
              magnifierPosition.dx,
              currentMagnifierInfo.currentLineBoundaries.left,
              currentMagnifierInfo.currentLineBoundaries.right,
            ),
            clampDouble(
              magnifierPosition.dy,
              currentMagnifierInfo.currentLineBoundaries.top,
              currentMagnifierInfo.currentLineBoundaries.bottom,
            ),
          );

          magnifierPosition -= Alignment.bottomCenter.alongSize(magnifierSize);

          return Positioned(
            left: magnifierPosition.dx - 40,
            top: magnifierPosition.dy - 40,
            child: RawMagnifier(
              focalPointOffset: Offset(0, magnifierSize.height),
              decoration: MagnifierDecoration(
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Get.theme.colorScheme.primary,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(20)),
              ),
              size: magnifierSize,
            ),
          );
        });
  }
}
