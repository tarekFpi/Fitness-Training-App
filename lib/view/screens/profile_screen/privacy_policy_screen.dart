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

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarContent: AppStrings.privacyPolicy),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomText(
                text:
                    "Your privacy is important to us. It is Brainstorming's policy to respect your privacy regarding any information we may collect from you across our website, and other sites we own and operate.",
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.white,
                maxLines: 8,
              ),
              SizedBox(height: 20.h,),
              CustomText(
                text:
                    "We only ask for personal information when we truly need it to provide a service to you. We collect it by fair and lawful means, with your knowledge and consent. We also let you know why we’re collecting it and how it will be used.",
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.white,
                maxLines: 8,
              ),
              SizedBox(height: 20.h,),
              CustomText(
                text:
                "We only ask for personal information when we truly need it to provide a service to you. We collect it by fair and lawful means, with your knowledge and consent. We also let you know why we’re collecting it and how it will be used.",
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.white,
                maxLines: 8,
              ),
              SizedBox(height: 20.h,),
              CustomText(
                text:
                "We only ask for personal information when we truly need it to provide a service to you. We collect it by fair and lawful means, with your knowledge and consent. We also let you know why we’re collecting it and how it will be used.",
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.white,
                maxLines: 8,
              ),
              SizedBox(height: 30.h,),
              CustomButton(onTap: (){
                Get.toNamed(AppRoutes.privacyPolicyAccepted);
              },title: AppStrings.iHaveAgreeWithThis,)
            ],
          ),
        ),
      ),
    );
  }
}
