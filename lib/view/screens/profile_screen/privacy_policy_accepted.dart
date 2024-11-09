// ignore_for_file: prefer_const_constructors

import 'package:fitness_training_app/utils/app_colors/app_colors.dart';
import 'package:fitness_training_app/utils/app_strings/app_strings.dart';
import 'package:fitness_training_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:fitness_training_app/view/components/custom_button/custom_button.dart';
import 'package:fitness_training_app/view/components/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrivacyPolicyAccepted extends StatelessWidget {
  const PrivacyPolicyAccepted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarContent: AppStrings.privacyPolicyAccept),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 80.h,
          ),

          ///==================== Privacy Policy ====================
          Center(
            child: CustomText(
              text: AppStrings.privacyPolicy,
              fontSize: 32,
              fontWeight: FontWeight.w700,
              color: AppColors.lightRed2,
            ),
          ),
          SizedBox(height: 10.h,),
          CustomText(
            text:
                "I have read and agree to Terms &\n Conditions and Privacy Policy.",
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: AppColors.white,
            maxLines: 3,
          ),
          SizedBox(height: 20.h,),
          CustomText(
            text:
                "Terms & Condition\nPrivacy Policy",
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: AppColors.lightRed2,
            maxLines: 3,
          ),
          SizedBox(height: 30.h,),
          CustomButton(
            width: 200.w,
            onTap: (){},title: AppStrings.iveAccepted,),
          SizedBox(height: 30.h,),
          CustomButton(
            width: 200.w,
            fillColor: AppColors.grey_1,
            onTap: (){},title: AppStrings.cancel,)
        ],
      ),
    );
  }
}
