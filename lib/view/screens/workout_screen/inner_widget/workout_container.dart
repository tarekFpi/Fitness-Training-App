// ignore_for_file: prefer_const_constructors
import 'package:fitness_training_app/core/app_routes/app_routes.dart';
import 'package:fitness_training_app/utils/app_colors/app_colors.dart';
import 'package:fitness_training_app/utils/app_const/app_const.dart';
import 'package:fitness_training_app/utils/app_strings/app_strings.dart';
import 'package:fitness_training_app/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:fitness_training_app/view/components/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class WorkoutContainer extends StatelessWidget {
  const WorkoutContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: (){
            Get.toNamed(AppRoutes.workoutResourceScreen);
          },
          child: CustomNetworkImage(
            imageUrl: AppConstants.sliderImage3,
            borderRadius: BorderRadius.circular(20),
            height: MediaQuery.sizeOf(context).width / 2,
            width: MediaQuery.sizeOf(context).width,
          ),
        ),
        Positioned(
          right: 0,
          child: Container(
            height: 30.h,
            width: 120.w,
            decoration: BoxDecoration(
              color: AppColors.lightRed,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
            child: Center(
                child: CustomText(
              text: AppStrings.trainingOfTheDay,
              color: AppColors.black,
              fontSize: 10.sp,
              fontWeight: FontWeight.w400,
            )),
          ),
        ),
        Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ///===================Time=================
                Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      color: AppColors.white,
                      size: 10,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    CustomText(
                      text: AppStrings.seconds,
                      color: AppColors.white,
                      fontSize: 10.sp,
                    ),
                  ],
                ),

                ///=================Kcal================
                Row(
                  children: [
                    Icon(
                      Icons.keyboard_command_key_rounded,
                      color: AppColors.white,
                      size: 10,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    CustomText(
                      text: AppStrings.kcal,
                      color: AppColors.white,
                      fontSize: 10.sp,
                    ),
                  ],
                ),

                ///=================Kcal================
                Row(
                  children: [
                    Icon(
                      Icons.extension,
                      color: AppColors.white,
                      size: 10,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    CustomText(
                      text: AppStrings.exercise,
                      color: AppColors.white,
                      fontSize: 10.sp,
                    ),
                  ],
                )
              ],
            ))
      ],
    );
  }
}
