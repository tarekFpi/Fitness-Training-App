import 'package:fitness_training_app/service/api_check.dart';
import 'package:fitness_training_app/service/api_client.dart';
import 'package:fitness_training_app/service/api_url.dart';
import 'package:fitness_training_app/utils/ToastMsg/toast_message.dart';
import 'package:fitness_training_app/utils/app_strings/app_strings.dart';
import 'package:fitness_training_app/view/screens/costom_plan_screen/custom_plan_workout_model/CustomPlanWorkoutResponse.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class CustomPlanController extends GetxController {

   RxList<String> items = <String>[
     "week 1",
     "week 2",
     "week 3",
     "week 4",
     "week 5",
   ].obs;

   RxInt currentWeekIndex = 0.obs;


  RxList<String> tabNamelist =
      <String>[AppStrings.weekChallenge, /*AppStrings.targetPlan*/].obs;

  RxInt currentIndex = 0.obs;




  //======================================>> Get custom plan  workOut Api <<================================

  RxList<CustomPlanWorkoutResponse> customPlanWorkOutList = <CustomPlanWorkoutResponse>[].obs;


  Future<void> getCustomPlanWorkOutListByData(List<String>datalist, String weeek_status) async{

    EasyLoading.show(dismissOnTap: false, maskType: EasyLoadingMaskType.custom);


    var response = await ApiClient.getData(ApiUrl.customPlanWorkOut( data: datalist,weeek_status: weeek_status));
    if (response.statusCode == 200) {

      customPlanWorkOutList.value = List.from(response.body["data"].map((m)=> CustomPlanWorkoutResponse.fromJson(m)));
      debugPrint("CustomPlanWorkoutResponse:${customPlanWorkOutList.length.toString()}");

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

}