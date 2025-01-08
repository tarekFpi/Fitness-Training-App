// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:fitness_training_app/core/app_routes/app_routes.dart';
import 'package:fitness_training_app/service/api_url.dart';
import 'package:fitness_training_app/utils/ToastMsg/toast_message.dart';
import 'package:fitness_training_app/utils/app_colors/app_colors.dart';
import 'package:fitness_training_app/utils/app_const/app_const.dart';
import 'package:fitness_training_app/utils/app_strings/app_strings.dart';
import 'package:fitness_training_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:fitness_training_app/view/components/custom_button/custom_button.dart';
import 'package:fitness_training_app/view/components/custom_from_card/custom_from_card.dart';
import 'package:fitness_training_app/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:fitness_training_app/view/components/custom_text/custom_text.dart';
import 'package:fitness_training_app/view/screens/authentication/registration_screen/registration_controller/registration_controller.dart';
import 'package:fitness_training_app/view/screens/profile_screen/edit_profile_screen/edit_profile_controller/edit_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

class YourProfileScreen extends StatefulWidget {
    YourProfileScreen({super.key});

  @override
  State<YourProfileScreen> createState() => _YourProfileScreenState();
}

class _YourProfileScreenState extends State<YourProfileScreen> {

    final EditProfileController editProfileController = Get.find<EditProfileController>();

    final RegistrationController registrationController = Get.find<RegistrationController>();

    final storage = GetStorage();

    @override
    void initState() {

      /// dateinput.text = ""; //set the initial value of text field

      editProfileController.dateOfBirthController.value.text= "";

      super.initState();
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(appBarContent: AppStrings.yourProfile,showLeading: true,),

        ///========================= Apps Bar =========================

        body: SingleChildScrollView(
          child: Obx(
            () {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        SizedBox(
                          height: 10.h,
                        ),
                        CustomText(
                          text: AppStrings.yourProfileTitle,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.grey_1,
                        ),
                        SizedBox(
                          height: 120.h,
                        ),
                        Stack(
                          clipBehavior: Clip.none,
                          children: [

                            Container(
                              height: MediaQuery.of(context).size.height * 0.60,
                              decoration: BoxDecoration(
                                color: AppColors.lightRed2,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 20,
                                  right: 20,
                                  top: 20,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [

                                    ///================Full Name ================
                                    CustomFormCard(
                                      hintText: AppStrings.fullName,
                                        title: AppStrings.fullName,
                                        prefixIcon: Icon(
                                          Icons.person,
                                          color: AppColors.grey_1,
                                        ),
                                        controller: registrationController.fullNameController.value),


                                    ///================ dateOfBirth ================
                                    CustomFormCard(
                                        hintText: AppStrings.hintTextDateOfBirth,
                                        title: AppStrings.dateOfBirth,
                                        onTap: ()async {

                                          DateTime? pickedDate = await showDatePicker(
                                              context: context, initialDate: DateTime.now(),
                                              firstDate: DateTime(1900), //DateTime.now() - not to allow to choose before today.
                                              lastDate: DateTime.now()
                                          );

                                          if(pickedDate != null ){
                                            print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
                                            String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                                            // print("formattedDate:${formattedDate}"); //formatted date output using intl package =>  2021-03-16

                                            setState(() {
                                              // dateinput.text = formattedDate; //set output date to TextField value.

                                              editProfileController.dateOfBirthController.value.text = formattedDate; //set output date to TextField value.
                                            });
                                          }else{
                                            debugPrint("Date is not selected");
                                          }
                                        },
                                        controller: editProfileController.dateOfBirthController.value),


                                    ///================ weightTitle ================
                                    CustomFormCard(
                                        keyboardType: TextInputType.number,
                                        hintText: AppStrings.hintTextweightTitle,
                                        title: AppStrings.weightTitle,

                                        controller: registrationController.weightController.value),


                                    ///================ phone number ================
                                    CustomFormCard(
                                      hintText: AppStrings.typeHere,
                                      title: AppStrings.phoneNumber,
                                      keyboardType: TextInputType.number,
                                      prefixIcon: Icon(
                                        Icons.call,
                                        color: AppColors.grey_1,
                                      ),
                                      controller:registrationController.phoneNumberController.value,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              top: -100.h,
                              right: 5.h,
                              left: 0,
                              child: Column(

                                children: [
                                  Container(
                                    height: 140.h,
                                    width: 140.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      border: Border.all(width: 5, color: AppColors.white),
                                      boxShadow: [
                                        BoxShadow(
                                          spreadRadius: 2,
                                          blurRadius: 10,
                                          color: AppColors.black.withOpacity(0.1),
                                        ),
                                      ],
                                    ),
                                    child: Stack(
                                      children: [

                                        registrationController.profileImage.value == "" ?
                                        CustomNetworkImage(
                                          imageUrl:
                                          AppConstants.profileimage,
                                          height: 140.h,
                                          width: 140.w,
                                          boxShape: BoxShape.circle,
                                        ): Container(
                                          height: 140.h,
                                          width: 140.w,decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              //  image: FileImage(editProfileController.profileImage.value),
                                              image: FileImage(File(registrationController.profileImage.value)),
                                              fit: BoxFit.cover,
                                            )
                                        ),
                                        ),


                                    /*    CustomNetworkImage(
                                          imageUrl:
                                         "https://static.vecteezy.com/system/resources/thumbnails/029/610/113/small/portrait-of-an-athlete-girl-in-the-gym-neural-network-ai-generated-photo.jpg",
                                          height: 160,
                                          width: 160,
                                          boxShape: BoxShape.circle,
                                        ),*/

                                        Positioned(
                                          bottom: 5,
                                          right: 5,
                                          child: GestureDetector(
                                            onTap: () {
                                              registrationController.getImage();
                                            },
                                            child: Container(
                                              height: 30,
                                              width: 30,
                                              decoration: BoxDecoration(
                                                  color: AppColors.white, shape: BoxShape.circle),
                                              child: const Icon(
                                                Icons.camera_alt,
                                                size: 18,
                                                color: AppColors.lightRed2,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        CustomButton(
                          onTap: () {

                          //  Get.toNamed(AppRoutes.goalListScreen);

                         /*   if(registrationController.profileImage.value==""){

                              showCustomSnackBar("Image is Empty!!", isError: true);

                            }else if(registrationController.fullNameController.value.text==""){

                              showCustomSnackBar("Full Name is Empty!!", isError: true);

                            }  else if(registrationController.phoneNumberController.value.text==""){

                              showCustomSnackBar("Phone Number is Empty!!", isError: true);

                            }else if(registrationController.dateOfBirthController.value.text==""){

                              showCustomSnackBar("DateOf Birth is Empty!!", isError: true);

                            }else if(registrationController.weightController.value.text==""){

                              showCustomSnackBar("Weight is Empty!!", isError: true);

                            }else if(registrationController.heightController.value.text==""){

                              showCustomSnackBar("Height is Empty!!", isError: true);

                            }else{

                              String  goal_value = storage.read("goal_value");
                              String physical_value =  storage.read("physical_value");

                              registrationController.userInformationUpdate(goal_value, physical_value);
                            }*/

                            String  goal_value = storage.read("goal_value");
                            String physical_value =  storage.read("physical_value");

                            registrationController.userInformationUpdate(goal_value, physical_value);

                          },
                          width: MediaQuery.sizeOf(context).width / 2,
                          fillColor: AppColors.black_60,
                          isBorder: true,
                          fontSize: 18.w,
                          borderWidth: .8,
                          textColor: AppColors.lightRed2,
                          title: AppStrings.start,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 12,
                  )
                ],
              );
            }
          ),
        ));
  }
}
