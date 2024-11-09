import 'package:fitness_training_app/utils/app_strings/app_strings.dart';
import 'package:get/get.dart';

class CustomPlanController extends GetxController {
  RxList<String> tabNamelist =
      <String>[AppStrings.weekChallenge, AppStrings.targetPlan].obs;

  RxInt currentIndex = 0.obs;
}