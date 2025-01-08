// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:fitness_training_app/core/app_routes/app_routes.dart';
import 'package:fitness_training_app/helper/time_converter/time_converter.dart';
import 'package:fitness_training_app/service/api_url.dart';
import 'package:fitness_training_app/utils/app_colors/app_colors.dart';
import 'package:fitness_training_app/utils/app_const/app_const.dart';
import 'package:fitness_training_app/utils/app_strings/app_strings.dart';
import 'package:fitness_training_app/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:fitness_training_app/view/components/custom_text/custom_text.dart';
import 'package:fitness_training_app/view/screens/costom_plan_screen/inner_widget/custom_plan_text.dart';
import 'package:fitness_training_app/view/screens/meal_plan_screen/inner_widget/meal_plan_image_controller.dart';
import 'package:fitness_training_app/view/screens/nutrition_screen/nutrition_controller/nutrition_controller.dart';
import 'package:fitness_training_app/view/screens/workout_screen/inner_widget/upper_body_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MealPlanScreen extends StatefulWidget {
  const MealPlanScreen({super.key});

  @override
  State<MealPlanScreen> createState() => _MealPlanScreenState();
}

class _MealPlanScreenState extends State<MealPlanScreen> {


  final MealPlanImageController mealPlanImageController = Get.find<MealPlanImageController>();

  final NutritionController controllerNutrition = Get.find<NutritionController>();

  String day="sat";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controllerNutrition.getCustomNutritionPlanDayList(day);

    mealPlanImageController.currentWeekIndex.value=0;
  }

  @override
  Widget build(BuildContext context) {

    return  Obx(
        () {
        return Padding(
          padding: const EdgeInsets.only(left: 0, right: 0,),
          child: SingleChildScrollView(
            child: Column(
              children: [

                ///================== Nutrient Week Challenge And Targeted Plan =========

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
                      /*  IconButton(
                          onPressed: () {
                            mealPlanImageController.showPopup();
                          },
                          icon: Icon(
                            Icons.add_a_photo_outlined,
                            color: AppColors.lightRed,
                          ),
                        ),*/

                        ///================== add_circle ===================
                        IconButton(
                          onPressed: () {
                            Get.toNamed(AppRoutes.RecipeMealPlanCreateScreen);
                          },
                          icon: Icon(
                            Icons.add_circle,
                            color: AppColors.lightRed,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                ///==================   weekly meal plan ===================//
                CustomPlanText(
                  items: mealPlanImageController.items,
                  currentIndex: mealPlanImageController.currentWeekIndex.value,
                  onChanged: (value) {
                    mealPlanImageController.currentWeekIndex.value = value;

                    day = mealPlanImageController.items[mealPlanImageController.currentWeekIndex.value];

                    if(mealPlanImageController.items[mealPlanImageController.currentWeekIndex.value]=="Sat"){
                      day="sat";

                    }
                    if(mealPlanImageController.items[mealPlanImageController.currentWeekIndex.value]=="Sun"){
                      day="sun";

                    }
                    if(mealPlanImageController.items[mealPlanImageController.currentWeekIndex.value]=="Mon"){
                      day="mon";
                    }
                    if(mealPlanImageController.items[mealPlanImageController.currentWeekIndex.value]=="Tue"){
                      day="tue";
                    }
                    if(mealPlanImageController.items[mealPlanImageController.currentWeekIndex.value]=="Wed"){
                      day="wed";

                    }
                    if(mealPlanImageController.items[mealPlanImageController.currentWeekIndex.value]=="Thu"){
                      day="thu";

                    }
                    if(mealPlanImageController.items[mealPlanImageController.currentWeekIndex.value]=="Fir"){
                      day="fri";
                    }

                    controllerNutrition.getCustomNutritionPlanDayList(day);
                  },
                ),

                SizedBox(
                  height: 16.h,
                ),
                ///================== Calendar ==================
                Row(
                  children: [
                    Icon(Icons.calendar_month_rounded, color: AppColors.lightRed),
                    CustomText(
                      left: 10.w,
                     // text: "Sat, 09, September,2024",
                      text: "${DateConverter.formattedDate()}",
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w300,
                      color: AppColors.white,
                    ),
                  ],
                ),
                controllerNutrition.customNutritionPlanDayList.isNotEmpty? Align(
                  alignment: Alignment.topLeft,
                  child: CustomText(
                    text: AppStrings.breakfast,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: AppColors.white,
                    bottom: 10.h,
                    top: 20.h,
                  ),
                ):Align(
                  alignment: Alignment.topLeft,
                  child: CustomText(
                    text: "Breakfast  Data is Not Available",
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: AppColors.white,
                    bottom: 10.h,
                    top: 20.h,
                  ),
                ),

                ///===================  workout Container ===============
                Column(
                  children: List.generate(controllerNutrition.customNutritionPlanDayList.length, (index) {

                    final model = controllerNutrition.customNutritionPlanDayList[index];

                    return InkWell(
                      onTap: (){
                        Get.toNamed(AppRoutes.recipeIngredientsScreen,
                            arguments: [
                              {
                                "uid": model.recipeId,
                              },
                            ]
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width,
                          height: MediaQuery.sizeOf(context).height / 6.5,
                          decoration: BoxDecoration(
                            color: AppColors.grey_3,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    SizedBox(
                                      width: 200,
                                      child: CustomText(
                                        text: "${model.recipeprogrammesData?.title}",
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.black,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30.h,
                                    ),
                                    Flexible(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          ///===================Time=================
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.access_time_filled_sharp,
                                                color: AppColors.black,
                                                size: 15,
                                              ),
                                              SizedBox(
                                                width: 5.w,
                                              ),
                                              CustomText(
                                              //  text: "${model.recipeprogrammesData?.duration}",
                                                text: DateConverter
                                                   .convertTimeToMinutes(
                                                   model.recipeprogrammesData?.duration??
                                                       ''),
                                                color: AppColors.black,
                                                fontSize: 14.sp,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 20.w,
                                          ),

                                          ///=================Kcal================
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.keyboard_command_key_rounded,
                                                color: AppColors.black,
                                                size: 15,
                                              ),
                                              SizedBox(
                                                width: 5.w,
                                              ),
                                              SizedBox(
                                                width: 50,
                                                child: CustomText(
                                                  text: "${model.recipeprogrammesData?.carbs} ${AppStrings.kcal}",
                                                  color: AppColors.black,
                                                  fontSize: 14.sp,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),

                                    ///=================Kcal================
                                    Flexible(
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.extension,
                                            color: AppColors.black,
                                            size: 15,
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          CustomText(
                                            text: "${model.recipeprogrammesData?.energy} ${AppStrings.exercise}",
                                            color: AppColors.black,
                                            fontSize: 14.sp,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),

                                ///================== Slider Image ==================
                                Flexible(
                                  child: Stack(
                                    children: [
                                      CustomNetworkImage(
                                        imageUrl: "${model.recipeprogrammesData?.img ?? ""}",
                                        width: MediaQuery.sizeOf(context).width / 2.7,
                                        height: MediaQuery.sizeOf(context).height / 5,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            bottomLeft: Radius.circular(20),
                                            topRight: Radius.circular(20),
                                            bottomRight: Radius.circular(20)),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                )
              ],
            ),
          ),
        );
      }
    );
  }
}
