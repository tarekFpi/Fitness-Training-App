// ignore_for_file: prefer_const_constructors

import 'package:fitness_training_app/core/app_routes/app_routes.dart';
import 'package:fitness_training_app/utils/app_colors/app_colors.dart';
import 'package:fitness_training_app/utils/app_strings/app_strings.dart';
import 'package:fitness_training_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:fitness_training_app/view/components/custom_button/custom_button.dart';
import 'package:fitness_training_app/view/components/custom_from_card/custom_from_card.dart';
import 'package:fitness_training_app/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:fitness_training_app/view/components/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class YourProfileScreen extends StatelessWidget {
  const YourProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(appBarContent: AppStrings.yourProfile),

        ///=========================App Bar=========================

        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomText(
                      text: AppStrings.yourProfileTitle,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.grey_1,
                    ),
                    SizedBox(
                      height: 120.h,
                    ),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [

                        Container(
                          height: MediaQuery.of(context).size.height * 0.65,
                          decoration: BoxDecoration(
                            color: AppColors.lightRed2,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                              right: 20,
                              top: 20,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ///================Full Name ================
                                CustomFormCard(
                                  hintText: AppStrings.typeHere,
                                    title: AppStrings.fullName,
                                    prefixIcon: Icon(
                                      Icons.person,
                                      color: AppColors.grey_1,
                                    ),
                                    controller: TextEditingController()),

                                ///================ Email ================
                                CustomFormCard(
                                    hintText: AppStrings.typeHere,
                                    title: AppStrings.nickname,
                                    prefixIcon: Icon(
                                      Icons.drive_file_rename_outline,
                                      color: AppColors.grey_1,
                                    ),
                                    controller: TextEditingController()),

                                ///================ Mobile Number ================
                                CustomFormCard(
                                  hintText: AppStrings.typeHere,
                                  title: AppStrings.email,
                                  prefixIcon: Icon(
                                    Icons.email,
                                    color: AppColors.grey_1,
                                  ),
                                  controller: TextEditingController(),
                                ),

                                ///================ Gender ================
                                CustomFormCard(
                                  hintText: AppStrings.typeHere,
                                  title: AppStrings.phoneNumber,
                                  prefixIcon: Icon(
                                    Icons.call,
                                    color: AppColors.grey_1,
                                  ),
                                  controller: TextEditingController(),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: -100.h,
                          right: 5.h,
                          left: 0,
                          child: Column(

                            children: [
                              Container(
                                height: 160.h,
                                width: 160.w,
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
                                    CustomNetworkImage(
                                      imageUrl:
                                      "https://static.vecteezy.com/system/resources/thumbnails/029/610/113/small/portrait-of-an-athlete-girl-in-the-gym-neural-network-ai-generated-photo.jpg",
                                      height: 160,
                                      width: 160,
                                      boxShape: BoxShape.circle,
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
                                          child: const Icon(
                                            Icons.camera_alt,
                                            size: 18,
                                            color: AppColors.lightRed2,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    CustomButton(
                      onTap: () {
                        Get.toNamed(AppRoutes.goalListScreen);
                      },
                      width: MediaQuery.sizeOf(context).width / 2,
                      fillColor: AppColors.black_60,
                      isBorder: true,
                      fontSize: 18.w,
                      borderWidth: .8,
                      textColor: AppColors.lightRed2,
                      title: AppStrings.start,
                    ),
                  ],
                ),
              ),



            ],
          ),
        ));
  }
}
