import 'package:fitness_training_app/utils/app_strings/app_strings.dart';
import 'package:get/get.dart';

class ProgressGraphController extends GetxController {

  RxList<String> tabProgressslist =
      <String>[AppStrings.workoutLog, AppStrings.chat].obs;

  RxInt currentIndex = 0.obs;

}
