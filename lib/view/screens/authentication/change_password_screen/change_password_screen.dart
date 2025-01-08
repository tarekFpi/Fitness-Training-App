// ignore_for_file: prefer_const_constructors

import 'package:fitness_training_app/utils/ToastMsg/toast_message.dart';
import 'package:fitness_training_app/utils/app_strings/app_strings.dart';
import 'package:fitness_training_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:fitness_training_app/view/components/custom_button/custom_button.dart';
import 'package:fitness_training_app/view/components/custom_from_card/custom_from_card.dart';
import 'package:fitness_training_app/view/screens/authentication/auth_controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ChangePasswordScreen extends StatelessWidget {
    ChangePasswordScreen({super.key});

  final AuthController authController = Get.find<AuthController>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarContent: AppStrings.changePassword,showLeading: true,),
      body: Obx(
         () {
          return Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 80),
            child: Column(
              children: [
                ///========================== Current Password ================
                CustomFormCard(
                    hintText: AppStrings.currentPasswordHintText,
                    title: AppStrings.currentPassword,
                    controller: authController.oldPasswordController.value),
                ///========================== New Password ===================
                CustomFormCard(
                    hintText: AppStrings.newPassword,
                    title: AppStrings.newPassword,
                    controller: authController.newPasswordController.value),
                ///========================== Confirm Password ================
                CustomFormCard(
                    hintText: AppStrings.confirmPassword,
                    title: AppStrings.confirmPassword,
                    controller: authController.comPasswordController.value),
                SizedBox(
                  height: 30.h,
                ),
                ///========================== Change Password Button ================
                CustomButton(
                  onTap: () {

                  if(authController.oldPasswordController.value.text==""){

                    showCustomSnackBar("Old password is Empty!!", isError: true);

                  }else if(authController.newPasswordController.value.text==""){

                    showCustomSnackBar("New password is Empty!!", isError: true);

                  }else if(authController.comPasswordController.value.text==""){

                    showCustomSnackBar("Confirm password is Empty!!", isError: true);

                  }else if(authController.comPasswordController.value.text != authController.newPasswordController.value.text){

                    showCustomSnackBar("Confirm password new password Not Match !!", isError: true);
                  }else{

                    authController.userPasswordChange();
                  }
                  },
                  title: AppStrings.changePassword,
                )
              ],
            ),
          );
        }
      ),
    );
  }
}
