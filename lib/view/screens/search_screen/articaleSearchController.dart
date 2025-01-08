import 'package:fitness_training_app/service/api_check.dart';
import 'package:fitness_training_app/service/api_client.dart';
import 'package:fitness_training_app/service/api_url.dart';
import 'package:fitness_training_app/utils/ToastMsg/toast_message.dart';
import 'package:fitness_training_app/utils/app_strings/app_strings.dart';
import 'package:fitness_training_app/view/screens/resources_screen/resources_model/ArticleListResponse.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ArticleSearchController extends GetxController  with StateMixin<List<ArticleListResponse>>{

  ///======================================>> get ArticleList Api <<================================

  RxList<ArticleListResponse> ariticalList = <ArticleListResponse>[].obs;

  Future<void> showArticleList() async{


    change(null, status: RxStatus.loading());

    var response = await ApiClient.getData(ApiUrl.getArticleList);

    if (response.statusCode == 200) {

      ariticalList.value = List.from(response.body["data"].map((m)=> ArticleListResponse.fromJson(m)));

      change(ariticalList.value, status: RxStatus.success());

      refresh();

      if(ariticalList.isEmpty){

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


  ///======================================>> get ArticleList  Search Api <<================================

  Future<void> searchArticaleList(String query) async{

    change(null, status: RxStatus.loading());

    if (query == null || query.isEmpty) {

      change(ariticalList.value, status: RxStatus.success());

    }else{

      try{

        final filteredList = ariticalList.value
            .where((element) =>element.topic!.toLowerCase().contains(query.toLowerCase().trim())
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

    showArticleList();
  }

}
