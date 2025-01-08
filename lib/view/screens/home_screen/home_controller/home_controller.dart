import 'dart:async';
import 'dart:convert';

import 'package:fitness_training_app/utils/ToastMsg/toast_message.dart';
import 'package:fitness_training_app/utils/app_const/app_const.dart';
import 'package:fitness_training_app/view/screens/home_screen/home_model/QouteResponse.dart';
import 'package:fitness_training_app/view/screens/home_screen/home_model/recipi_program_model.dart';
import 'package:fitness_training_app/view/screens/workout_screen/model/WorkoutLatestRespons.dart';
import 'package:fitness_training_app/view/screens/workout_screen/model/WorkoutResponse.dart';
import 'package:fitness_training_app/view/screens/workout_screen/model/WorkoutVidoeResponse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
    } else {
      if (response.statusText == ApiClient.somethingWentWrong) {
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

  ///======================================>> GET RECEPI PROGRAM single  DATA <<================================

  Rx<RecipiProgramModel> recipiProgramModelSingleList = RecipiProgramModel().obs;

  Future<void> getRecepiSingleIDProgramData(String data_id) async {

    EasyLoading.show(dismissOnTap: false, maskType: EasyLoadingMaskType.custom);

    var response = await ApiClient.getData(ApiUrl.getRecepiNutritionProgram(id: data_id));

    if (response.statusCode == 200) {
      recipiProgramModelSingleList.value = RecipiProgramModel.fromJson(response.body["data"]);

    //  debugPrint(recipiProgramModelSingleList.length.toString());

      EasyLoading.dismiss();

    } else {

      EasyLoading.dismiss();
      if (response.statusText == ApiClient.somethingWentWrong) {
        showCustomSnackBar(AppStrings.checknetworkconnection, isError: true);
        refresh();
        return;
      } else {

        ApiChecker.checkApi(response);
        refresh();
        return;
      }}
  }



  //======================================>> Get workOutList Api <<================================

  RxList<WorkoutResponse> workOutlist = <WorkoutResponse>[].obs;


  RxBool workOutlistLoading = false.obs;

  Future<void> showWorkOutList() async{

    //workOutlistLoading.value=true;
    //refresh();

    EasyLoading.show(dismissOnTap: false, maskType: EasyLoadingMaskType.custom);

    var response = await ApiClient.getData(ApiUrl.getHomeWorkOutList);
    if (response.statusCode == 200) {
      workOutlist.value = List.from(response.body["data"].map((m)=> WorkoutResponse.fromJson(m)));


      debugPrint("data:${workOutlist.length.toString()}");
        homeStatus.value = Status.completed;
       // workOutlistLoading.value=false;
        refresh();

      EasyLoading.dismiss();
    } else {

      if (response.statusText == ApiClient.somethingWentWrong) {
       showCustomSnackBar(AppStrings.checknetworkconnection, isError: true);
        homeStatus.value = Status.internetError;
       // workOutlistLoading.value=false;
      refresh();
      EasyLoading.dismiss();
      return;
    } else {

       homeStatus.value = Status.error;
       //workOutlistLoading.value=false;
      ApiChecker.checkApi(response);
       EasyLoading.dismiss();
      refresh();
      return;
    }
    }

  }


  RxInt currentIndex = 0.obs;
  late PageController pageController;



  ///======================================>> Get workOutLatest Data Homepage <<================================

  RxList<WorkoutLatestResponse> workOutLatest = <WorkoutLatestResponse>[].obs;


  Future<void> showWorkOutLatestData() async{

    var response = await ApiClient.getData(ApiUrl.getHomeWorkOutLatest);

    if (response.statusCode == 200) {

      workOutLatest.value = List.from(response.body["data"].map((m)=> WorkoutLatestResponse.fromJson(m)));

      debugPrint("workOutLatest:${workOutLatest.toJson()}");

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
      }
    }
  }


  ///======================================>> Get workOut Video List By uid Api <<================================
  RxList<WorkoutVidoeResponse> workOutVideolist = <WorkoutVidoeResponse>[].obs;

  RxString workoutTitle = ''.obs;
  RxString workoutDuration = ''.obs;
  RxString image = ''.obs;
  RxString workoutData_id = ''.obs;


  RxBool workOutVidoeLoading = false.obs;

  Future<void> getWorkOutVidoeListById(String video_id) async{

    workOutVidoeLoading.value =true;

    var response = await ApiClient.getData(ApiUrl.getHomeWorkOutListVideo(id: video_id));
    if (response.statusCode == 200) {

      workOutVidoeLoading.value =false;

      if(response.body["data"]!=null){

        workOutVideolist.value = List.from(response.body["data"]["workoutData"]["exercises"].map((m)=> WorkoutVidoeResponse.fromJson(m)));
        debugPrint("WorkOutVidoeList:${workOutVideolist.length.toString()}");


        workoutTitle.value="${response.body["data"]["workoutData"]["title"]}";
        workoutDuration.value="${response.body["data"]["workoutData"]["duration"]}";
        image.value="${response.body["data"]["workoutData"]["equipment_img"]}";
        workoutData_id.value="${response.body["data"]["workoutData"]["_id"]}";

      }else{

        workOutVideolist = <WorkoutVidoeResponse>[].obs;
      }

      refresh();
    } else {

      if (response.statusText == ApiClient.somethingWentWrong) {
        showCustomSnackBar(AppStrings.checknetworkconnection, isError: true);
        workOutVidoeLoading.value =false;

        refresh();
        return;
      } else {
        workOutVidoeLoading.value =false;
        ApiChecker.checkApi(response);

        refresh();
        return;
      }}
  }




  ///======================================>> qoute  Api <<================================


  Rx<QouteResponse> qoutelist = QouteResponse().obs;

  Future<void> getQoute() async{

    var response = await ApiClient.getData(ApiUrl.getQoute);

    if (response.statusCode == 200) {

      if(response.body["data"]!=null){

        qoutelist.value = QouteResponse.fromJson(response.body["data"]);

        debugPrint("qoutelist:${qoutelist.value.toString()}");

      }else{

        workOutVideolist = <WorkoutVidoeResponse>[].obs;
      }

      refresh();
    } else {

      if (response.statusText == ApiClient.somethingWentWrong) {
      showCustomSnackBar(AppStrings.checknetworkconnection, isError: true);
      workOutVidoeLoading.value =false;

      refresh();
      return;
    } else {
        workOutVidoeLoading.value =false;
      ApiChecker.checkApi(response);

      refresh();
      return;
    }
    }
  }


  ///======================================>> post reqest workOut Vidoe create Api <<================================

  RxBool workOutCreateLoading = false.obs;

  Future<void> createWorkOutVidoe(String uid) async {
    workOutCreateLoading.value = true;
    refresh();

    var body = {
      "exercise_id": uid,
    };

    var response = await ApiClient.postData(ApiUrl.createWorkOutVideo, jsonEncode(body));

    if (response.statusCode == 201) {
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



  ///============= Insert WorkOut favorite Api ==============================================

  RxBool workOutInsertFavoriteLoading = false.obs;

  Future<void> favoriteWorkOutInsert(String favorite_id) async {
    workOutInsertFavoriteLoading.value = true;
    refresh();

    var body = {
      "workout_id": favorite_id,
    };

    var response = await ApiClient.postData(ApiUrl.favoriteWorkOutInsert, jsonEncode(body));

    if (response.statusCode == 200) {
      workOutInsertFavoriteLoading.value = false;
    //  refresh();
     showCustomSnackBar("${response.body["message"]!}", isError: false);

    } if (response.statusCode == 400) {
      workOutInsertFavoriteLoading.value = false;
        //refresh();
      showCustomSnackBar("${response.body["message"]!}", isError: true);

    }else {
      workOutInsertFavoriteLoading.value = false;
      refresh();

      if (response.statusText == ApiClient.somethingWentWrong) {

       showCustomSnackBar(AppStrings.checknetworkconnection, isError: true);
       workOutInsertFavoriteLoading.value = false;
        return;
      } else {

        workOutInsertFavoriteLoading.value = false;
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
    getQoute();

    pageController = PageController(initialPage: currentIndex.value);
    pageController.addListener(() {
      currentIndex.value = pageController.page!.round();
    });
  }
}
