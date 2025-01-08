// ignore_for_file: prefer_const_constructors
import 'dart:convert';

import 'package:fitness_training_app/core/app_routes/app_routes.dart';
import 'package:fitness_training_app/service/api_check.dart';
import 'package:fitness_training_app/service/api_client.dart';
import 'package:fitness_training_app/service/api_url.dart';
import 'package:fitness_training_app/utils/ToastMsg/toast_message.dart';
import 'package:fitness_training_app/utils/app_colors/app_colors.dart';
import 'package:fitness_training_app/utils/app_strings/app_strings.dart';
import 'package:fitness_training_app/view/screens/profile_screen/edit_profile_screen/userProfile_show_model/userProfileResponseModel.dart';
import 'package:fitness_training_app/view/screens/profile_screen/privacyPolicy_model/AcceptExistResponseModel.dart';
import 'package:fitness_training_app/view/screens/profile_screen/privacyPolicy_model/privacyPolicyResponseModel.dart';
import 'package:fitness_training_app/view/screens/profile_screen/privacyPolicy_model/privacy_policy_accept_model.dart';
import 'package:fitness_training_app/view/screens/profile_screen/profile_controller/profile_popup.dart';
import 'package:fitness_training_app/view/screens/profile_screen/setting_faq_model/settingFaqResponseModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
class ProfileController extends GetxController {

  RxBool firstValue = false.obs;

  ///============ Show Family Dailog PopUp===============================
  showPopup() {
    return showDialog(
        context: Get.context!,
        builder: (_) => AlertDialog(
          backgroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12)),
          content: ProfilePopup(

          ),
        ));
  }



  ///======================================>> get privacy-policy api <<================================

  Rx<PrivacyPolicyResponseModel?> privacy_policyList = PrivacyPolicyResponseModel().obs;

  Future<void> showPrivacyPolicyList() async{

    var response = await ApiClient.getData(ApiUrl.getPrivacy_policy);

    if (response.statusCode == 200) {

      privacy_policyList.value = PrivacyPolicyResponseModel.fromJson(response.body["data"]);

      debugPrint("privacy_policyList:${privacy_policyList.value?.toJson()}");

    } else {

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



  ///======================================>> exist privacy-policy-accept api <<================================

  Rx<AcceptExistResponseModel?> privacy_policy_acceptExist = AcceptExistResponseModel().obs;

  Future<void> showWorkOutLatestData() async{

    var response = await ApiClient.getData(ApiUrl.existPrivacy_policy);

    if (response.statusCode == 200) {

      if(response.body["data"]!=null){

        privacy_policy_acceptExist.value = AcceptExistResponseModel.fromJson(response.body["data"]);

      }else{

        privacy_policy_acceptExist.value = AcceptExistResponseModel();
      }

      debugPrint("privacy_policy_acceptExist:${privacy_policy_acceptExist.value?.toJson()}");

    } else {

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






  ///======================================>> create user-accept-privacy-policy api <<================================

 Rx<PrivacyPolicyInsertResponseModel?> privacy_policyList_accept = PrivacyPolicyInsertResponseModel().obs;

RxString privacy_policy_acceptStatus ="".obs;

  Future<void> privacy_policyAcceptInsert(String uid) async {

    var body = {
      "privacy_policy_id": uid,
    };

    var response = await ApiClient.postData(ApiUrl.cratePrivacy_policy, jsonEncode(body));

    if (response.statusCode == 200) {

      refresh();
      showCustomSnackBar(response.body["message"]!, isError: false);

      privacy_policyList_accept.value = PrivacyPolicyInsertResponseModel.fromJson(response.body["data"]);

      debugPrint("privacy_policyList_accept:${privacy_policyList_accept.value?.toJson()}");

    } if (response.statusCode == 400) {

      showCustomSnackBar(response.body["message"]!, isError: true);
      refresh();

    }else {

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





  ///======================================>> setting-faq api <<================================

  RxList<SettingFaqResponseModel> setting_faqList = <SettingFaqResponseModel>[].obs;


  Future<void> settingFaqShow() async {

    EasyLoading.show(dismissOnTap: false, maskType: EasyLoadingMaskType.custom);

    var response = await ApiClient.getData(ApiUrl.settingFaq);

    if (response.statusCode == 200) {


      setting_faqList.value = List.from(response.body["data"].map((m)=> SettingFaqResponseModel.fromJson(m)));
      debugPrint(setting_faqList.length.toString());

      debugPrint("SettingFaqResponseModel:${privacy_policyList_accept.value?.toJson()}");
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


    settingFaqShow();
  }

}