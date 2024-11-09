import 'package:fitness_training_app/utils/app_strings/app_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChatController extends GetxController{ 
   

 RxList<String> messageTabList = <String>[ 
  AppStrings.tuttoilpersonale,
  AppStrings.medici, 
  AppStrings.farmacia, 
  
 ].obs; 

 RxInt tabCurrentIndex = 0.obs;

 Rx<TextEditingController> messageController = TextEditingController().obs;
}