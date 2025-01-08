import 'dart:convert';

import 'package:fitness_training_app/service/api_check.dart';
import 'package:fitness_training_app/service/api_client.dart';
import 'package:fitness_training_app/service/api_url.dart';
import 'package:fitness_training_app/utils/ToastMsg/toast_message.dart';
import 'package:fitness_training_app/utils/app_strings/app_strings.dart';
import 'package:fitness_training_app/view/screens/favorite-screen/article_favorite_model/ArticleFavoriteListResponse.dart';
import 'package:fitness_training_app/view/screens/favorite-screen/workout_favorite_model/WorkoutFavoriteListResponse.dart';
import 'package:fitness_training_app/view/screens/resources_screen/resources_model/ArticleListResponse.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class FavoriteController extends GetxController {
  RxList<String> tabNamelist = <String>[
    AppStrings.all,
    //AppStrings.video,
    AppStrings.article
  ].obs;

  RxInt curentIndex = 0.obs;


  ///======================================>> Get Article List Api <<================================

  RxList<ArticleListResponse> ariticalList = <ArticleListResponse>[].obs;

  RxBool ariticalLoading = false.obs;

  Future<void> showAriticaleList() async {

    ariticalLoading.value = true;
    EasyLoading.show(dismissOnTap: false, maskType: EasyLoadingMaskType.custom);

   var response = await ApiClient.getData(ApiUrl.getArticleList);
    if (response.statusCode == 200) {
      ariticalList.value = List.from(
          response.body["data"].map((m) => ArticleListResponse.fromJson(m)));
      debugPrint("data:${ariticalList.length.toString()}");

      ariticalLoading.value = false;

      EasyLoading.dismiss();
    } else {
      if (response.statusText == ApiClient.somethingWentWrong) {
        showCustomSnackBar(AppStrings.checknetworkconnection, isError: true);
        ariticalLoading.value = false;
        refresh();
        EasyLoading.dismiss();
        return;
      } else {
        ariticalLoading.value = false;
        ApiChecker.checkApi(response);
        refresh();
        EasyLoading.dismiss();
        return;
      }

    }
  }



  ///============= Insert Articles favorite Api==================

  RxBool articlesCreateLoading = false.obs;

  Future<void> favoriteArticlesInsert(String favorite_id) async {

    articlesCreateLoading.value = true;

    EasyLoading.show(dismissOnTap: false, maskType: EasyLoadingMaskType.custom);

    var body = {
      "article_id": favorite_id,
    };

    var response = await ApiClient.postData(
        ApiUrl.favoriteArticleInsert, jsonEncode(body));

    if (response.statusCode == 200) {

      showCustomSnackBar("${response.body["message"]!}", isError: false);

      showAriticaleList();

      getArticleFavoriteList();

      articleFavoritelist.refresh();

      EasyLoading.dismiss();

      refresh();
    }

    if (response.statusCode == 400) {
      articlesCreateLoading.value = false;
      refresh();
      showCustomSnackBar("${response.body["message"]!}", isError: true);

      EasyLoading.dismiss();
    } else {
      articlesCreateLoading.value = false;
      refresh();
      EasyLoading.dismiss();

      if (response.statusText == ApiClient.somethingWentWrong) {
        showCustomSnackBar(AppStrings.checknetworkconnection, isError: true);
        articlesCreateLoading.value = false;
        return;
      } else {
        articlesCreateLoading.value = false;
        return;
      }
    }
  }

  ///======================================>> Get favorite workOut List Show <<================================

  RxList<WorkoutFavoriteListResponse> workOutFavoritelist =
      <WorkoutFavoriteListResponse>[].obs;

  RxBool workOutFavoriteLoading = false.obs;

  Future<void> getWorkOutFavoriteList() async {
    workOutFavoriteLoading.value = true;

    var response = await ApiClient.getData(ApiUrl.getFavoriteWorkOutList);
    if (response.statusCode == 200) {
      workOutFavoritelist.value = List.from(response.body["data"]
          .map((m) => WorkoutFavoriteListResponse.fromJson(m)));

      workOutFavoriteLoading.value = false;
    } else {
      if (response.statusText == ApiClient.somethingWentWrong) {
        showCustomSnackBar(AppStrings.checknetworkconnection, isError: true);
        workOutFavoriteLoading.value = false;

        refresh();
        return;
      } else {
        workOutFavoriteLoading.value = false;
        ApiChecker.checkApi(response);

        refresh();
        return;
      }
    }
  }


  ///======================================>> Get favorite Article List Show <<================================

  RxList<ArticleFavoriteListResponse> articleFavoritelist =
      <ArticleFavoriteListResponse>[].obs;

  RxBool articleFavoriteLoading = false.obs;

  Future<void> getArticleFavoriteList() async {

    EasyLoading.show(dismissOnTap: false, maskType: EasyLoadingMaskType.custom);

    //articleFavoriteLoading.value = true;
     refresh();

    var response = await ApiClient.getData(ApiUrl.getFavoriteArticleList);

    if (response.statusCode == 200) {
      articleFavoritelist.value = List.from(response.body["data"]
          .map((m) => ArticleFavoriteListResponse.fromJson(m)));

     // articleFavoriteLoading.value = false;

      EasyLoading.dismiss();
      refresh();
    } else {
      if (response.statusText == ApiClient.somethingWentWrong) {
        showCustomSnackBar(AppStrings.checknetworkconnection, isError: true);
       // articleFavoriteLoading.value = false;

        refresh();
        EasyLoading.dismiss();
        return;
      } else {
       // articleFavoriteLoading.value = false;
        ApiChecker.checkApi(response);
        EasyLoading.dismiss();
        refresh();
        return;
      }
    }
  }



  ///============= Delete Articles favorite Api =============================

  RxBool articlesFavoriteDeleteLoading = false.obs;

  Future<void> favoriteArticlesDelete(String uid) async {

   // articlesFavoriteDeleteLoading.value = true;
    //refresh();
    EasyLoading.show(dismissOnTap: false, maskType: EasyLoadingMaskType.custom);

    var response = await ApiClient.deleteData(ApiUrl.favoriteArticleDelete(id: uid));

    debugPrint("response:${response.body["message"]!}");

    if (response.statusCode == 200) {
      //articlesFavoriteDeleteLoading.value = false;
      refresh();
      showCustomSnackBar("${response.body["message"]!}", isError: false);

      getArticleFavoriteList();
      showAriticaleList();

      EasyLoading.dismiss();
    }
    if (response.statusCode == 400) {

      refresh();
      showCustomSnackBar("${response.body["message"]!}", isError: true);
      EasyLoading.dismiss();
    } else {

      refresh();
      EasyLoading.dismiss();
      if (response.statusText == ApiClient.somethingWentWrong) {
        showCustomSnackBar(AppStrings.checknetworkconnection, isError: true);

        return;
      } else {

        EasyLoading.dismiss();
        return;
      }
    }
  }



  ///============= Insert WorkOut favorite Api =============================

  Future<void> favoriteWorkOutInsert(String favorite_id) async {


    EasyLoading.show(dismissOnTap: false, maskType: EasyLoadingMaskType.custom);

    var body = {
      "workout_id": favorite_id,
    };

    var response = await ApiClient.postData(
        ApiUrl.favoriteWorkOutInsert, jsonEncode(body));

    if (response.statusCode == 200) {

      showCustomSnackBar("${response.body["message"]!}", isError: false);

      getWorkOutFavoriteList();

      EasyLoading.dismiss();

      refresh();
    }
    if (response.statusCode == 400) {
      refresh();
      showCustomSnackBar("${response.body["message"]!}", isError: true);

      EasyLoading.dismiss();
    } else {

      refresh();
      EasyLoading.dismiss();

      if (response.statusText == ApiClient.somethingWentWrong) {
        showCustomSnackBar(AppStrings.checknetworkconnection, isError: true);
        return;
      } else {
        return;
      }
    }
  }



  //============= Delete WorkOut favorite Api =============================

  RxBool workOutFavoriteDeleteLoading = false.obs;

  Future<void> favoriteWorkOutDelete(String uid) async {

    workOutFavoriteDeleteLoading.value = true;


    var response = await ApiClient.deleteData(ApiUrl.favoriteWorkOutDelete(id: uid));


    debugPrint("response:${response.body["message"]!}");
    if (response.statusCode == 200) {
      workOutFavoriteDeleteLoading.value = false;
      refresh();
      showCustomSnackBar("${response.body["message"]!}", isError: false);

      getWorkOutFavoriteList();
    }
    if (response.statusCode == 400) {
      workOutFavoriteDeleteLoading.value = false;
      refresh();
      showCustomSnackBar("${response.body["message"]!}", isError: true);
    } else {
      workOutFavoriteDeleteLoading.value = false;
      refresh();

      if (response.statusText == ApiClient.somethingWentWrong) {
        showCustomSnackBar(AppStrings.checknetworkconnection, isError: true);
        workOutFavoriteDeleteLoading.value = false;
        return;
      } else {
        workOutFavoriteDeleteLoading.value = false;
        return;
      }
    }
  }



  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    showAriticaleList();

   getArticleFavoriteList();

  }
}
