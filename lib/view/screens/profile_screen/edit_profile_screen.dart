// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:fitness_training_app/utils/ToastMsg/toast_message.dart';
import 'package:fitness_training_app/utils/app_strings/app_strings.dart';
import 'package:fitness_training_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:fitness_training_app/view/components/custom_button/custom_button.dart';
import 'package:fitness_training_app/view/components/custom_from_card/custom_from_card.dart';
import 'package:fitness_training_app/view/screens/profile_screen/edit_profile_screen/edit_profile_controller/edit_profile_controller.dart';
import 'package:fitness_training_app/view/screens/profile_screen/inner_widget/custom_header_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EditProfileScreen extends StatefulWidget {
    EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {

    TextEditingController dateinput = TextEditingController();

  final EditProfileController editProfileController = Get.find<EditProfileController>();

    @override
    void initState() {
     // dateinput.text = ""; //set the initial value of text field
      editProfileController.dateOfBirthController.value.text= "";

      //set the initial value of text field
      editProfileController.fullNameController.value.text="${editProfileController.userProfileShow.value.name}";

      editProfileController.phoneNumberController.value.text="${editProfileController.userProfileShow.value.userData?.contactNumber==""?"":editProfileController.userProfileShow.value.userData?.contactNumber}";

      editProfileController.dateOfBirthController.value.text="${editProfileController.userProfileShow.value.userData?.dateOfBirth==null?"00-00-00":editProfileController.userProfileShow.value.userData?.dateOfBirth}";

      editProfileController.weightController.value.text="${editProfileController.userProfileShow.value.userData?.weight==""?"0.0":editProfileController.userProfileShow.value.userData?.weight}";
      editProfileController.heightController.value.text="${editProfileController.userProfileShow.value.userData?.height==""?"0.0":editProfileController.userProfileShow.value.userData?.height}";

      super.initState();
    }

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarContent: AppStrings.editProfile,showLeading: true,),
      body: Obx(
         () {
          return SingleChildScrollView(

            child: Column(
              children: [
            
                CustomHeaderContainer(),
            
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 30),
                  child: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    children: [

                      ///================ Full Name ================
                      CustomFormCard(
                          hintText: AppStrings.hintText,
                          title: AppStrings.fullName,
                          controller: editProfileController.fullNameController.value),

                        /*
                      ///================ Email Name ================
                      CustomFormCard(
                          hintText: AppStrings.emailHintText,
                          title: AppStrings.email,
                          controller: TextEditingController()),*/


                      ///================ mobileNumber ================
                      CustomFormCard(
                          hintText: AppStrings.hindTextMobileNumber,
                          title: AppStrings.mobileNumber,
                          keyboardType: TextInputType.number,
                        //  isPassword: true,
                          controller: editProfileController.phoneNumberController.value),

                      ///================ dateOfBirth ================
                      CustomFormCard(
                          hintText: AppStrings.hintTextDateOfBirth,
                          title: AppStrings.dateOfBirth,
                          onTap: () async {

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
                          hintText: AppStrings.hintTextweightTitle,
                          keyboardType: TextInputType.number,
                          title: AppStrings.weightTitle,
                          controller: editProfileController.weightController.value),

                      ///================ weightTitle ================
                      CustomFormCard(
                          hintText: AppStrings.hintTextHeightTitle,
                          keyboardType: TextInputType.number,
                          title: AppStrings.heightTitle,
                          controller: editProfileController.heightController.value),

                      SizedBox(height: 30.h,),

                      ///======================== Update Button ================
                      CustomButton(
                          onTap: (){

                            if(editProfileController.profileImage.value==""){

                              showCustomSnackBar("Image is Empty!!", isError: true);

                            }else if(editProfileController.fullNameController.value.text==""){

                            showCustomSnackBar("Full Name is Empty!!", isError: true);

                            }  else if(editProfileController.phoneNumberController.value.text==""){

                              showCustomSnackBar("Phone Number is Empty!!", isError: true);

                            }else if(editProfileController.dateOfBirthController.value.text==""){

                              showCustomSnackBar("DateOf Birth is Empty!!", isError: true);

                            }else if(editProfileController.weightController.value.text==""){

                              showCustomSnackBar("Weight is Empty!!", isError: true);

                            }else if(editProfileController.heightController.value.text==""){

                              showCustomSnackBar("Height is Empty!!", isError: true);

                            }else{

                              editProfileController.userInformationUpdate();

                            }
                          }, title: AppStrings.updateProfile),

                    ],
                  ),
                )
              ],
            ),
          );
        }
      ),
    );
  }
}
