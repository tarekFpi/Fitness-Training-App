// ignore_for_file: prefer_const_constructors

import 'package:fitness_training_app/utils/ToastMsg/toast_message.dart';
import 'package:fitness_training_app/utils/app_colors/app_colors.dart';
import 'package:fitness_training_app/utils/app_strings/app_strings.dart';
import 'package:fitness_training_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:fitness_training_app/view/components/custom_button/custom_button.dart';
import 'package:fitness_training_app/view/components/custom_pin_code/custom_pin_code.dart';
import 'package:fitness_training_app/view/components/custom_text/custom_text.dart';
import 'package:fitness_training_app/view/screens/authentication/auth_controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../components/custom_loader/custom_loader.dart';
class SignUpVerificationScreen extends StatelessWidget {
   SignUpVerificationScreen({super.key, required this.email, required this.title});
 
 final String email ;  
 final String title;
 final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarContent: AppStrings.verification),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
        child: Obx(
       () {
            return Column(
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
                CustomPinCode(controller: authController.otpController.value),
                SizedBox(
                  height: 90.h,
                ),
            
                ///================ verifica ================
               authController.validationLoading.value ? CustomLoader() : CustomButton(
                  onTap: () { 
                    if(authController.otpController.value.text.isEmpty){
                      showCustomSnackBar(AppStrings.fieldCantBeEmpty, isError: true);
                      return ;
                    }
                   authController.validation(email: email, title: title);
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
            );
          }
        ),
      ),
    );
  }
}
