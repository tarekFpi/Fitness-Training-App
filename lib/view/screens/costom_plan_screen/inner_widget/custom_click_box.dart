import 'package:fitness_training_app/utils/app_colors/app_colors.dart';
import 'package:fitness_training_app/view/components/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomClickBox extends StatelessWidget {
  final String text;
  const CustomClickBox({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
            activeColor: AppColors.lightRed2,
            fillColor: WidgetStateProperty.all(AppColors.lightRed2),
            checkColor: AppColors.white,
            value: true, onChanged: (value){}),
        CustomText(
          text: text,
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.white,
        ),
      ],
    );
  }
}
