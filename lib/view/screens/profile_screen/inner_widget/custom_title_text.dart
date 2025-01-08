import 'package:fitness_training_app/utils/app_colors/app_colors.dart';
import 'package:fitness_training_app/view/components/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTitleText extends StatelessWidget {
  final String name;
  final String title;
  final bool? showBar;
  const CustomTitleText(
      {super.key,
      required this.name,
      required this.title,
      this.showBar = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
          text: name,
          fontSize: 15.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.white,
        ),
       SizedBox(height: 5.h,),
        ///======================== weightTitle ==============
        CustomText(
          text: title,
          fontSize: 15.sp,
          fontWeight: FontWeight.w300,
          color: AppColors.white,
        ),
      ],
    );
  }
}
