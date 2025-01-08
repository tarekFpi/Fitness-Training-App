// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:fitness_training_app/utils/app_colors/app_colors.dart';
import 'package:fitness_training_app/utils/app_const/app_const.dart';
import 'package:fitness_training_app/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:fitness_training_app/view/components/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomSearchContainer extends StatelessWidget {
  const CustomSearchContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Column(
        children: [
          Stack(
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
              Positioned(
                  right: 0,
                  top: 0.h,
                  left: 0,
                  bottom: 0,
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Icon(Icons.play_circle,size: 35,color: AppColors.lightRed2,),
                  ))
            ],
          ),
          Container(
            height: 50.h,
            width: 157.w,
            decoration: BoxDecoration(
              color: AppColors.black.withOpacity(.4),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),),
              border: Border.all(color: AppColors.lightRed2, width: 1.w),
            ),
            child: Column(
              children: [
                CustomText(
                  top: 10.h,
                  bottom: 10.h,
                  text: "Squat Exercise",
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.lightRed2,
                ),
              ],
            ),
          )
        ],
      ),);
  }
}
