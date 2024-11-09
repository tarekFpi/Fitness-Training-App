import 'dart:async';
import 'dart:convert';

import 'package:fitness_training_app/utils/ToastMsg/toast_message.dart';
import 'package:fitness_training_app/utils/app_const/app_const.dart';
import 'package:fitness_training_app/view/screens/home_screen/home_model/recipi_program_model.dart';
import 'package:fitness_training_app/view/screens/workout_screen/model/WorkoutLatestRespons.dart';
import 'package:fitness_training_app/view/screens/workout_screen/model/WorkoutResponse.dart';
import 'package:fitness_training_app/view/screens/workout_screen/model/WorkoutVidoeResponse.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../service/api_check.dart';
import '../../../../service/api_client.dart';
import '../../../../service/api_url.dart';
import '../../../../utils/app_strings/app_strings.dart';

class HomeController extends GetxController {
  Rx<Status> homeStatus = Status.loading.obs;

  //=====================================>> GET WORKOUT DATA <<================================
  getWorkoutData() async {
    Timer(const Duration(seconds: 5), () {
      homeStatus.value = Status.completed;
    });
  }

  //======================================>> GET RECEPI PROGRAM DATA <<================================

  RxList<RecipiProgramModel> recipiProgramModelList =
      <RecipiProgramModel>[].obs;

  Future<void> getRecepiProgramData() async {
    var response = await ApiClient.getData(ApiUrl.getHomeRecepiProgram);
    if (response.statusCode == 200) {
      recipiProgramModelList.value = List.from(response.body["data"].map((m)=> RecipiProgramModel.fromJson(m))); 
      debugPrint(recipiProgramModelList.length.toString());
         homeStatus.value = Status.completed; 
    } else {  if (response.statusText == ApiClient.somethingWentWrong) {
        showCustomSnackBar(AppStrings.checknetworkconnection, isError: true); 
           homeStatus.value = Status.internetError;
       // validationLoading.value = false;
        refresh();
        return;
      } else { 
        homeStatus.value = Status.error;
        ApiChecker.checkApi(response);
      //  validationLoading.value = false;
        refresh();
        return;
      }}
  }

  //======================================>> Get workOutList Api <<================================

  RxList<WorkoutResponse> workOutlist = <WorkoutResponse>[].obs;


  Future<void> showWorkOutList() async{

    var response = await ApiClient.getData(ApiUrl.getHomeWorkOutList);
    if (response.statusCode == 200) {
      workOutlist.value = List.from(response.body["data"].map((m)=> WorkoutResponse.fromJson(m)));
      debugPrint("data:${workOutlist.length.toString()}");
        homeStatus.value = Status.completed;
    } else {  if (response.statusText == ApiClient.somethingWentWrong) {
      showCustomSnackBar(AppStrings.checknetworkconnection, isError: true);
        homeStatus.value = Status.internetError;

      refresh();
      return;
    } else {
       homeStatus.value = Status.error;
      ApiChecker.checkApi(response);

      refresh();
      return;
    }}

  }

  //======================================>> Get workOutLatest Data Homepage <<================================


  Rx<WorkoutLatestResponse?>? workOutLatest ;


  Future<void> showWorkOutLatestData() async{

    var response = await ApiClient.getData(ApiUrl.getHomeWorkOutLatest);
    if (response.statusCode == 200) {

      if(response.body["data"]!=null){

        workOutLatest?.value = WorkoutLatestResponse.fromJson(response.body["data"]);
        debugPrint("===================showWorkOutLatestData:${workOutLatest?.value}");
        homeStatus.value = Status.completed;
      }else{
        debugPrint("1nulll:${workOutLatest?.value}");
        workOutLatest?.value = null;
        debugPrint("2nulll:${workOutLatest?.value}");
      }

    } else {
      if (response.statusText == ApiClient.somethingWentWrong) {
        showCustomSnackBar(AppStrings.checknetworkconnection, isError: true);
        homeStatus.value = Status.internetError;

        refresh();
        return;
      } else {
        homeStatus.value = Status.error;
        ApiChecker.checkApi(response);

        refresh();
        return;
      }}

  }



  //======================================>> Get workOut Video List Api <<================================

  RxList<WorkoutVidoeResponse> workOutVideolist = <WorkoutVidoeResponse>[].obs;

  RxBool workOutVidoeLoading = false.obs;

  Future<void> getWorkOutVidoeListById(String video_id) async{

    workOutVidoeLoading.value =true;

    var response = await ApiClient.getData(ApiUrl.getHomeWorkOutListVideo(id: video_id));
    if (response.statusCode == 200) {

      workOutVideolist.value = List.from(response.body["data"]["workoutData"]["exercises"].map((m)=> WorkoutVidoeResponse.fromJson(m)));
      debugPrint("WorkOutVidoeList:${workOutVideolist.length.toString()}");
      workOutVidoeLoading.value =false;
    } else {

      if (response.statusText == ApiClient.somethingWentWrong) {
      showCustomSnackBar(AppStrings.checknetworkconnection, isError: true);
      workOutVidoeLoading.value =true;

      refresh();
      return;
    } else {
        workOutVidoeLoading.value =true;
      ApiChecker.checkApi(response);

      refresh();
      return;
    }}

  }


  //======================================>> post reqest workOut Vidoe create Api <<================================


  RxBool workOutCreateLoading = false.obs;

  Future<void> createWorkOutVidoe(String uid) async {
    workOutCreateLoading.value = true;
    refresh();

    var body = {
      "exercise_id": uid,
    };

    var response = await ApiClient.postData(ApiUrl.createWorkOutVideo, jsonEncode(body));

    if (response.statusCode == 200) {
      workOutCreateLoading.value = false;
      refresh();
      showCustomSnackBar(response.body["message"]!, isError: false);
    } else {
      workOutCreateLoading.value = false;
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
 retry(){
   getWorkoutData();
   getRecepiProgramData();
   showWorkOutList();
   showWorkOutLatestData();
 }

//=====================================>> ON INIT <<================================
  @override
  void onInit() {
    super.onInit();
    getWorkoutData(); 
    getRecepiProgramData();
    showWorkOutList();
    showWorkOutLatestData();
  }
}
