// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:fitness_training_app/utils/app_strings/app_strings.dart';
import 'package:fitness_training_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:fitness_training_app/view/components/custom_button/custom_button.dart';
import 'package:fitness_training_app/view/components/custom_from_card/custom_from_card.dart';
import 'package:fitness_training_app/view/screens/profile_screen/inner_widget/custom_header_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarContent: AppStrings.editProfile),
      body: Column(
        children: [
          CustomHeaderContainer(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 30),
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  ///================ Full Name ================
                  CustomFormCard(
                      hintText: AppStrings.hintText,
                      title: AppStrings.fullName,
                      controller: TextEditingController()),
                  ///================ Email Name ================
                  CustomFormCard(
                      hintText: AppStrings.emailHintText,
                      title: AppStrings.email,
                      controller: TextEditingController()),
                  ///================ mobileNumber ================
                  CustomFormCard(
                      hintText: AppStrings.hindTextMobileNumber,
                      title: AppStrings.mobileNumber,
                      controller: TextEditingController()),
                  ///================ dateOfBirth ================
                  CustomFormCard(
                      hintText: AppStrings.hintTextDateOfBirth,
                      title: AppStrings.dateOfBirth,
                      controller: TextEditingController()),
                  ///================ weightTitle ================
                  CustomFormCard(
                      hintText: AppStrings.hintTextweightTitle,
                      title: AppStrings.weightTitle,
                      controller: TextEditingController()),
                  ///================ weightTitle ================
                  CustomFormCard(
                      hintText: AppStrings.hintTextHeightTitle,
                      title: AppStrings.heightTitle,
                      controller: TextEditingController()),
                  SizedBox(height: 30.h,),
                  ///======================== Update Button ================
                  CustomButton(
                      onTap: (){}, title: AppStrings.updateProfile),

                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
