import 'package:fitness_training_app/utils/app_strings/app_strings.dart';
import 'package:get/get.dart';

class NutritionController extends GetxController {
  RxList<String> tabNamelist =
      <String>[AppStrings.recipesName, AppStrings.mealplan].obs;

  RxList<String> tabIngredientslist =
      <String>[AppStrings.ingredients, AppStrings.instruction].obs;

  RxInt currentIndex = 0.obs;

}
