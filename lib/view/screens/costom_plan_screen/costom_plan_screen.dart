// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:fitness_training_app/utils/app_colors/app_colors.dart';
import 'package:fitness_training_app/utils/app_const/app_const.dart';
import 'package:fitness_training_app/utils/app_strings/app_strings.dart';
import 'package:fitness_training_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:fitness_training_app/view/components/custom_button/custom_button.dart';
import 'package:fitness_training_app/view/components/custom_text/custom_text.dart';
import 'package:fitness_training_app/view/screens/costom_plan_screen/custom_plan_controller/custom_plan_controller.dart';
import 'package:fitness_training_app/view/screens/costom_plan_screen/inner_widget/custom_click_box.dart';
import 'package:fitness_training_app/view/screens/costom_plan_screen/inner_widget/custom_plan_text.dart';
import 'package:fitness_training_app/view/screens/workout_screen/inner_widget/upper_body_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CostomPlanScreen extends StatelessWidget {
  CostomPlanScreen({super.key});
  final CustomPlanController controller = Get.find<CustomPlanController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarContent: AppStrings.customPlan),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 8.0),
        child: SingleChildScrollView(
          child: Obx(() {
            return Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                          onTap: () {
                            controller.currentIndex.value = index;
                            controller.update();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width / 2.4,
                            //  height: 50.h,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: controller.currentIndex.value == index
                                  ? AppColors.lightRed2
                                  : AppColors.grey06,
                            ),
                            child: CustomText(
                              text: controller.tabNamelist[index],
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black,
                            ),
                          ),
                        );
                      })),
                ),
                SizedBox(
                  height: 20.h,
                ),

                ///================== Customize Your Plan ===================
                CustomText(
                  bottom: 10,
                  text: AppStrings.customizeYour,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.white,
                ),

                ///================== Tailor ===================
                CustomText(
                  bottom: 10,
                  text: AppStrings.tailor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w300,
                  color: AppColors.grey_1,
                ),
                Row(
                  children: List.generate(6, (index) {
                    return CustomPlanText(
                      text: AppStrings.week1,
                    );
                  }),

                  /* SizedBox(
                        height: 8.h,
                      ),
                      Container(
                        height: .3.h,
                        width: 50.w,
                        color: AppColors.lightRed2,
                      )*/
                ),

                ///================== Fitness Goal ===================
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: AppStrings.fitnessGoal,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.delete,
                          color: AppColors.lightRed2,
                        ))
                  ],
                ),

                ///================== Click Box ===================
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomClickBox(
                      text: AppStrings.loseWeight,
                    ),
                    CustomClickBox(
                      text: AppStrings.fullBodyStrecthing,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomClickBox(
                      text: AppStrings.weightGain,
                    ),
                    CustomClickBox(
                      text: AppStrings.fullBodyStrecthing,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomClickBox(
                      text: AppStrings.loseWeight,
                    ),
                    CustomClickBox(
                      text: AppStrings.fullBodyStrecthing,
                    )
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomText(
                  bottom: 20,
                  text: AppStrings.workoutType,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.white,
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
                ),
                SizedBox(
                  height: 20.h,
                ),
                Center(
                  child: CustomButton(
                    width: 200.w,
                    onTap: () {},
                    title: AppStrings.saveChange,
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
