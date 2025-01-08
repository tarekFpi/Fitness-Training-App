// ignore_for_file: prefer_const_constructors

import 'package:fitness_training_app/core/app_routes/app_routes.dart';
import 'package:fitness_training_app/utils/app_colors/app_colors.dart';
import 'package:fitness_training_app/utils/app_strings/app_strings.dart';
import 'package:fitness_training_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:fitness_training_app/view/components/custom_button/custom_button.dart';
import 'package:fitness_training_app/view/components/custom_text/custom_text.dart';
import 'package:fitness_training_app/view/screens/profile_screen/profile_controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PrivacyPolicyAccepted extends StatefulWidget {
  const PrivacyPolicyAccepted({super.key});

  @override
  State<PrivacyPolicyAccepted> createState() => _PrivacyPolicyAcceptedState();
}

class _PrivacyPolicyAcceptedState extends State<PrivacyPolicyAccepted> {

  var argumentData = Get.arguments;

  String uId = "";

  final ProfileController profileController = Get.find<ProfileController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if(argumentData[0]["uid"]!=""){

      uId = argumentData[0]["uid"];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarContent: AppStrings.privacyPolicyAccept,showLeading: true,),
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
                "Terms & Condition\nPrivacy Policy // ${uId}",
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: AppColors.lightRed2,
            maxLines: 3,
          ),
          SizedBox(height: 30.h,),
          CustomButton(
            width: 200.w,
            onTap: (){

              profileController.privacy_policyAcceptInsert(uId);

            },title: AppStrings.iveAccepted,),
          SizedBox(height: 30.h,),
          CustomButton(
            width: 200.w,
            fillColor: AppColors.grey_1,
            onTap: (){

              Get.toNamed(AppRoutes.profileScreen);

            },title: AppStrings.cancel,)
        ],
      ),
    );
  }
}
