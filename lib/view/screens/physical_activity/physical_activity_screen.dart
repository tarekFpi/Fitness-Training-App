// ignore_for_file: prefer_const_constructors

import 'package:fitness_training_app/core/app_routes/app_routes.dart';
import 'package:fitness_training_app/utils/ToastMsg/toast_message.dart';
import 'package:fitness_training_app/utils/app_colors/app_colors.dart';
import 'package:fitness_training_app/utils/app_strings/app_strings.dart';
import 'package:fitness_training_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:fitness_training_app/view/components/custom_button/custom_button.dart';
import 'package:fitness_training_app/view/components/custom_text/custom_text.dart';
import 'package:fitness_training_app/view/screens/authentication/registration_screen/registration_controller/registration_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
class PhysicalActivityScreen extends StatefulWidget {
    PhysicalActivityScreen({super.key});

  @override
  State<PhysicalActivityScreen> createState() => _PhysicalActivityScreenState();
}

class _PhysicalActivityScreenState extends State<PhysicalActivityScreen> {

  final RegistrationController registrationController =
  Get.find<RegistrationController>();

  final storage = GetStorage();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

   // storage.remove("physical_value");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///=========================App Bar=========================
      appBar: CustomAppBar(appBarContent: AppStrings.physicalActivityLevel,showLeading: true,),
      body: Obx(
        () {
          registrationController.physicalSelectedItem1.value;

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
                      height: 20.h,
                    ),

                    ///=========================Container Form Card=========================
                    Container(
                      height: MediaQuery.sizeOf(context).height / 2.2,
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
                            ///================beginner Name ================
                            CustomButton(
                              onTap: () {
                                registrationController.physicalSelectedItem1.value = true;
                                registrationController.physicalSelectedItem2.value = false;
                                registrationController.physicalSelectedItem3.value = false;
                                registrationController.physicalSelectedItem4.value = false;

                                storage.write("physical_value", "beginner");
                              },
                              height: 60.h,
                              title: AppStrings.beginner,
                             // fillColor: AppColors.white,
                              fillColor:registrationController.physicalSelectedItem1.value==true?Colors.orange:Colors.white,
                              textColor: AppColors.black,
                            ),
                            SizedBox(
                              height: 25.h,
                            ),


                            ///================ intermediate Name ==================
                            CustomButton(
                              onTap: () {

                                registrationController.physicalSelectedItem1.value = false;
                                registrationController.physicalSelectedItem2.value = true;
                                registrationController.physicalSelectedItem3.value = false;
                                registrationController.physicalSelectedItem4.value = false;

                                storage.write("physical_value", "intermediate");
                              },
                              height: 60.h,
                              title: AppStrings.intermediate,
                              fillColor:registrationController.physicalSelectedItem2.value==true?Colors.orange:Colors.white,
                              textColor: AppColors.black,
                            ),
                            SizedBox(
                              height: 25.h,
                            ),

                            ///================advance Name ================
                            CustomButton(
                              onTap: () {
                                registrationController.physicalSelectedItem1.value = false;
                                registrationController.physicalSelectedItem2.value = false;
                                registrationController.physicalSelectedItem3.value = true;
                                registrationController.physicalSelectedItem4.value = false;

                                storage.write("physical_value", "advanced");
                              },
                              height: 60.h,
                              title: AppStrings.advance,
                              fillColor:registrationController.physicalSelectedItem3.value==true?Colors.orange:Colors.white,
                              textColor: AppColors.black,
                            ),

                            SizedBox(
                              height: 25.h,
                            ),

                            ///================ currentLifestyle Name ================
                            CustomButton(
                              onTap: () {
                                registrationController.physicalSelectedItem1.value = false;
                                registrationController.physicalSelectedItem2.value = false;
                                registrationController.physicalSelectedItem3.value = false;
                                registrationController.physicalSelectedItem4.value = true;

                                storage.write("physical_value", "current lifestyle");
                              },
                              height: 60.h,
                              title: AppStrings.currentLifestyle,
                              fillColor:registrationController.physicalSelectedItem4.value==true?Colors.orange:Colors.white,
                              textColor: AppColors.black,
                            ),

                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),

                    ///========================= Continue Button =========================
                    CustomButton(
                      onTap: () {

                        if(storage.read("physical_value")!=null){

                          Get.toNamed(AppRoutes.yourProfileScreen);
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
