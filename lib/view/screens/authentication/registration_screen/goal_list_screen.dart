// ignore_for_file: prefer_const_constructors

import 'package:fitness_training_app/core/app_routes/app_routes.dart';
import 'package:fitness_training_app/utils/ToastMsg/toast_message.dart';
import 'package:fitness_training_app/utils/app_colors/app_colors.dart';
import 'package:fitness_training_app/utils/app_strings/app_strings.dart';
import 'package:fitness_training_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:fitness_training_app/view/components/custom_button/custom_button.dart';
import 'package:fitness_training_app/view/components/custom_text/custom_text.dart';
import 'package:fitness_training_app/view/screens/authentication/registration_screen/registration_controller/registration_controller.dart';
import 'package:fitness_training_app/view/screens/home_screen/home_controller/home_controller.dart';
import 'package:fitness_training_app/view/screens/profile_screen/edit_profile_screen/edit_profile_controller/edit_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class GoalListScreen extends StatefulWidget {
  GoalListScreen({super.key});

  @override
  State<GoalListScreen> createState() => _GoalListScreenState();
}

class _GoalListScreenState extends State<GoalListScreen> {

  final List<bool> isSelected = List.generate(3, (index) => false);

  final RegistrationController registrationController =
      Get.find<RegistrationController>();

  final EditProfileController editProfileController =
  Get.find<EditProfileController>();

  final storage = GetStorage();


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      /// ========================= App Bar=========================
      appBar: CustomAppBar(appBarContent: AppStrings.whatIsYourGoal,showLeading: true,),
      body: Obx(
         () {

           registrationController.selectedItem1.value;

          return Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    CustomText(
                        text: AppStrings.fitnessTrainingTitle,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.titleText),

                      SizedBox(
                        height: 40.h,
                      ),

                    ///=========================Container Form Card=========================

                    Container(
                     // color:Colors.orange,
                      height: MediaQuery.sizeOf(context).height / 1.8,
                      decoration: BoxDecoration(
                        color: AppColors.lightRed2,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ///================Fix Flat Name ================
                            CustomButton(
                              onTap: () {
                               // registrationController.changedIndex(index);
                                registrationController.selectedItem1.value = true;
                                registrationController.selectedItem2.value = false;
                                registrationController.selectedItem3.value = false;
                                registrationController.selectedItem4.value = false;
                                registrationController.selectedItem5.value = false;

                                storage.write("goal_value", "fix flat");

                              },
                              title: AppStrings.fixFlatButt,
                             // fillColor: AppColors.white,
                              fillColor:registrationController.selectedItem1.value==true?Colors.orange:Colors.white,
                              textColor: AppColors.black,
                            ),
                            SizedBox(
                              height: 25.h,
                            ),

                            ///================ Build Booty Name ================
                            CustomButton(
                              onTap: () {

                                registrationController.selectedItem1.value = false;
                                registrationController.selectedItem2.value = true;
                                registrationController.selectedItem3.value = false;
                                registrationController.selectedItem4.value = false;
                                registrationController.selectedItem5.value = false;

                                storage.write("goal_value", "build");
                              },
                              title: AppStrings.buildABooty,
                              fillColor:registrationController.selectedItem2.value==true?Colors.orange:Colors.white,
                            //  fillColor: AppColors.white,
                              textColor: AppColors.black,
                            ),
                            SizedBox(
                              height: 25.h,
                            ),

                            ///================All Over Name ================
                            CustomButton(
                              onTap: () {

                                registrationController.selectedItem1.value = false;
                                registrationController.selectedItem2.value = false;
                                registrationController.selectedItem3.value = true;
                                registrationController.selectedItem4.value = false;
                                registrationController.selectedItem5.value = false;

                                storage.write("goal_value", "all over muscle");
                              },
                              title: AppStrings.allOverMuscleGain,
                             // fillColor: AppColors.white,
                              fillColor:registrationController.selectedItem3.value==true?Colors.orange:Colors.white,
                              textColor: AppColors.black,
                            ),
                            SizedBox(
                              height: 25.h,
                            ),

                            ///================loseWeightAndTone Name ================
                            CustomButton(
                              onTap: () {
                                registrationController.selectedItem4.value = true;
                                registrationController.selectedItem1.value = false;
                                registrationController.selectedItem2.value = false;
                                registrationController.selectedItem3.value = false;
                                registrationController.selectedItem4.value = true;
                                registrationController.selectedItem5.value = false;

                                storage.write("goal_value", "lose weight");
                              },
                              title: AppStrings.loseWeightAndTone,
                             // fillColor: AppColors.white,
                              fillColor:registrationController.selectedItem4.value==true?Colors.orange:Colors.white,
                              textColor: AppColors.black,
                            ),
                            SizedBox(
                              height: 25.h,
                            ),

                            ///================premiumMembership  Name ================

                            CustomButton(
                              onTap: () {

                                registrationController.selectedItem5.value = true;
                                registrationController.selectedItem1.value = false;
                                registrationController.selectedItem2.value = false;
                                registrationController.selectedItem3.value = false;
                                registrationController.selectedItem4.value = false;

                                storage.write("goal_value", "muscle_gain");
                              },
                              title: AppStrings.premiumMembership,
                             // fillColor: AppColors.white,
                              fillColor:registrationController.selectedItem5.value == true?Colors.orange:Colors.white,
                              textColor: AppColors.black,
                            ),
                          ],
                        ),
                      ),



                      /*Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GetBuilder<RegistrationController>(builder: (c) {
                                  return ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    itemCount: 3,
                                    physics: const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return CustomButton(
                                        onTap: () {
                                          registrationController.changedIndex(index);
                                        },
                                        title: AppStrings.fixFlatButt,
                                        fillColor: registrationController
                                                .isSelectedItems[index]
                                            ? AppColors.white
                                            : AppColors.grey_1,
                                        textColor: AppColors.black,
                                      );
                                    },
                                  );
                                }),
                              ]),*/

                    ),
                    SizedBox(
                      height: 50.h,
                    ),

                    ///=========================Continue Button=========================
                    CustomButton(
                      onTap: () {

                        if(storage.read("goal_value")!=null){
                          Get.toNamed(AppRoutes.physicalActivityScreen);
                        }else{
                          showCustomSnackBar("Please Select your value ??", isError: true);
                        }

                      },
                      width: MediaQuery.sizeOf(context).width / 2,
                      fillColor: AppColors.black_60,
                      isBorder: true,
                      fontSize: 18.w,
                      borderWidth: .8,
                      textColor: AppColors.lightRed2,
                      title: AppStrings.continueText,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
