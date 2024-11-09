// ignore_for_file: prefer_const_constructors

import 'package:fitness_training_app/core/app_routes/app_routes.dart';
import 'package:fitness_training_app/utils/app_colors/app_colors.dart';
import 'package:fitness_training_app/utils/app_strings/app_strings.dart';
import 'package:fitness_training_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:fitness_training_app/view/components/custom_button/custom_button.dart';
import 'package:fitness_training_app/view/components/custom_pin_code/custom_pin_code.dart';
import 'package:fitness_training_app/view/components/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarContent: AppStrings.verification),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
        child: Column(
          children: [
            CustomText(
                text: AppStrings.verificationCode,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.titleText,
                maxLines: 2),

            ///================Pin Code================
            SizedBox(
              height: 90.h,
            ),
            CustomPinCode(controller: TextEditingController()),
            SizedBox(
              height: 90.h,
            ),

            ///================ verifica ================
            CustomButton(
              onTap: () {
                Get.toNamed(AppRoutes.newPasswordScreen);
              },
              width: MediaQuery.sizeOf(context).width / 2,
              fillColor: AppColors.black_60,
              isBorder: true,
              fontSize: 18.w,
              borderWidth: .8,
              textColor: AppColors.lightRed2,
              title: AppStrings.submit,
            ),
          ],
        ),
      ),
    );
  }
}
