


import 'package:fitness_training_app/utils/app_strings/app_strings.dart';
import 'package:get/get.dart';


class ResourcesController  extends GetxController{

  //================ Resources Tab ================

  RxList<String> tabNamelist = <String>[
    AppStrings.workoutsname ,  AppStrings.articlesAndTips

  ].obs;

  RxInt curentIndex = 0.obs;




}