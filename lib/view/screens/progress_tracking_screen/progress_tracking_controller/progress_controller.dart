import 'package:fitness_training_app/service/api_check.dart';
import 'package:fitness_training_app/service/api_client.dart';
import 'package:fitness_training_app/service/api_url.dart';
import 'package:fitness_training_app/utils/ToastMsg/toast_message.dart';
import 'package:fitness_training_app/utils/app_strings/app_strings.dart';
import 'package:fitness_training_app/view/screens/progress_tracking_screen/progress_trackingResponse_model/chart_weekly_model.dart';
import 'package:fitness_training_app/view/screens/progress_tracking_screen/progress_trackingResponse_model/chatMonthlyResponseModel.dart';
import 'package:fitness_training_app/view/screens/progress_tracking_screen/progress_trackingResponse_model/chatStatusResponseModel.dart';
import 'package:fitness_training_app/view/screens/progress_tracking_screen/progress_trackingResponse_model/progressTrackingResponseModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class ProgressController extends GetxController {

  RxString selectTime = "Weekly".obs;
  List<String> selectItem = ["Weekly","Monthly"];



  RxList<String> tabProgressTrackinglist =
      <String>[AppStrings.workoutLog, AppStrings.Chart].obs;

  RxInt currentIndex = 0.obs;


  ///======================================>> progress tracking List Api show <<================================

  RxList<ProgressTrackingResponseModel> progressTrackingList = <ProgressTrackingResponseModel>[].obs;


  Future<void> showProgressTrackingList(String date) async {

    EasyLoading.show(dismissOnTap: false, maskType: EasyLoadingMaskType.custom);

    var response = await ApiClient.getData(ApiUrl.progressTrackingList(date: date));

    if (response.statusCode == 200) {

      progressTrackingList.value = List.from(response.body["data"].map((m)=> ProgressTrackingResponseModel.fromJson(m)));
      debugPrint(progressTrackingList.length.toString());

      EasyLoading.dismiss();
      refresh();

    } else {

      EasyLoading.dismiss();
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



  ///======================================>> chart Weekly  show  api <<================================

  RxList<ChatWeekResponseModel> chartWeeklyShowList = <ChatWeekResponseModel>[].obs;

  Future<void> chartWeeklyShow() async {

    EasyLoading.show(dismissOnTap: false, maskType: EasyLoadingMaskType.custom);

    var response = await ApiClient.getData(ApiUrl.chartWeekly);

    if (response.statusCode == 200) {

     chartWeeklyShowList.value = List.from(response.body["data"].map((m)=> ChatWeekResponseModel.fromJson(m)));

     // chartWeeklyShowList.value = ChatWeekResponseModel.fromJson(response.body["data"]);
      debugPrint("chartWeeklyShowList:${chartWeeklyShowList.value}");

      EasyLoading.dismiss();
      refresh();

    } else {

      EasyLoading.dismiss();
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


  ///======================================>> chart monthly  show  api <<================================

  RxList<ChatMonthlyResponseModel> chartMonthlyShowList = <ChatMonthlyResponseModel>[].obs;

  Future<void> chartMonthShow() async {

    EasyLoading.show(dismissOnTap: false, maskType: EasyLoadingMaskType.custom);

    var response = await ApiClient.getData(ApiUrl.monthlyWeekly);

    if (response.statusCode == 200) {

      chartMonthlyShowList.value = List.from(response.body["data"].map((m)=> ChatMonthlyResponseModel.fromJson(m)));

      debugPrint("chartMonthlyShowList:${chartMonthlyShowList.value}");

      EasyLoading.dismiss();
      refresh();

    } else {

      EasyLoading.dismiss();
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


  ///=======================  /user-exercise/monthly-status ================================

  Rx<ChatStatusResponseModel> chartStatusShowList = ChatStatusResponseModel().obs;

  Future<void> chartStatusShow() async {

    EasyLoading.show(dismissOnTap: false, maskType: EasyLoadingMaskType.custom);

    var response = await ApiClient.getData(ApiUrl.statusExercise);

    if (response.statusCode == 200) {

       chartStatusShowList.value = ChatStatusResponseModel.fromJson(response.body["data"]);

      debugPrint("chartStatusShowList:${chartStatusShowList.value}");

      EasyLoading.dismiss();
      refresh();

    } else {

      EasyLoading.dismiss();
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

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    chartWeeklyShow();

    chartMonthShow();
    chartStatusShow();
  }
}