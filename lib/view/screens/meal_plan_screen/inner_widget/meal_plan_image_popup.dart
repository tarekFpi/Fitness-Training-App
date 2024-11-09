// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:fitness_training_app/utils/app_icons/app_icons.dart';
import 'package:fitness_training_app/utils/app_strings/app_strings.dart';
import 'package:fitness_training_app/view/screens/meal_plan_screen/inner_widget/custom_image_popup.dart';
import 'package:flutter/material.dart';

class MealPlanImagePopup extends StatelessWidget {
  const MealPlanImagePopup({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomImagePopup(
      imageSrc: AppIcons.icon1,
      name: AppStrings.name,
      buttonText: AppStrings.gender,


    );
  }
}