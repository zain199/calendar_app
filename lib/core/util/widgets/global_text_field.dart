import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class MayaTextField extends StatefulWidget {
  final TextInputType keyboardType;
  final bool isPassword;
  final bool? enabled;
  final TextEditingController textController;
  final String labelText;
  final Widget? labelWidget;
  final String? Function(String?)? validation;
  final Widget? suffixWidget;
  final Widget? prefixWidget;
  final void Function(String)? onFieldSubmitted;
  final void Function(String)? onChanged;
  final int? maxLines;
  final TextAlign textAlign;
  final Color? backgroundColor;
  final Color? hintTextColor;
  final Color? textColor;
  final Color? cursorColor;
  final Color? borderColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final bool? withHint;
  final String? hintText;
  final FocusNode? focusNode;
  final InputBorder? enabledBorder;
  final EdgeInsetsGeometry ? contentPadding;
  final List<TextInputFormatter> additionalInputFormatters;
  const MayaTextField({Key? key,this.withHint,this.borderColor ,this.focusNode,this.enabledBorder , this.additionalInputFormatters = const [],this.enabled,this.contentPadding , this.hintText ,this.cursorColor ,required this.keyboardType,this.fontSize,this.fontWeight,this.textColor,this.hintTextColor,this.prefixWidget ,this.backgroundColor,this.textAlign = TextAlign.start, this.onChanged,this.isPassword =false, this.labelWidget, required this.textController, required this.labelText, this.validation, this.suffixWidget, this.onFieldSubmitted, this.maxLines,}) : super(key: key);

  @override
  State<MayaTextField> createState() => _MayaTextFieldState();
}

class _MayaTextFieldState extends State<MayaTextField> {
  bool isHidden= false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isHidden = widget.isPassword;
  }
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: widget.textAlign,
      onChanged: widget.onChanged,
      maxLines: widget.maxLines??1,
      minLines: 1,
      onFieldSubmitted: widget.onFieldSubmitted,
      keyboardType: widget.keyboardType ,
      obscureText: isHidden,
      controller: widget.textController ,
      enabled: widget.enabled,
      focusNode: widget.focusNode,
      inputFormatters:widget.keyboardType == TextInputType.number? [FilteringTextInputFormatter.digitsOnly,...widget.additionalInputFormatters,]:[],
      validator: (String? text){

        if(widget.validation != null){
          return widget.validation!(text);
        }
        return null;
      },
      style:TextStyle(
        color: widget.textColor,
        fontSize: widget.fontSize ,
        fontWeight: widget.fontWeight,
      ),
      cursorColor: widget.cursorColor,
      decoration: InputDecoration(
        labelText:widget.withHint==null?  widget.labelText:null,
        labelStyle:widget.withHint==null? TextStyle(
            color:widget.hintTextColor?? Color(0xffA4ACAD),
            fontWeight: widget.fontWeight??FontWeight.w400,
            fontSize: widget.fontSize??Get.theme.textTheme.bodyMedium!.fontSize,
        ):null,
        hintText:  widget.hintText,
        hintStyle: TextStyle(
            color:widget.hintTextColor?? Color(0xffA4ACAD),
            fontWeight: widget.fontWeight??FontWeight.w400,
            fontSize: widget.fontSize??Get.theme.textTheme.bodyMedium!.fontSize,
        ),
        fillColor: widget.backgroundColor??Get.theme.colorScheme.primaryContainer,
        filled: true,
        prefixIcon: widget.prefixWidget ,
        suffixIcon: widget.suffixWidget ?? (widget.isPassword
            ? IconButton(
          splashRadius: 7,
          onPressed: () {
            setState(() {
              isHidden = !isHidden;
            });
          },
          icon: Icon(
            !isHidden ? Icons.visibility : Icons.visibility_off,
            color: const Color(0xFFA5ABB9),
          ),
        )
            : null),
        contentPadding: widget.contentPadding ??  const EdgeInsets.symmetric(vertical: 18.0, horizontal: 16),
        enabledBorder:OutlineInputBorder(
            borderRadius: BorderRadius.circular(65),
            borderSide:  widget.borderColor!=null? BorderSide(color: widget.borderColor!,width: 1.5):const BorderSide(color: Color(0xffD6D6D6),width: .5)
        ) ,
        disabledBorder:OutlineInputBorder(
            borderRadius: BorderRadius.circular(65),
            borderSide:  widget.borderColor!=null? BorderSide(color: widget.borderColor!,width: 1.5):const BorderSide(color: Color(0xffD6D6D6),width: .5)
        )  ,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(65),
            borderSide:  widget.borderColor!=null? BorderSide(color: widget.borderColor!,width: 1.5): BorderSide(color: Get.theme.colorScheme.primary,width: .5)
        ),

        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(65),
            borderSide:  const BorderSide(color: Colors.red,width: 1.5)
        ),
        focusedErrorBorder:OutlineInputBorder(
            borderRadius: BorderRadius.circular(65),
            borderSide:  const BorderSide(color: Colors.red,width: 1.5)
        ) ,
      ),

    );
  }
}