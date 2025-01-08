// ignore_for_file: prefer_const_constructors

import 'package:fitness_training_app/core/app_routes/app_routes.dart';
import 'package:fitness_training_app/utils/app_colors/app_colors.dart';
import 'package:fitness_training_app/utils/app_strings/app_strings.dart';
import 'package:fitness_training_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:fitness_training_app/view/components/custom_button/custom_button.dart';
import 'package:fitness_training_app/view/components/custom_text/custom_text.dart';
import 'package:fitness_training_app/view/screens/home_screen/home_controller/home_controller.dart';
import 'package:fitness_training_app/view/screens/profile_screen/profile_controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart';

class PrivacyPolicyScreen extends StatefulWidget {
    PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {

  final ProfileController profileController = Get.find<ProfileController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    profileController.showPrivacyPolicyList();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarContent: AppStrings.privacyPolicy,showLeading: true,),
      body: Obx(
        () {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [


                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomText(
                      // text: AppStrings.title1,
                      text: "${parse(
                          '${profileController.privacy_policyList.value?.text}').body?.text}",
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: AppColors.white,
                      bottom: 20.h,
                      maxLines: 7,
                      textAlign: TextAlign.start,
                      top: 20.h,
                    ),
                  ),
                ),



               /* SizedBox(height: 20.h,),
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
                ),*/


                SizedBox(height: 30.h,),

             profileController.privacy_policy_acceptExist.value?.id !=null ? CustomButton(onTap: (){

                  Get.toNamed(AppRoutes.privacyPolicyAccepted,
                      arguments: [
                        {
                          "uid": profileController.privacy_policyList.value?.id,
                        },
                      ]);
                },title: AppStrings.iHaveAgreeWithThis,):SizedBox()
              ],
            ),
          );
        }
      ),

    );
  }
}
