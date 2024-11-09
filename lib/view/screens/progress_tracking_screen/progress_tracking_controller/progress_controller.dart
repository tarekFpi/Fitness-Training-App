import 'package:fitness_training_app/utils/app_strings/app_strings.dart';
import 'package:get/get.dart';

class ProgressController extends GetxController {
  RxString selectTime = "Daily".obs;
  List<String> selectItem = [
    "Monthly",
    "Weekly",
    "Daily",
  ];
  RxList<String> tabProgressTrackinglist =
      <String>[AppStrings.workoutLog, AppStrings.chat].obs;

  RxInt currentIndex = 0.obs;

}