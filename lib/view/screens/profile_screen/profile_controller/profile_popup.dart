// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:fitness_training_app/utils/app_icons/app_icons.dart';
import 'package:fitness_training_app/utils/app_strings/app_strings.dart';
import 'package:fitness_training_app/view/screens/profile_screen/profile_controller/custom_profile_popup.dart';
import 'package:flutter/material.dart';

class ProfilePopup extends StatelessWidget {
  const ProfilePopup({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomProfilePopup(
      imageSrc: AppIcons.logout,
      name: AppStrings.logoutTitle,
      buttonText: AppStrings.logOutName,
      cancelButton: AppStrings.cancel,

    );
  }
}