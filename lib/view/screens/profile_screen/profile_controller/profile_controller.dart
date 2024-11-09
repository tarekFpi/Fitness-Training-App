// ignore_for_file: prefer_const_constructors
import 'package:fitness_training_app/utils/app_colors/app_colors.dart';
import 'package:fitness_training_app/view/screens/profile_screen/profile_controller/profile_popup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ProfileController extends GetxController {
  RxBool firstValue = false.obs;

  ///============ Show Family Dailog PopUp===============================
  showPopup() {
    return showDialog(
        context: Get.context!,
        builder: (_) => AlertDialog(
          backgroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12)),
          content: ProfilePopup(

          ),
        ));
  }
}