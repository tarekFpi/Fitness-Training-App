import 'package:fitness_training_app/view/components/custom_image/custom_image.dart';
import 'package:fitness_training_app/view/components/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_icons/app_icons.dart';

class CustomNotificationCard2 extends StatelessWidget {
  const CustomNotificationCard2({
    super.key,
    required this.notification,
    required this.time,
  });

  final String notification;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          height: 64.h,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: AppColors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Row( 
              crossAxisAlignment: CrossAxisAlignment.center, 
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                 CircleAvatar(
                  radius: 25,
                  backgroundColor: AppColors.brinkPink,
                  child: CustomImage(
                    imageSrc: AppIcons.ball,  
                    height: 30.h, 
                    width: 25.w,
              
                    imageColor: AppColors.white,
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Column( 
                  mainAxisAlignment: MainAxisAlignment.center, 
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: notification,
                      color: AppColors.black,
                      fontSize: 14.w,
                      fontWeight: FontWeight.w500,
                    ), 
                    CustomText(
                      text: time,
                      color: AppColors.brinkPink,
                      fontSize: 12.w,
                      fontWeight: FontWeight.w500,
                    ), 
                  ],
                )
              ],
            ),
          ),
        ), 
        SizedBox(
          height: 10.h,
        ),
      ], 
    );
  }
}
