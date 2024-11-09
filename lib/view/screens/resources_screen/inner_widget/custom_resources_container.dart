// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:fitness_training_app/core/app_routes/app_routes.dart';
import 'package:fitness_training_app/utils/app_colors/app_colors.dart';
import 'package:fitness_training_app/utils/app_const/app_const.dart';
import 'package:fitness_training_app/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:fitness_training_app/view/components/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
class CustomResourcesContainer extends StatelessWidget {
  const CustomResourcesContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: GestureDetector(
       onTap: (){
          Get.toNamed(AppRoutes.workoutResourceScreen);
        },
        child: Column(
        children: [
          CustomNetworkImage(
            imageUrl: AppConstants.sliderImage1,
            height: 92.h,
            width: 157.w,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          Container(
            height: 70.h,
            width: 157.w,
            decoration: BoxDecoration(
              color: AppColors.black.withOpacity(.4),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),),
              border: Border(
                left: BorderSide(color: AppColors.lightRed2, width: 1.w),
                right: BorderSide(color: AppColors.lightRed2, width: 1.w),
                bottom: BorderSide(color: AppColors.lightRed2, width: 1.w),
              ),
            ),
            child: Column(
              children: [
                CustomText(
                  top: 10.h,
                  bottom: 10.h,
                  text: "Loop band Exercises",
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.lightRed2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomText(
                      text: "45 Minutes",
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      color: AppColors.white,
                    ),
                    CustomText(
                      text: "5 exercises",
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      color: AppColors.white,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
            ),
      ),);
  }
}
