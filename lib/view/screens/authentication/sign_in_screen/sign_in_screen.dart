// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_training_app/core/app_routes/app_routes.dart';
import 'package:fitness_training_app/utils/ToastMsg/toast_message.dart';
import 'package:fitness_training_app/utils/app_colors/app_colors.dart';
import 'package:fitness_training_app/utils/app_icons/app_icons.dart';
import 'package:fitness_training_app/utils/app_strings/app_strings.dart';
import 'package:fitness_training_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:fitness_training_app/view/components/custom_button/custom_button.dart';
import 'package:fitness_training_app/view/components/custom_from_card/custom_from_card.dart';
import 'package:fitness_training_app/view/components/custom_image/custom_image.dart';
import 'package:fitness_training_app/view/components/custom_loader/custom_loader.dart';
import 'package:fitness_training_app/view/components/custom_text/custom_text.dart';
import 'package:fitness_training_app/view/screens/authentication/auth_controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

class SignInScreen extends StatefulWidget {
  SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  final AuthController authController = Get.find<AuthController>();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  final GoogleSignIn _googleSignIn = GoogleSignIn();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarContent: AppStrings.signIn,
        showLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Obx(() {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomText(
                        text: AppStrings.welcome,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: AppColors.lightRed2),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomText(
                        text: AppStrings.welcomeTitle,
                        maxLines: 3,
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                        color: AppColors.titleText),
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                      padding: EdgeInsets.all(15.h),
                      decoration: BoxDecoration(
                        color: AppColors.lightRed2,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //=======================>> Email Field <<=====================
                            CustomFormCard(
                              hintText: AppStrings.emailHintText,
                              title: AppStrings.usernameOrEmail,
                              controller:
                                  authController.signInEmailController.value,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return AppStrings.emailFieldCantBeEmpty;
                                }
                                return null;
                              },
                            ),
                            Row(
                              children: [
                                Flexible(
                                  flex: 5,
                                  //===================>> Password Field <<===================
                                  child: CustomFormCard(
                                    hintText: AppStrings.typeHere,
                                    title: AppStrings.passwordName,
                                    controller: authController
                                        .signInPasswordController.value,
                                    isPassword: true,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return AppStrings
                                            .passwordFieldCantBeEmpty;
                                      } else if (value.length < 8) {
                                        return AppStrings.passwordLength;
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                authController.emailAndPasswordAvailable.value
                                    ? SizedBox(width: 10.w)
                                    : SizedBox(),
                                //===================>> BioMetric Field <<===================
                                authController.emailAndPasswordAvailable.value
                                    ? Padding(
                                        padding: EdgeInsets.only(top: 20.h),
                                        child: GestureDetector(
                                          onTap: () {
                                            authController.authenticate();
                                          },
                                          child: CustomImage(
                                            imageSrc: AppIcons.fingerprint,
                                            height: 50.h,
                                            imageColor: AppColors.white,
                                          ),
                                        ),
                                      )
                                    : SizedBox(),
                              ],
                            ),
                            SizedBox(height: 5.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                //===========================>> Forgot Password <<===================
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed(AppRoutes.forgotPasswordScreen);
                                  },
                                  child: CustomText(
                                    text: AppStrings.forgotPassword,
                                    color: AppColors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 30.h),
                    //=============================>> Sign In Button <<=====================
                    authController.signInLoading.value
                        ? CustomLoader()
                        : CustomButton(
                            onTap: ()   {

                              if (formKey.currentState!.validate()) {
                                 authController.signIn();
                              }

                              /// Get.offAllNamed(AppRoutes.registrationScreen);
                            },
                            width: MediaQuery.sizeOf(context).width / 2,
                            fillColor: AppColors.black_60,
                            isBorder: true,
                            fontSize: 18.w,
                            borderWidth: .8,
                            textColor: AppColors.lightRed2,
                            title: AppStrings.signIn,
                          ),


                    SizedBox(height: 20.h),
                    CustomText(
                      text: AppStrings.signUpWith,
                      color: AppColors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(height: 15.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        ///====================== >> Google and Facebook Icons << ================

                        GestureDetector(
                          onTap: () async {

                            final user = await authController.signInWithGoogle();

                            if (user != null) {

                             /// showCustomSnackBar("User signed in: ${user.uid}", isError: false);

                              authController.googleAuthLoading.value
                                  ? CustomLoader()
                                  :  authController.googleSignInApi(user.email.toString(), user.uid, user.photoURL.toString(), user.displayName.toString(), user.phoneNumber.toString());

                            } else {

                              showCustomSnackBar("Google sign-in failed", isError: true);
                            }

                          },
                            child: CustomImage(imageSrc: AppIcons.googleIcon)),
                     //   SizedBox(width: 20.w),
                       // CustomImage(imageSrc: AppIcons.facebookIcon),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          text: AppStrings.dontHaveAnAccount,
                          color: AppColors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                        ),
                        SizedBox(width: 15.w),
                        ///====================== >> Sign Up Text << ================
                        GestureDetector(
                          onTap: () {
                          Get.toNamed(AppRoutes.signUpScreen);
                          },
                          child: CustomText(
                            text: AppStrings.signUp,
                            color: AppColors.lightRed2,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
