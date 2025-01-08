// ignore_for_file: prefer_const_constructors

import 'package:fitness_training_app/helper/time_converter/time_converter.dart';
import 'package:fitness_training_app/utils/app_colors/app_colors.dart';
import 'package:fitness_training_app/utils/app_icons/app_icons.dart';
import 'package:fitness_training_app/utils/app_strings/app_strings.dart';
import 'package:fitness_training_app/view/components/custom_image/custom_image.dart';
import 'package:fitness_training_app/view/components/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomTrackingContainer extends StatelessWidget {

   String title;
   String dateString;
   String duration;
   String time;

    CustomTrackingContainer({super.key,required this.title,required this.dateString,required this.duration,required this.time});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.only(bottom: 10.h, ),
      child: Container(
        padding: EdgeInsets.all(15.h),
       // height: 75.h,
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 50.h,
              width: 50.w,
              decoration: BoxDecoration(
                color: AppColors.blue,
                borderRadius: BorderRadius.circular(70),
              ),
              child: CustomImage(imageSrc: AppIcons.icon5),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [


          /*      Row(
                  children: [
                    ///=============Kacl icon =============
                    CustomImage(
                      imageSrc: AppIcons.kaclIcon,
                      height: 15.h,
                      width: 15.w,
                    ),
                    ///============= kcal =============
                    CustomText(
                        left: 5.w,
                        text: AppStrings.kcal,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w300,
                        color: AppColors.black),
                  ],
                ),*/

                ///============ Upper body workout =============
                CustomText(
                   // text: AppStrings.upperBodyWorkout,
                    text: "${title}",
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.lightRed2),
                ///============ June Date =============
                CustomText(
                   // text: AppStrings.juneDate,
                    text: "${DateConverter.formatTimeAgo(dateString)}",
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.purple),
              ],
            ),
            ///============ Duration =============
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.access_time_filled_rounded,
                      size: 18.sp,
                      color: AppColors.purple,
                    ),
                    ///============= Duration =============
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: CustomText(
                      //  text: AppStrings.duration, convertTimeToMinutes
                         text: "${DateConverter.convertTimeToMinutes(duration)}",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.lightRed2,
                      ),
                    )
                  ],
                ),

                ///============= Mins =============
              /*  CustomText(
                  //text: AppStrings.mins,
                  text: "${DateConverter.formatTimeAgo(time)}",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.lightRed2,
                )*/
              ],
            )
          ],
        ),
      ),
    );
  }
}
