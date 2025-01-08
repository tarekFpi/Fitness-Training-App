// ignore_for_file: prefer_const_constructors

import 'package:fitness_training_app/utils/app_colors/app_colors.dart';
import 'package:fitness_training_app/utils/app_icons/app_icons.dart';
import 'package:fitness_training_app/utils/app_strings/app_strings.dart';
import 'package:fitness_training_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:fitness_training_app/view/components/custom_button/custom_button.dart';
import 'package:fitness_training_app/view/components/custom_image/custom_image.dart';
import 'package:fitness_training_app/view/components/custom_text/custom_text.dart';
import 'package:fitness_training_app/view/screens/authentication/sign_up_screen/finger_screen/test_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
class FingerScreen extends StatelessWidget {
  const FingerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarContent: AppStrings.setFingerprint),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Center(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomText(
                    text: AppStrings.setPasswordTitle,
                    maxLines: 3,
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: AppColors.titleText),
                Container(
                  height: MediaQuery.sizeOf(context).height /2,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                    //color: AppColors.lightRed,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: CustomImage(
                        imageSrc: AppIcons.fingerprint2,height: 80.h,width: 80.w,),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                /// ======================== Continue Button ===========================
                CustomButton(
                  onTap: () { 
                    Get.to(()=> MyApp());
                  //  Get.toNamed(AppRoutes.signInScreen);
                  },
                  width: MediaQuery.sizeOf(context).width / 2,
                  fontSize: 18.w,
                  height: 50.h,
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
