import 'package:fitness_training_app/utils/app_colors/app_colors.dart';
import 'package:fitness_training_app/view/components/custom_image/custom_image.dart';
import 'package:fitness_training_app/view/components/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomIconWidget extends StatelessWidget {
  final String imageSrc;
  final String title;
  final Function()? onTap;
  const CustomIconWidget({super.key, required this.imageSrc, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomImage(
            imageSrc: imageSrc,
            imageColor: AppColors.lightRed,
            height: 30.h,
            width: 30.w,
          ),
          SizedBox(
            height: 4.h,
          ),
          CustomText(
            text: title,
            fontSize: 12.sp,
            color: AppColors.lightRed,
            fontWeight: FontWeight.w400,
          ),
        ],
      ),
    );
  }
}
