import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/app_colors/app_colors.dart';
import '../custom_text/custom_text.dart';
import '../custom_text_field/custom_text_field.dart';

class CustomFormCard extends StatelessWidget {
  final String title;
  final String? hintText;
  final TextEditingController controller;
  final bool isPassword;
  final bool? hasSuffixIcon;
  final bool readOnly;
  final VoidCallback? onTap;
  final bool hasBackgroundColor;
  final bool isMultiLine;
  final String? Function(dynamic)? validator;

  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final int? maxLine;
  final double? fontSize;
  final Color? titleColor;
  final TextInputType? keyboardType;

  const CustomFormCard({
    super.key,
    required this.title,
    required this.controller,
    this.isPassword = false,
    this.hasSuffixIcon,
    this.readOnly = false,
    this.onTap,
    this.hasBackgroundColor = false,
    this.isMultiLine = false,
    this.validator,
    this.hintText,
    this.suffixIcon,
    this.maxLine,
    this.fontSize,
    this.titleColor,
    this.prefixIcon, this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        CustomText(
          text: title,
          color: titleColor ?? AppColors.white,
          fontWeight: FontWeight.w600,
          fontSize: fontSize ?? 15.w,
          bottom: 12.h,
          maxLines: 2,
        ),
        CustomTextField( 
         isDens: true,
          prefixIcon: prefixIcon,
          validator: validator,
          readOnly: readOnly,
          hintText: hintText,
          hintStyle: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              fontSize: 14.w,
              color: AppColors.black),
          suffixIcon: suffixIcon,
          isPassword: isPassword,
          textEditingController: controller,
          inputTextStyle: GoogleFonts.poppins(color: AppColors.black),
          fillColor: hasBackgroundColor ? AppColors.black : AppColors.white,
          fieldBorderColor: AppColors.brinkPink,
          keyboardType:
              isPassword ? TextInputType.visiblePassword : keyboardType?? TextInputType.text,
          onTap: onTap,
          maxLines: isPassword ? 1 : maxLine,
          fieldBorderRadius: 15,
        ),
        SizedBox(height: 15.h),
      ],
    );
  }
}
