import 'package:fitness_training_app/utils/app_colors/app_colors.dart';
import 'package:fitness_training_app/utils/app_strings/app_strings.dart';
import 'package:fitness_training_app/view/components/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomFrontBackContainer extends StatelessWidget {
  const CustomFrontBackContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ///================== Front Image ===================
        Container(
          height: 92.h,
          width: MediaQuery.sizeOf(context).width / 2.5,
          decoration: BoxDecoration(
            color: AppColors.black,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: AppColors.softRed, width: 1.w),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.image,
                size: 30.sp,
                color: AppColors.lightRed2,
              ),
              CustomText(
                  text: AppStrings.front,
                  color: AppColors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400),
            ],
          ),
        ),
        SizedBox(
          width: 15.w,
        ),
        ///================== Back Image ===================
        Container(
          height: 92.h,
          width: MediaQuery.sizeOf(context).width / 2.5,
          decoration: BoxDecoration(
            color: AppColors.black,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: AppColors.softRed, width: 1.w),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.image,
                size: 30.sp,
                color: AppColors.lightRed2,
              ),
              CustomText(
                  text: AppStrings.back,
                  color: AppColors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400),
            ],
          ),
        )
      ],
    );
  }
}
