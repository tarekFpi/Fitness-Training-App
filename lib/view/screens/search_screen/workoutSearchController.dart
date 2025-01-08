import 'package:fitness_training_app/service/api_check.dart';
import 'package:fitness_training_app/service/api_client.dart';
import 'package:fitness_training_app/service/api_url.dart';
import 'package:fitness_training_app/utils/ToastMsg/toast_message.dart';
import 'package:fitness_training_app/utils/app_strings/app_strings.dart';
import 'package:fitness_training_app/view/screens/workout_screen/model/WorkoutResponse.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class WorkoutSearchController extends GetxController  with StateMixin<List<WorkoutResponse>>{

  ///======================================>> get workOutList Api <<================================

  RxList<WorkoutResponse> workOutlist = <WorkoutResponse>[].obs;

  Future<void> showWorkOutList() async{

    //refresh();
    change(null, status: RxStatus.loading());

    var response = await ApiClient.getData(ApiUrl.getHomeWorkOutList);

    if (response.statusCode == 200) {

      workOutlist.value = List.from(response.body["data"].map((m)=> WorkoutResponse.fromJson(m)));

      change(workOutlist.value, status: RxStatus.success());

      debugPrint("dataSearch:${workOutlist.length.toString()}");

      refresh();

      if(workOutlist.isEmpty){

        change(null, status: RxStatus.empty());
      }

    } else {

      change(null, status: RxStatus.error(ApiClient.somethingWentWrong));

      if (response.statusText == ApiClient.somethingWentWrong) {
        showCustomSnackBar(AppStrings.checknetworkconnection, isError: true);
        refresh();

        return;
      } else {

        ApiChecker.checkApi(response);
        refresh();
        return;
      }
    }

  }


  ///======================================>> get WorkOutList  Search Api <<================================

  Future<void> searchWorkOutList(String query) async{

    change(null, status: RxStatus.loading());

    if (query == null || query.isEmpty) {

      change(workOutlist.value, status: RxStatus.success());

    }else{

     try{

       final filteredList = workOutlist.value
           .where((element) =>element.title!.toLowerCase().contains(query.toLowerCase().trim())
       ).toList();

       if(filteredList.isEmpty){

         change([], status: RxStatus.empty());

       }else {
         change(filteredList, status: RxStatus.success());
       }

     }catch(e){

       debugPrint(e.toString());
     }

    }
  }


@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    showWorkOutList();
  }

}
