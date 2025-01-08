


import 'dart:convert';

import 'package:fitness_training_app/service/api_check.dart';
import 'package:fitness_training_app/service/api_client.dart';
import 'package:fitness_training_app/service/api_url.dart';
import 'package:fitness_training_app/utils/ToastMsg/toast_message.dart';
import 'package:fitness_training_app/utils/app_strings/app_strings.dart';
import 'package:fitness_training_app/view/screens/resources_screen/resources_model/ArticleListResponse.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


class ResourcesController  extends GetxController{

  //================ Resources Tab ================

  RxList<String> tabNamelist = <String>[
    AppStrings.workoutsname ,  AppStrings.articlesAndTips

  ].obs;

  RxInt curentIndex = 0.obs;





}