// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../../components/custom_app_bar/custom_app_bar.dart';
import '../../../components/custom_button/custom_button.dart';
import '../../../components/custom_from_card/custom_from_card.dart';
import '../../../components/custom_loader/custom_loader.dart';
import '../../../components/custom_text/custom_text.dart';
import '../auth_controller/auth_controller.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

  final AuthController authController = Get.find<AuthController>();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarContent: AppStrings.forgotPasswordTitle),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
        child: Center(
          child: Form(
            key: formKey,
            child: Obx(() {
              return Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomText(
                      text: AppStrings.emailRecover,
                      maxLines: 3,
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                      color: AppColors.titleText),
                  SizedBox(
                    height: 50.h,
                  ),
                  Container(
                    height: 150.h,
                    decoration: BoxDecoration(
                      color: AppColors.lightRed2,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ///====================== Email ========================
                          CustomFormCard(
                            hintText: AppStrings.emailHintText,
                            title: AppStrings.enterYourEmail,
                            controller:
                                authController.forgetEmailController.value,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return AppStrings.emailFieldCantBeEmpty;
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 100.h,
                  ),

                  ///====================== Continue Button ========================
               authController.forgetPasswordLoading.value ? CustomLoader() :   CustomButton(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        authController.forgetPassword();
                      }
                      //   Get.toNamed(AppRoutes.verificationScreen);
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
              );
            }),
          ),
        ),
      ),
    );
  }
}
