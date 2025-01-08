// ignore_for_file: prefer_const_constructors

import 'package:fitness_training_app/view/components/custom_loader/custom_loader.dart';
import 'package:fitness_training_app/view/screens/authentication/auth_controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../../components/custom_app_bar/custom_app_bar.dart';
import '../../../components/custom_button/custom_button.dart';
import '../../../components/custom_from_card/custom_from_card.dart';
import '../../../components/custom_text/custom_text.dart';

class NewPasswordScreen extends StatelessWidget {
  NewPasswordScreen({super.key});

  final AuthController auth = Get.find<AuthController>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarContent: AppStrings.setPassword),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Center(
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
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
                  SizedBox(
                    height: 50.h,
                  ),
                  Container(
                    height: MediaQuery.sizeOf(context).height / 3.5,
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
                          //======================== New Password ========================
                          CustomFormCard(
                            hintText: AppStrings.passwordText,
                            title: AppStrings.password,
                            controller: auth.resetNewPasswordController.value,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return AppStrings.passwordFieldCantBeEmpty;
                              } else if (value.length < 8) {
                                return AppStrings.passwordLength;
                              }
                              return null;
                            },
                          ),
                          //======================  Confirm Password =====================
                          CustomFormCard(
                            hintText: AppStrings.passwordText,
                            title: AppStrings.confirmPassword,
                            controller:
                                auth.resetConfirmPasswordController.value,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return AppStrings.passwordFieldCantBeEmpty;
                              } else if (value.length < 8) {
                                return AppStrings.passwordLength;
                              } else if (value !=
                                  auth.resetNewPasswordController.value.text) {
                                return AppStrings.passwordNotMatch;
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  //================== Submit Button ===============
                  auth.resetPasswordLoading.value
                      ? CustomLoader()
                      : CustomButton(
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              auth.resetPassword();
                            }
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
          ),
        ),
      ),
    );
  }
}
