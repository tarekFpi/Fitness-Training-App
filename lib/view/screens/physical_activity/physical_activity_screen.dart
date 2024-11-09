// ignore_for_file: prefer_const_constructors

import 'package:fitness_training_app/core/app_routes/app_routes.dart';
import 'package:fitness_training_app/utils/app_colors/app_colors.dart';
import 'package:fitness_training_app/utils/app_strings/app_strings.dart';
import 'package:fitness_training_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:fitness_training_app/view/components/custom_button/custom_button.dart';
import 'package:fitness_training_app/view/components/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
class PhysicalActivityScreen extends StatelessWidget {
  const PhysicalActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///=========================App Bar=========================
      appBar: CustomAppBar(appBarContent: AppStrings.physicalActivityLevel),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomText(
                    text: AppStrings.fitnessTrainingTitle,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.titleText),
                SizedBox(
                  height: 20.h,
                ),

                ///=========================Container Form Card=========================
                Container(
                  height: MediaQuery.sizeOf(context).height / 2.2,
                  decoration: BoxDecoration(
                    color: AppColors.lightRed2,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ///================beginner Name ================
                        CustomButton(
                          onTap: () {},
                          height: 60.h,
                          title: AppStrings.beginner,
                          fillColor: AppColors.white,
                          textColor: AppColors.black,
                        ),
                        SizedBox(
                          height: 25.h,
                        ),

                        ///================intermediate Name ================
                        CustomButton(
                          onTap: () {},
                          height: 60.h,
                          title: AppStrings.intermediate,
                          fillColor: AppColors.white,
                          textColor: AppColors.black,
                        ),
                        SizedBox(
                          height: 25.h,
                        ),

                        ///================advance Name ================
                        CustomButton(
                          onTap: () {},
                          height: 60.h,
                          title: AppStrings.advance,
                          fillColor: AppColors.white,
                          textColor: AppColors.black,
                        ),
                        SizedBox(
                          height: 25.h,
                        ),

                        ///================currentLifestyle Name ================
                        CustomButton(
                          onTap: () {},
                          height: 60.h,
                          title: AppStrings.currentLifestyle,
                          fillColor: AppColors.white,
                          textColor: AppColors.black,
                        ),

                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),

                ///=========================Continue Button=========================
                CustomButton(
                  onTap: () {
                    Get.toNamed(AppRoutes.homeScreen);
                  },
                  width: MediaQuery.sizeOf(context).width / 2,
                  fillColor: AppColors.black_60,
                  isBorder: true,
                  fontSize: 18.w,
                  borderWidth: .8,
                  textColor: AppColors.lightRed2,
                  title: AppStrings.continueText,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
