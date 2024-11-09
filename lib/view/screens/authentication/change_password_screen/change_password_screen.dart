// ignore_for_file: prefer_const_constructors

import 'package:fitness_training_app/utils/app_strings/app_strings.dart';
import 'package:fitness_training_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:fitness_training_app/view/components/custom_button/custom_button.dart';
import 'package:fitness_training_app/view/components/custom_from_card/custom_from_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarContent: AppStrings.changePassword),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 80),
        child: Column(
          children: [
            ///========================== Current Password ================
            CustomFormCard(
                hintText: AppStrings.currentPasswordHintText,
                title: AppStrings.currentPassword,
                controller: TextEditingController()),
            ///========================== New Password ===================
            CustomFormCard(
                hintText: AppStrings.newPassword,
                title: AppStrings.newPassword,
                controller: TextEditingController()),
            ///========================== Confirm Password ================
            CustomFormCard(
                hintText: AppStrings.confirmPassword,
                title: AppStrings.confirmPassword,
                controller: TextEditingController()),
            SizedBox(
              height: 30.h,
            ),
            ///========================== Change Password Button ================
            CustomButton(
              onTap: () {},
              title: AppStrings.changePassword,
            )
          ],
        ),
      ),
    );
  }
}
