// ignore_for_file: prefer_const_constructors

import 'package:fitness_training_app/core/app_routes/app_routes.dart';
import 'package:fitness_training_app/utils/app_colors/app_colors.dart';
import 'package:fitness_training_app/utils/app_icons/app_icons.dart';
import 'package:fitness_training_app/utils/app_strings/app_strings.dart';
import 'package:fitness_training_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:fitness_training_app/view/components/custom_button/custom_button.dart';
import 'package:fitness_training_app/view/components/custom_image/custom_image.dart';
import 'package:fitness_training_app/view/components/custom_nav_bar/custom_navbar.dart';
import 'package:fitness_training_app/view/components/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarContent: AppStrings.support),
      body: Padding(padding: EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ///================== Chat Screen ==================
          Column(
            children: [
              GestureDetector(
                onTap: (){
                  Get.toNamed(AppRoutes.messageScreen);
              },child:
              Container(
                height: 96.h,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  color: AppColors.lightRed2,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomImage(
                      imageSrc: AppIcons.messageicon,
                      height: 40.h,
                      width: 40.w,
                      imageColor: AppColors.white,
                    ),
                    CustomText(
                      text: AppStrings.chatWithCoach,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                    ),
                    Icon(Icons.arrow_forward_ios_sharp,color: AppColors.white,)
                  ],
                ),
              ),),
              SizedBox(height: 20.h,),

        /*      GestureDetector(
                onTap: (){
                  //ZoomCallScreen
                  Get.toNamed(AppRoutes.zoomCallScreen);
                },
                child: Container(
                  height: 96.h,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                    color: AppColors.lightRed2,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomImage(
                        imageSrc: AppIcons.zoomIcon,
                        height: 40.h,
                        width: 40.w,
                        imageColor: AppColors.white,
                      ),
                      CustomText(
                        text: AppStrings.viaZoomCalls,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white,
                      ),
                      Icon(Icons.arrow_forward_ios_sharp,color: AppColors.white,)
                    ],
                  ),
                ),
              ),
              SizedBox(height: 50.h,),*/

            ],
          ),
  /*       Padding(padding: EdgeInsets.only(bottom: 20),
           child:  CustomButton(
           width: 200.w,
           height: 48.h,
           onTap: (){
             Get.toNamed(AppRoutes.subscriptionScreen);
           },
           title: AppStrings.upgradeNow,),),*/
        ],
      ),),
      bottomNavigationBar: CustomNavbar(currentIndex: 3),
    );
  }
}
