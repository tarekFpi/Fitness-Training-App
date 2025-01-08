


import 'package:fitness_training_app/service/api_check.dart';
import 'package:fitness_training_app/service/api_client.dart';
import 'package:fitness_training_app/service/api_url.dart';
import 'package:fitness_training_app/utils/ToastMsg/toast_message.dart';
import 'package:fitness_training_app/view/screens/notification_screen/notification_controller/system_notification_model/SystemResponseModel.dart';
import 'package:fitness_training_app/view/screens/notification_screen/reminders_response_model/RemindersResponseModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
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
  AppStrings.all, AppStrings.article
 ].obs;

RxInt searchIndex = 0.obs;


 Rx<TextEditingController> searchTextEditingController =
     TextEditingController().obs;

 ///======================================>> get workOutList Search List Api <<================================

 RxList<RemindersResponseModel> remindersNotificationList = <RemindersResponseModel>[].obs;

 Future<void> getRemindersNotificationList() async{

  EasyLoading.show(dismissOnTap: false, maskType: EasyLoadingMaskType.custom);

  var response = await ApiClient.getData(ApiUrl.remindersNotificationList);
  if (response.statusCode == 200) {

   remindersNotificationList.value = List.from(response.body["data"].map((m)=> RemindersResponseModel.fromJson(m)));
   debugPrint("remindersNotificationList:${remindersNotificationList.length.toString()}");

   EasyLoading.dismiss();

  } else {

   if (response.statusText == ApiClient.somethingWentWrong) {
    showCustomSnackBar(AppStrings.checknetworkconnection, isError: true);
    EasyLoading.dismiss();

    refresh();
    return;
   } else {

    EasyLoading.dismiss();
    ApiChecker.checkApi(response);

    refresh();
    return;
   }
  }

 }



 ///======================================>> get Notification system List Api <<================================

 RxList<SystemResponseModel> systemNotificationList = <SystemResponseModel>[].obs;


 Future<void> getSystemNotificationList() async{

  EasyLoading.show(dismissOnTap: false, maskType: EasyLoadingMaskType.custom);

  var response = await ApiClient.getData(ApiUrl.systemNotificationList);
  if (response.statusCode == 200) {

   systemNotificationList.value = List.from(response.body["data"].map((m)=> SystemResponseModel.fromJson(m)));
   debugPrint("systemNotificationList:${systemNotificationList.length.toString()}");

   EasyLoading.dismiss();

  } else {

   if (response.statusText == ApiClient.somethingWentWrong) {
    showCustomSnackBar(AppStrings.checknetworkconnection, isError: true);
    EasyLoading.dismiss();

    refresh();
    return;
   } else {

    EasyLoading.dismiss();
    ApiChecker.checkApi(response);

    refresh();
    return;
   }
  }
 }

 @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    getRemindersNotificationList();

    getSystemNotificationList();
  }
}