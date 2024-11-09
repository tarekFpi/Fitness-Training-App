// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:fitness_training_app/utils/app_colors/app_colors.dart';
import 'package:fitness_training_app/utils/app_const/app_const.dart';
import 'package:fitness_training_app/utils/app_strings/app_strings.dart';
import 'package:fitness_training_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:fitness_training_app/view/components/custom_nav_bar/custom_navbar.dart';
import 'package:fitness_training_app/view/components/custom_text/custom_text.dart';
import 'package:fitness_training_app/view/screens/resources_screen/inner_widget/custom_resources_container.dart';
import 'package:fitness_training_app/view/screens/resources_screen/inner_widget/custom_resources_tab.dart';
import 'package:fitness_training_app/view/screens/resources_screen/inner_widget/custom_row_container.dart';
import 'package:fitness_training_app/view/screens/resources_screen/resources_controller/resources_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ResourcesScreen extends StatelessWidget {
  ResourcesScreen({super.key});

  final ResourcesController resourcesController =
  Get.find<ResourcesController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarContent: AppStrings.resourcesName),
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Obx(() {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ///================= Resources Tab =================
              CustomResourcesTab(
                tabNameList: resourcesController.tabNamelist,
                curentIndex: resourcesController.curentIndex.value,
                onTap: (value) {
                  resourcesController.curentIndex.value = value;
                },
                selectedTextColor: AppColors.white,
                unselectedTextColor: AppColors.lightRed2,
                unselectedTabColor: Colors.white,
                selectedTabColor: AppColors.lightRed2,
              ),

              ///================= What's Workout =================
              CustomText(
                text: AppStrings.whatWorkout,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.lightRed2,
                top: 20.h,
                bottom: 10.h,
              ),

              ///================= whatWorkoutTitle =================
              CustomText(
                text: AppStrings.whatWorkoutTitle,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColors.white,
                maxLines: 2,
                bottom: 20.h,
              ),

              ///================= CustomResourcesContainer =================
              if (resourcesController.curentIndex.value == 0)
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomResourcesContainer(),
                        CustomResourcesContainer(),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomResourcesContainer(),
                        CustomResourcesContainer(),
                      ],
                    ),
                  ],
                ),
              if (resourcesController.curentIndex.value == 1)
                Expanded(
                  child: ListView.builder(
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return CustomRowContainer(
                        name: AppStrings.strength,
                        title: AppStrings.strengthTitle,
                        image: AppConstants.sliderImage1,
                      );
                    },
                  ),
                ),
            ],
          );
        }),
      ),
      bottomNavigationBar: CustomNavbar(currentIndex: 1),
    );
  }
}

