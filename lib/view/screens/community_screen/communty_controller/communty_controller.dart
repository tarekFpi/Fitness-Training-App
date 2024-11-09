import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CommuntyController extends GetxController {


  RxBool showAddImageOption = RxBool(false);

  File? imagePath;

   RxInt maxLines = 1.obs;
   Rx<TextEditingController> postTextEditingController = TextEditingController().obs;

}
