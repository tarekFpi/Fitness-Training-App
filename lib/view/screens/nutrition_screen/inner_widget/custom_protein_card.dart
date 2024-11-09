// ignore_for_file: prefer_const_constructors

import 'package:fitness_training_app/utils/app_colors/app_colors.dart';
import 'package:fitness_training_app/utils/app_icons/app_icons.dart';
import 'package:fitness_training_app/utils/app_strings/app_strings.dart';
import 'package:fitness_training_app/view/components/custom_image/custom_image.dart';
import 'package:fitness_training_app/view/components/custom_text/custom_text.dart';
import 'package:fitness_training_app/view/screens/home_screen/home_model/recipi_program_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomProteinCard extends StatelessWidget {
    CustomProteinCard(this.item, {super.key});

 final RecipiProgramModel item;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Row(
          children: [
            Container(
              height: 40.h,
              width: 40.w,
              decoration: BoxDecoration(
                color: AppColors.grey06,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: CustomImage(imageSrc: AppIcons.protein),
            ),
            SizedBox(
              width: 10.w,
            ),
            CustomText(
             // text: AppStrings.protein,
               text: "${item.carbs}${AppStrings.protein}",
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.black,
            )
          ],
        ),
        Row(
          children: [
            Container(
              height: 40.h,
              width: 40.w,
              decoration: BoxDecoration(
                color: AppColors.grey06,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: CustomImage(imageSrc: AppIcons.kaclIcon,),
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            CustomText(
              //text: AppStrings.kcalText,
              text: "${item.energy}${AppStrings.kcalText}",
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.black,
            )
          ],
        )
      ],),
      SizedBox(height: 20.h,),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Row(
          children: [
            Container(
              height: 40.h,
              width: 40.w,
              decoration: BoxDecoration(
                color: AppColors.grey06,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: CustomImage(imageSrc: AppIcons.carbs),
            ),
            SizedBox(
              width: 10.w,
            ),
            CustomText(
              //text: AppStrings.carbs,
              text: "${item.carbs} ${AppStrings.carbs}",
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.black,
            )
          ],
        ),
        Row(
          children: [
            Container(
              height: 40.h,
              width: 40.w,
              decoration: BoxDecoration(
                color: AppColors.grey06,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: CustomImage(imageSrc: AppIcons.fat,),
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            CustomText(
             // text: AppStrings.fat,
              text: "${item.fat}"+AppStrings.fat,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.black,
            )
          ],
        )
      ],),

      ],
    );
  }
}
