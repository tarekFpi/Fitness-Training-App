

import 'package:get/get.dart';

class RegistrationController extends GetxController{
  RxList<bool> isSelectedItems = <bool>[false, false, false].obs;

  changedIndex(int index){

    isSelectedItems[index] = isSelectedItems[index]? false:true;
    refresh();

  }

}