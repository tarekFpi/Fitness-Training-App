// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:fitness_training_app/utils/app_colors/app_colors.dart';
import 'package:fitness_training_app/utils/app_const/app_const.dart';
import 'package:fitness_training_app/utils/app_strings/app_strings.dart';
import 'package:fitness_training_app/view/components/custom_text/custom_text.dart';
import 'package:fitness_training_app/view/screens/meal_plan_screen/inner_widget/meal_plan_image_controller.dart';
import 'package:fitness_training_app/view/screens/workout_screen/inner_widget/upper_body_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MealPlanScreen extends StatelessWidget {
  const MealPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MealPlanImageController mealPlanImageController = Get.find<MealPlanImageController>();
    return  Padding(
      padding: const EdgeInsets.only(left: 0, right: 0,),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ///================== Nutrient Week Challenge And Targated Plan =========
            /*Container(
                height: 50.h,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: AppColors.grey06,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ///================== Week Challenge ===================
                    CustomText(
                      text: AppStrings.ingredients,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.black,
                    ),

                    ///================== Target Plan ===================
                    CustomText(
                      text: "Meal plan",
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.black,
                    ),
                  ],
                ),
              ),*/
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ///================== weeklyMealPlan ===================
                CustomText(
                  text: AppStrings.weeklyMealPlan,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AppColors.white,
                ),
                Row(
                  children: [
                    ///================ add_a_photo_outlined ===================
                    IconButton(
                      onPressed: () {
                        mealPlanImageController.showPopup();
                      },
                      icon: Icon(
                        Icons.add_a_photo_outlined,
                        color: AppColors.lightRed,
                      ),
                    ),
                    ///================== add_circle ===================
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.add_circle,
                        color: AppColors.lightRed,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            ///================== Calendar ==================
            Row(
              children: [
                Icon(Icons.calendar_month_rounded, color: AppColors.lightRed),
                CustomText(
                  left: 10.w,
                  text: "Sat, 09, September,2024",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w300,
                  color: AppColors.white,
                ),
              ],
            ),
            Align(
              alignment: Alignment.topLeft,
              child: CustomText(
                text: AppStrings.breakfast,
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: AppColors.white,
                bottom: 10.h,
                top: 20.h,
              ),
            ),
            ///===================  workout Container ===============
            Column(
              children: List.generate(6, (index) {
                return UpperBodyContainer(
                  name: AppStrings.upperBody,
                  minutes: AppStrings.seconds,
                  kcal: AppStrings.kcal,
                  exercise: AppStrings.exercise,
                  image: AppConstants.sliderImage1,
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
