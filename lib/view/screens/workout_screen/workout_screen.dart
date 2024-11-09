// ignore_for_file: prefer_const_constructors
import 'package:fitness_training_app/core/app_routes/app_routes.dart';
import 'package:fitness_training_app/helper/time_converter/time_converter.dart';
import 'package:fitness_training_app/service/api_url.dart';
import 'package:fitness_training_app/utils/app_colors/app_colors.dart';
import 'package:fitness_training_app/utils/app_const/app_const.dart';
import 'package:fitness_training_app/utils/app_strings/app_strings.dart';
import 'package:fitness_training_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:fitness_training_app/view/components/custom_button/custom_button.dart';
import 'package:fitness_training_app/view/components/custom_text/custom_text.dart';
import 'package:fitness_training_app/view/screens/home_screen/home_controller/home_controller.dart';
import 'package:fitness_training_app/view/screens/workout_screen/inner_widget/upper_body_container.dart';
import 'package:fitness_training_app/view/screens/workout_screen/inner_widget/workout_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class WorkoutScreen extends StatelessWidget {
    WorkoutScreen({super.key});

  final HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CustomAppBar(
        appBarContent: AppStrings.workouts,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child:Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: CustomButton(
                    onTap: () {
                      Get.toNamed(AppRoutes.costomPlanScreen);
                    },
                    title: AppStrings.yourWorkoutPlan,
                    width: MediaQuery.sizeOf(context).width / 2.5,
                    height: 40.h,
                    textColor: AppColors.black,
                    fontSize: 12.sp,
                    borderRadius: 10),
              ),
              SizedBox(
                height: 10.h,
              ),
              WorkoutContainer(),
              SizedBox(
                height: 20.h,
              ),

              ///===================  workout Text ===============
              Align(
                  alignment: Alignment.topLeft,
                  child: CustomText(
                    text: AppStrings.workoutTitle,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.white,
                    textAlign: TextAlign.start,
                  )),
              SizedBox(
                height: 20.h,
              ),

              ///===================  workout Container ===============

                Column(
                  children: List.generate(homeController.workOutlist.length, (index) {

                    final model= homeController.workOutlist[index];

                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.workoutResourceScreen,
                        arguments: [
                          {
                            "uid": model.id,
                            "title":model.title,
                            "duration": model.workoutData?.duration,
                            "kcal": model.workoutData?.energy,
                            "img":
                            "${ApiUrl.imageUrl}${model.workoutData?.equipmentImg ?? ""}",
                          }
                        ],
                        );
                      },
                      child: UpperBodyContainer(
                      //  name: AppStrings.upperBody,
                        name: "${model.workoutData?.title}",
                       // minutes: AppStrings.seconds,
                      //  minutes: "${model.workoutData?.duration}",
                        minutes: DateConverter
                            .convertTimeToMinutes(
                            homeController.workOutLatest
                                ?.value?.duration ??
                                ''),
                       // kcal: AppStrings.kcal,
                        kcal: "${model.workoutData?.energy} ${AppStrings.kcal}",
                      //  exerc?ise: AppStrings.exercise,
                        exercise: "${model.workoutData?.exercises?.length} ${AppStrings.exercise}",
                        image: AppConstants.sliderImage1,
                      ),
                    );
                  }),
                )
            ],
          )
          ),
        ),

    );
  }
}
