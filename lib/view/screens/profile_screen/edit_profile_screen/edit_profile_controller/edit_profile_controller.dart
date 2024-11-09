import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileController extends GetxController{
  RxBool firstValue = false.obs;
  //===================================== Get Profile Image ==================================
  Rx<File?> profileImage = Rx<File?>(null); // Initialize Rx variable properly

  Future<void> getFileImage() async {
    debugPrint("=============================> image Click");

    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image != null) {
      debugPrint("=============================> image path ${image.path}");
      profileImage.value = File(image.path); // Automatically triggers UI update
    }
  }
}