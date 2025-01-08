

import 'dart:convert';
import 'dart:io';

import 'package:fitness_training_app/core/app_routes/app_routes.dart';
import 'package:fitness_training_app/service/api_check.dart';
import 'package:fitness_training_app/service/api_client.dart';
import 'package:fitness_training_app/service/api_url.dart';
import 'package:fitness_training_app/utils/ToastMsg/toast_message.dart';
import 'package:fitness_training_app/utils/app_strings/app_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class RegistrationController extends GetxController{


  RxList<bool> isSelectedItems = <bool>[false, false, false].obs;


  RxBool selectedItem1 =false.obs;
  RxBool selectedItem2 =false.obs;
  RxBool selectedItem3 =false.obs;
  RxBool selectedItem4 =false.obs;
  RxBool selectedItem5 =false.obs;


///============================= physical Activity Level =============================

  RxBool physicalSelectedItem1 =false.obs;
  RxBool physicalSelectedItem2 =false.obs;
  RxBool physicalSelectedItem3 =false.obs;
  RxBool physicalSelectedItem4 =false.obs;


  changedIndex(int index){

    isSelectedItems[index] = isSelectedItems[index]? false:true;
    refresh();

  }


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






  ///======================================>> users-profile-update <<================================
  Rx<TextEditingController> fullNameController = TextEditingController().obs;


  Rx<TextEditingController> phoneNumberController = TextEditingController().obs;

  Rx<TextEditingController> dateOfBirthController = TextEditingController().obs;

  Rx<TextEditingController> weightController = TextEditingController().obs;

  Rx<TextEditingController> heightController = TextEditingController().obs;



  Future<void> userInformationUpdate(String goal_value,String physical_value) async {

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
          "weight": weightController.value.text,
          "height": heightController.value.text,
          "physical_level": physical_value,
          "fitness_goal": goal_value
        },
      ),
    };


    var response = await ApiClient.patchMultipartData(ApiUrl.userProfileUpdate, body,
        multipartBody: [MultipartBody('img', File(profileImage.value))]);

    if (response.statusCode == 200) {

      showCustomSnackBar("Post created successfully", isError: false);

      EasyLoading.dismiss();
      refresh();

      fullNameController.value.text="";
      phoneNumberController.value.text="";
      dateOfBirthController.value.text="";
      weightController.value.text="";
      heightController.value.text="";
      profileImage.value="";

      Get.toNamed(AppRoutes.subscriptionScreen);
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

}