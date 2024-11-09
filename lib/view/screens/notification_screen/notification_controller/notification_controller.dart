


import 'package:get/get.dart';

import '../../../../utils/app_strings/app_strings.dart';

class NotificationController  extends GetxController{  

  //================ Notification Tab ================ 

 RxList<String> tabNamelist = <String>[ 
  AppStrings.reminders ,  AppStrings.system

 ].obs;     
   
 RxInt curentIndex = 0.obs;

 //====================== Search Tab ====================   



 RxList<String> searchList = <String>[ 
  AppStrings.all ,  AppStrings.workout ,  AppStrings.nutriton , 
 ].obs;

RxInt searchIndex = 0.obs;


}