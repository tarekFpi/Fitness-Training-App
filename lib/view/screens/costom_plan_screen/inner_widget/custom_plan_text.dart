import 'package:fitness_training_app/utils/app_colors/app_colors.dart';
import 'package:fitness_training_app/view/components/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomPlanText extends StatelessWidget {
  final String text;
  const CustomPlanText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: CustomText(
        text: text,
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.lightRed2,
      ),
    );
  }
}
