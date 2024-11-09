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
class CustomNutritionContainer extends StatelessWidget {
  const CustomNutritionContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Get.toNamed(AppRoutes.recipeIngredientsScreen);
          },
          child: CustomNetworkImage(
            imageUrl: AppConstants.ntrition,
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
                  text: AppStrings.recipeOfTheDay,
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
            child: Container(
              height: 60.h,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                  color: AppColors.black.withOpacity(.4),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  )),
              child: Padding(
                padding: EdgeInsets.only(left: 20.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///====================appleBlueberrySmoothy=========
                    CustomText(
                      text: AppStrings.appleBlueberrySmoothy,
                      fontSize: 18.sp,
                      color: AppColors.lightRed2,
                      fontWeight: FontWeight.w500,
                    ),
                    Row(
                      children: [
                        Icon(Icons.access_time_filled_sharp,size: 18,color: AppColors.white,),
                        SizedBox(width: 5.w,),
                        CustomText(
                          text: AppStrings.mins,
                          fontSize: 12.sp,
                          color: AppColors.lightRed2,
                          fontWeight: FontWeight.w400,
                        ),
                        SizedBox(width: 10.w,),
                        Icon(Icons.access_time_filled_sharp,size: 18,color: AppColors.white,),
                        SizedBox(width: 5.w,),
                        CustomText(
                          text: AppStrings.kcal,
                          fontSize: 12.sp,
                          color: AppColors.lightRed2,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ))
      ],
    );
  }
}
