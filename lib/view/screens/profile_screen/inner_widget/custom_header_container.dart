// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:fitness_training_app/helper/time_converter/time_converter.dart';
import 'package:fitness_training_app/service/api_url.dart';
import 'package:fitness_training_app/utils/app_colors/app_colors.dart';
import 'package:fitness_training_app/utils/app_const/app_const.dart';
import 'package:fitness_training_app/utils/app_strings/app_strings.dart';
import 'package:fitness_training_app/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:fitness_training_app/view/components/custom_text/custom_text.dart';
import 'package:fitness_training_app/view/screens/profile_screen/edit_profile_screen/edit_profile_controller/edit_profile_controller.dart';
import 'package:fitness_training_app/view/screens/profile_screen/inner_widget/custom_title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
class CustomHeaderContainer extends StatelessWidget {
  const CustomHeaderContainer({super.key});

  @override
  Widget build(BuildContext context) {

    final EditProfileController editProfileController =Get.find<EditProfileController>();

    return Obx((){

        return Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20.h),
              child: Container(
                height: MediaQuery.sizeOf(context).height / 3.2,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  color: AppColors.lightRed2,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.r),
                    topRight: Radius.circular(20.r),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 140.h,
                          width: 140.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(width: 5, color: AppColors.white),
                            boxShadow: [
                              BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: AppColors.black.withOpacity(0.1),
                              ),
                            ],
                          ),
                          child: Stack(
                            children: [

                        ///================= Profile Image =================

                           editProfileController.profileImage.value == "" ?
                           CustomNetworkImage(
                                imageUrl:
                               /// AppConstants.profileimage,
                               "${editProfileController.userProfileShow.value.img ?? ""}",
                                height: 140.h,
                                width: 140.w,
                                boxShape: BoxShape.circle,
                              ): Container(
                               height: 140.h,
                               width: 140.w,decoration: BoxDecoration(
                               shape: BoxShape.circle,
                               image: DecorationImage(
                               //  image: FileImage(editProfileController.profileImage.value),
                                image: FileImage(File(editProfileController.profileImage.value)),
                                 fit: BoxFit.cover,
                               )
                           ),
                           ),
                              Positioned(
                                bottom: 5,
                                right: 5,
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                        color: AppColors.white, shape: BoxShape.circle),
                                    child: GestureDetector(
                                      onTap: (){
                                        editProfileController.getImage();
                                      },
                                      child: Icon(
                                        Icons.camera_alt,
                                        size: 18,
                                        color: AppColors.lightRed2,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                   /* CustomNetworkImage(
                      imageUrl: AppConstants.girlsPhoto,
                      height: 140.h,
                      width: 140.w,
                      borderRadius: BorderRadius.circular(70),
                    ),*/

                     SizedBox(height: 10.h,),

                    ///================== Name ===================
                    CustomText(
                     // text: AppStrings.name,
                      text: "${editProfileController.userProfileShow.value.name}",
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                    ),

                    ///==================== Birthday===================
                     CustomText(
                   //  text: AppStrings.birthdayTitle,
                     text:editProfileController.userProfileShow.value.userData?.dateOfBirth!=null?
                     DateConverter.formattedDate2(editProfileController.userProfileShow.value.userData?.dateOfBirth):AppStrings.birthdayTitle,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white,
                    ),


                    ///====================  Mail ===================
                    CustomText(
                    //  text: AppStrings.mailTitle,
                      text: "${editProfileController.userProfileShow.value.email}",
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w300,
                      color: AppColors.white,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 88.h,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(color: AppColors.softRed),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ///==================== Kg ====================
                      CustomTitleText(
                        name: "${editProfileController.userProfileShow.value.userData?.weight==null? 0 :editProfileController.userProfileShow.value.userData?.weight} ${AppStrings.kg}",
                      //  name: AppStrings.kg,
                         title: AppStrings.weightTitle,
                        showBar: true,
                      ),
                      Container(
                        height: 60.h,
                        width: 2.w,
                        color: AppColors.white,
                      ),

                      ///==================== Age ====================
                      CustomTitleText(
                       // name: AppStrings.age,
                         name: "${editProfileController.userProfileShow.value.userData?.age==null?0:editProfileController.userProfileShow.value.userData?.age}",
                        title: AppStrings.yerar,
                        showBar: true,
                      ),
                      Container(
                        height: 60.h,
                        width: 2.w,
                        color: AppColors.white,
                      ),

                      ///==================== Kg ====================
                      CustomTitleText(
                       // name: AppStrings.cm,
                         name: "${editProfileController.userProfileShow.value.userData?.height==null?0.0:editProfileController.userProfileShow.value.userData?.height} ${AppStrings.cm}",
                        title: AppStrings.heightTitle,
                      )
                    ],
                  )
                ],
              ),
            ),

          ],
        );
      }
    );
  }
}
