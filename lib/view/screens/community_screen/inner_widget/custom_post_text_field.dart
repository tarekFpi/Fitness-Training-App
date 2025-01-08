import 'package:fitness_training_app/utils/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_fonts/google_fonts.dart';

class CustomPostTextField extends StatefulWidget {
  const CustomPostTextField({
    super.key,
    this.inputFormatters,
    this.onFieldSubmitted,
    this.textEditingController,
    this.focusNode,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.cursorColor = Colors.black,
    this.inputTextStyle,
    this.textAlignVertical = TextAlignVertical.center,
    this.textAlign = TextAlign.start,
    this.onChanged,
    this.maxLines = 1,
    this.validator,
    this.hintText,
    this.hintStyle,
    this.fillColor = AppColors.white,
    this.suffixIcon,
    this.suffixIconColor,
    this.fieldBorderRadius = 4,
    this.fieldBorderColor = Colors.transparent, //const Color(0xffB5D8EE),
    this.isPassword = false,
    this.isPrefixIcon = true,
    this.readOnly = false,
    this.maxLength ,
    this.prefixIcon,
    this.onTap,
  });

  final TextEditingController? textEditingController;
  final FocusNode? focusNode;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final Color cursorColor;
  final TextStyle? inputTextStyle;
  final TextAlignVertical? textAlignVertical;
  final TextAlign textAlign;
  final int? maxLines;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final FormFieldValidator<String>? validator;
  final String? hintText;
  final TextStyle? hintStyle;
  final Color? fillColor;
  final Color? suffixIconColor;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final double fieldBorderRadius;
  final Color fieldBorderColor;
  final bool isPassword;
  final bool isPrefixIcon;
  final bool readOnly;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final VoidCallback? onTap;

  @override
  State<CustomPostTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomPostTextField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: widget.onTap,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      inputFormatters: widget.inputFormatters,
      onFieldSubmitted: widget.onFieldSubmitted,
      readOnly: widget.readOnly,
      controller: widget.textEditingController,
      focusNode: widget.focusNode,
      maxLength: widget.maxLength,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      cursorColor: widget.cursorColor,
      style: widget.inputTextStyle,
      onChanged: widget.onChanged,
      maxLines: widget.maxLines,
      obscureText: widget.isPassword ? obscureText : false,
      validator: widget.validator,
      textAlign: widget.textAlign,
      textAlignVertical: widget.textAlignVertical,
      decoration: InputDecoration(
        isDense: true,
        errorMaxLines: 2,
        hintText: widget.hintText,
        hintStyle: widget.hintStyle ??
            GoogleFonts.poppins(
              fontSize: 14.w,
              fontWeight: FontWeight.w400,
              color: AppColors.white,
            ),
        fillColor: widget.fillColor,
        filled: true,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.isPassword
            ? GestureDetector(
          onTap: toggle,
          child: const Padding(
            padding: EdgeInsets.all(16),
            child: Icon(Icons.access_time_filled)/*SvgPicture.asset(
              obscureText ? AppIcons.eyeOff : AppIcons.eye,
              height: 22,
              width: 22,
            ),*/
          ),
        )
            : widget.suffixIcon,
        suffixIconColor: widget.suffixIconColor,
        border: InputBorder.none,
      ),
    );
  }

  void toggle() {
    setState(() {
      obscureText = !obscureText;
    });
  }
}
