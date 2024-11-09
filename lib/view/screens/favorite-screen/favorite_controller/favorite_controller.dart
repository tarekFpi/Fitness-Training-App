

import 'package:fitness_training_app/utils/app_strings/app_strings.dart';
import 'package:get/get.dart';

class FavoriteController  extends GetxController{

  RxList<String> tabNamelist = <String>[
    AppStrings.all,
    AppStrings.video,
    AppStrings.article
  ].obs;

  RxInt curentIndex = 0.obs;


}