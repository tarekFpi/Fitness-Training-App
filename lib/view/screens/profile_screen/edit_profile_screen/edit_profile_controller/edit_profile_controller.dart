import 'dart:convert';
import 'dart:io';

import 'package:fitness_training_app/helper/shared_prefe/shared_prefe.dart';
import 'package:fitness_training_app/service/api_check.dart';
import 'package:fitness_training_app/service/api_client.dart';
import 'package:fitness_training_app/service/api_url.dart';
import 'package:fitness_training_app/utils/ToastMsg/toast_message.dart';
import 'package:fitness_training_app/utils/app_const/app_const.dart';
import 'package:fitness_training_app/utils/app_strings/app_strings.dart';
import 'package:fitness_training_app/view/screens/profile_screen/edit_profile_screen/userProfile_show_model/userProfileResponseModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileController extends GetxController{
  RxBool firstValue = false.obs;
  //===================================== Get Profile Image ==================================

 /* Rx<File?> profileImage = Rx<File?>(null); // Initialize Rx variable properly

  Future<void> getFileImage() async {
    debugPrint("=============================> image Click");

    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image != null) {
      debugPrint("=============================> image path ${image.path}");
      profileImage.value = File(image.path); // Automatically triggers UI update
    }
  }*/

  final ImagePicker _picker = ImagePicker();
  //File? imagePath;
  var profileImage = "".obs;

  Future<void> getImage() async {
    try {
      final XFile? pickedFile =
      await _picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        // Convert XFile to File if needed

        profileImage.value = pickedFile.path; // Ensure the file path is valid
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }




  ///======================================>> users-profile-show <<================================

  Rx<UserProfileResponseModel> userProfileShow = UserProfileResponseModel().obs;


  Future<void> userInformationShow() async {

    EasyLoading.show(dismissOnTap: false, maskType: EasyLoadingMaskType.custom);

    var response = await ApiClient.getData(ApiUrl.userProfile);

    if (response.statusCode == 200) {

      userProfileShow.value = UserProfileResponseModel.fromJson(response.body["data"]);

      debugPrint("${userProfileShow.value}");

      debugPrint("userProfileResponseModel:${userProfileShow.value.toJson()}");
      EasyLoading.dismiss();
      refresh();

      SharePrefsHelper.setString(
          AppConstants.userID, userProfileShow.value.userData?.userId);

      if(userProfileShow.value.img!=null){

        SharePrefsHelper.setString(
            AppConstants.userImage, userProfileShow.value.img);
      }


    } else {

      EasyLoading.dismiss();
      refresh();

      if (response.statusText == ApiClient.somethingWentWrong) {

        showCustomSnackBar(AppStrings.checknetworkconnection, isError: true);

        return;
      } else {
        ApiChecker.checkApi(response);
        return;
      }
    }
  }

  ///======================================>> users-profile-update <<================================

  Rx<TextEditingController> fullNameController = TextEditingController().obs;


  Rx<TextEditingController> phoneNumberController = TextEditingController().obs;

  Rx<TextEditingController> dateOfBirthController = TextEditingController().obs;

  Rx<TextEditingController> weightController = TextEditingController().obs;

  Rx<TextEditingController> heightController = TextEditingController().obs;



  Future<void> userInformationUpdate() async {

    EasyLoading.show(dismissOnTap: true, maskType: EasyLoadingMaskType.custom);

 /*   {  "name": "John Doe",  "contact_number": "+1234567890",
    "gender": "male",  "date_of_birth": "1990-01-01",  "address":
    "123 Main Street, City, Country",  "location": "City, Country",
    "weight": "70",  "height": "175",  "age": 30,  "finger_data": "fingerprint-hash-data",
    "fcm_token": "fcm-token-example",  "is_social_log": true,
    "physical_level": "beginner",  "fitness_goal": "muscle_gain"}*/

    Map<String, String> body = {
      "data": jsonEncode(
      {
        "name": fullNameController.value.text,
        "contact_number": phoneNumberController.value.text,
        "date_of_birth": dateOfBirthController.value.text,
        "gender": "male",
        "address": "123 Main Street, City",
        "location": "City, Country",
        "weight": weightController.value.text,
        "height": heightController.value.text,
        "age": 30,
        "finger_data": "fingerprint-hash-data",
        "fcm_token": "fcm-token-example",
        "is_social_log": true,
        "physical_level": "beginner",
        "fitness_goal": "muscle_gain"
      },
      ),
    };


    var response = await ApiClient.patchMultipartData(ApiUrl.userProfileUpdate, body,
        multipartBody: [MultipartBody('img', File(profileImage.value))]);

    if (response.statusCode == 200) {

      showCustomSnackBar("Post created successfully", isError: false);

      EasyLoading.dismiss();


      debugPrint("body:${response}");

      fullNameController.value.text="";
      phoneNumberController.value.text="";
      dateOfBirthController.value.text="";
      weightController.value.text="";
      heightController.value.text="";
      profileImage.value="";

      userInformationShow();

      refresh();

    } else {

      EasyLoading.dismiss();
      refresh();
      if (response.statusText == ApiClient.somethingWentWrong) {
        showCustomSnackBar(AppStrings.checknetworkconnection, isError: true);
        ApiChecker.checkApi(response);

        return;
      } else {
        EasyLoading.dismiss();
        ApiChecker.checkApi(response);
        return;
      }
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    userInformationShow();
  }
}