// ignore_for_file: prefer_const_constructors

import 'package:fitness_training_app/core/app_routes/app_routes.dart';
import 'package:fitness_training_app/utils/app_colors/app_colors.dart';
import 'package:fitness_training_app/utils/app_strings/app_strings.dart';
import 'package:fitness_training_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:fitness_training_app/view/components/custom_button/custom_button.dart';
import 'package:fitness_training_app/view/components/custom_from_card/custom_from_card.dart';
import 'package:fitness_training_app/view/components/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
class RegistrationFieldScreen extends StatelessWidget {
  const RegistrationFieldScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///=========================App Bar=========================
      appBar: CustomAppBar(appBarContent: AppStrings.register),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomText(
                    text: AppStrings.fitnessTrainingTitle,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.white),
                SizedBox(
                  height: 40.h,
                ),
                ///=========================Container Form Card=========================
                Container(
                  height: MediaQuery.sizeOf(context).height / 1.1,
                  decoration: BoxDecoration(
                    color: AppColors.lightRed,
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
                            title: AppStrings.userName,
                            prefixIcon: Icon(Icons.person,color: AppColors.grey_1,),
                            controller: TextEditingController()),
                        ///================ Email ================
                        CustomFormCard(
                            title: AppStrings.phoneNumber,
                            prefixIcon: Icon(Icons.call,color: AppColors.grey_1,),
                            controller: TextEditingController()),
                        ///================ Mobile Number ================
                        CustomFormCard(
                          title: AppStrings.email,
                          prefixIcon: Icon(Icons.email,color: AppColors.grey_1,),
                          controller: TextEditingController(),),
                        ///================ Gender ================
                        CustomFormCard(
                          title: AppStrings.gender,
                          prefixIcon: Icon(Icons.transgender,color: AppColors.grey_1,),
                          controller: TextEditingController(),),
                        ///================ Date Of Birth ================
                        CustomFormCard(
                          title: AppStrings.dateOfBirth,
                          prefixIcon: Icon(Icons.date_range,color: AppColors.grey_1,),
                          controller: TextEditingController(),),
                        ///================ password Number ================
                        CustomFormCard(
                          title: AppStrings.password2,
                          prefixIcon: Icon(Icons.password,color: AppColors.grey_1,),
                          controller: TextEditingController(),),
                        ///=============== Address ================
                        CustomFormCard(
                          title: AppStrings.address,
                          prefixIcon: Icon(Icons.map,color: AppColors.grey_1,),
                          controller: TextEditingController(),),
                        ///=============== location ================
                        CustomFormCard(
                          title: AppStrings.location,
                          prefixIcon: Icon(Icons.location_on,color: AppColors.grey_1,),
                          controller: TextEditingController(),),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                ///=========================Sign Up Button=========================
                CustomButton(
                  onTap: () {
                    Get.toNamed(AppRoutes.goalListScreen);
                  },
                  width: MediaQuery.sizeOf(context).width / 2,
                  fillColor: AppColors.black_60,
                  isBorder: true,
                  fontSize: 18.w,
                  borderWidth: .8,
                  textColor: AppColors.lightRed,
                  title: AppStrings.continueText,
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
