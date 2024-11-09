// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:fitness_training_app/utils/app_const/app_const.dart';
import 'package:fitness_training_app/utils/app_icons/app_icons.dart';
import 'package:fitness_training_app/view/components/custom_image/custom_image.dart';
import 'package:fitness_training_app/view/components/custom_text_field/custom_text_field.dart';
import 'package:fitness_training_app/view/screens/workout_screen/inner_widget/upper_body_container.dart';
import 'package:fitness_training_app/view/screens/notification_screen/inner_widget.dart/custom_notification_tab.dart';
import 'package:fitness_training_app/view/screens/notification_screen/notification_controller/notification_controller.dart';
import 'package:fitness_training_app/view/screens/search_screen/inner_widget/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../utils/app_colors/app_colors.dart';
import '../../../utils/app_strings/app_strings.dart';
import '../../components/custom_app_bar/custom_app_bar.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final NotificationController notificationController =
      Get.find<NotificationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          appBarContent: AppStrings.search,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w),
          child: Obx(
          () {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 20.h), 
                    //================== Search Text Field =================
                    CustomTextField(
                      textEditingController: TextEditingController(),
                      fillColor: AppColors.white,
                      hintText: AppStrings.search,
                      suffixIcon: const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: CustomImage(imageSrc: AppIcons.search),
                      ),
                      isDens: true,
                    ),
                    SizedBox(height: 20.h), 
                  //  ======================== Tab ========================
                    CustomNotificationTab(
                        width: 100.w,
                      tabNameList: notificationController.searchList,
                      curentIndex: notificationController.curentIndex.value,
                      onTap: (value){
                        notificationController.curentIndex.value = value;
                      },
                      selectedTextColor: AppColors.white,
                    unselectedTextColor: AppColors.lightRed2,
                    unselectedTabColor: Colors.white,
                    selectedTabColor: AppColors.lightRed2,
                    ),
                   SizedBox(height: 30.h,),
                   ///================= Search Container =================
                    if (notificationController.curentIndex.value == 0)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // You might have Flexible or Expanded incorrectly here
                          Expanded(child: CustomSearchContainer()), // Ensure Flexible/Expanded is used inside Row/Column
                          Expanded(child: CustomSearchContainer()),
                        ],
                      ),
                    SizedBox(height: 10.h,),
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
                    if (notificationController.curentIndex.value == 1)
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
                    if (notificationController.curentIndex.value == 2)
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
                  ],
                ),
              );
            }
          ),
        ));
  }
}
