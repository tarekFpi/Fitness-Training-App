// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:fitness_training_app/core/app_routes/app_routes.dart';
import 'package:fitness_training_app/view/components/custom_loader/custom_loader.dart';
import 'package:fitness_training_app/view/screens/authentication/auth_controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_icons/app_icons.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../../components/custom_app_bar/custom_app_bar.dart';
import '../../../components/custom_button/custom_button.dart';
import '../../../components/custom_from_card/custom_from_card.dart';
import '../../../components/custom_image/custom_image.dart';
import '../../../components/custom_text/custom_text.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final AuthController authController = Get.find<AuthController>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///=========================App Bar=========================
      appBar: CustomAppBar(appBarContent: AppStrings.createAccountName),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: SingleChildScrollView(
          child: Center(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ///=========================Container Form Card=========================
                  Container(
                    height: MediaQuery.sizeOf(context).height / 1.6,
                    decoration: BoxDecoration(
                      color: AppColors.lightRed2.withOpacity(1),
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
                          ///================Full Name ================
                          CustomFormCard(
                            hintText: AppStrings.fullNameHint,
                            title: AppStrings.fullName,
                            controller: authController.fullNameController.value,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return AppStrings.fieldCantBeEmpty;
                              }
                              return null;
                            },
                          ),

                          ///================ Email ================
                          CustomFormCard(
                            hintText: AppStrings.emailHintText,
                            title: AppStrings.email,
                            controller: authController.emailController.value,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return AppStrings.emailFieldCantBeEmpty;
                              }
                              return null;
                            },
                          ),

                          ///================ Mobile Number ================
                          CustomFormCard(
                            hintText: AppStrings.typeHere,
                            title: AppStrings.passwordName,
                            controller: authController.passwordController.value,
                            isPassword: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return AppStrings.passwordFieldCantBeEmpty;
                              } else if (value.length < 8) {
                                return AppStrings.passwordLength;
                              }
                              return null;
                            },
                          ),

                          ///================ Membership Number ================
                          CustomFormCard(
                            hintText: AppStrings.typeHere,
                            title: AppStrings.confirmPassword,
                            controller:
                                authController.confirmPasswordController.value,
                            isPassword: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return AppStrings.passwordFieldCantBeEmpty;
                              } else if (value.length < 8) {
                                return AppStrings.passwordLength;
                              } else if (value !=
                                  authController
                                      .passwordController.value.text) {
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
                    height: 20.h,
                  ),
                  CustomText(
                    text: AppStrings.byContinuing,
                    color: AppColors.white,
                    fontSize: 14,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ///====================Terms & Conditions ====================
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutes.privacyPolicyScreen);
                        },
                        child: CustomText(
                          text: AppStrings.terms,
                          color: AppColors.lightRed2,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),

                      ///====================And ====================
                      CustomText(
                        text: AppStrings.and,
                        color: AppColors.white,
                        fontSize: 14,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),

                      ///====================Privacy Policy ====================
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutes.privacyPolicyScreen);
                        },
                        child: CustomText(
                          text: AppStrings.privacyPolicy,
                          color: AppColors.lightRed2,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 20.h,
                  ),


                 // /=========================Add Fingerprint Button=========================
                /*  CustomButton(
                    onTap: () {
                      Get.toNamed(AppRoutes.fingerScreen);
                    },
                    width: MediaQuery.sizeOf(context).width / 2,
                    fontSize: 18.w,
                    height: 48.h,
                    title: AppStrings.addFingerprint,
                  ),*/
                  SizedBox(
                    height: 15.h,
                  ),

                  ///=========================Sign Up Button=========================
                  Obx(() {
                    return authController.signUpLoading.value
                        ? CustomLoader()
                        : CustomButton(
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                authController.signUp();
                              }
                  
                            },
                            width: MediaQuery.sizeOf(context).width / 2,
                            fillColor: AppColors.black_60,
                            height: 48.h,
                            isBorder: true,
                            fontSize: 18.w,
                            borderWidth: .8,
                            textColor: AppColors.lightRed2,
                            title: AppStrings.signUp,
                          );
                  }),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomText(
                      text: AppStrings.signUpWith,
                      color: AppColors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                  SizedBox(
                    height: 15.h,
                  ),

                  ///=========================Social Icon=========================
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomImage(imageSrc: AppIcons.googleIcon),
                      SizedBox(
                        width: 20.w,
                      ),
                    //  CustomImage(imageSrc: AppIcons.facebookIcon),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),

                  ///========================= Already Have An Account =========================

                  GestureDetector(
                    onTap: (){

                    Get.toNamed(AppRoutes.signInScreen);

                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        CustomText(
                            text: AppStrings.alreadyHaveAnAccount,
                            color: AppColors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w300),

                        SizedBox(
                          width: 15.w,
                        ),

                        CustomText(
                            text: AppStrings.signIn,
                            color: AppColors.lightRed2,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
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
