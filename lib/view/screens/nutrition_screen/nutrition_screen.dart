// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:fitness_training_app/utils/app_colors/app_colors.dart';
import 'package:fitness_training_app/utils/app_strings/app_strings.dart';
import 'package:fitness_training_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:fitness_training_app/view/components/custom_text/custom_text.dart';
import 'package:fitness_training_app/view/screens/meal_plan_screen/meal_plan_screen.dart';
import 'package:fitness_training_app/view/screens/nutrition_screen/inner_widget/custom_card.dart';
import 'package:fitness_training_app/view/screens/nutrition_screen/inner_widget/custom_nutrition_container.dart';
import 'package:fitness_training_app/view/screens/nutrition_screen/nutrition_controller/nutrition_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NutritionScreen extends StatelessWidget {
  NutritionScreen({super.key});
  final NutritionController controller = Get.find<NutritionController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarContent: AppStrings.nutrition),
      body: Obx(
              () {
          return Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 8.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ///================== Nutrient Week Challenge And Targated Plan =========
                  Container(
                    height: 50.h,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: AppColors.grey06,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:
                            List.generate(controller.tabNamelist.length, (index) {
                          return GestureDetector(
                            onTap: (){
                              controller.currentIndex.value = index;
                              controller.update();
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width / 2.4,
                            //  height: 50.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                color: controller.currentIndex.value == index
                                    ? AppColors.lightRed2
                                    : AppColors.grey06,
                              ),
                              child: CustomText(
                                text: controller.tabNamelist[index],
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.black,
                              ),
                            ),
                          );
                        })),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  if (controller.currentIndex.value == 0)
                  ///==============NEw Recipes ===============
                    Align(
                    alignment: Alignment.topLeft,
                    child: CustomText(
                      text: AppStrings.newRecipes,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: AppColors.white,
                      bottom: 20.h,
                    ),
                  ),
                  ///=============== Nutrition Container ========
                  if (controller.currentIndex.value == 0)
                    CustomNutritionContainer(),

                  ///============== breakfast===============
                  if (controller.currentIndex.value == 0) Align(
                    alignment: Alignment.topLeft,
                    child: CustomText(
                      text: AppStrings.breakfast,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: AppColors.white,
                      bottom: 10.h,
                      top: 15.h,
                    ),
                  ),

                  ///============ Custom Container Card Image====
                  if (controller.currentIndex.value == 0)
                    SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        children: List.generate(5, (index) {
                      return CustomCard();
                    })),
                  ),
                  ///============== lunch ===============
                  if (controller.currentIndex.value == 0) Align(
                    alignment: Alignment.topLeft,
                    child: CustomText(
                      text: AppStrings.lunch,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: AppColors.white,
                      bottom: 20.h,
                      top: 15.h,
                    ),
                  ),

                  ///============ Custom Container Card Image====
                  if (controller.currentIndex.value == 0) SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        children: List.generate(5, (index) {
                      return CustomCard();
                    })),
                  ),

                  ///============== snacks ===============
                  if (controller.currentIndex.value == 0) Align(
                    alignment: Alignment.topLeft,
                    child: CustomText(
                      text: AppStrings.snacks,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: AppColors.white,
                      bottom: 10.h,
                      top: 15.h,
                    ),
                  ),

                  ///============ Custom Container Card Image====
                  if (controller.currentIndex.value == 0) SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        children: List.generate(5, (index) {
                      return CustomCard();
                    })),
                  ),

                  ///============== dinner  ===============
                  if (controller.currentIndex.value == 0) Align(
                    alignment: Alignment.topLeft,
                    child: CustomText(
                      text: AppStrings.dinner,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: AppColors.white,
                      bottom: 10.h,
                      top: 15.h,
                    ),
                  ),

                  ///============ Custom Container Card Image====
                  if (controller.currentIndex.value == 0)  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        children: List.generate(5, (index) {
                      return CustomCard();
                    })),
                  ),
                  if (controller.currentIndex.value == 1)  MealPlanScreen(),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
