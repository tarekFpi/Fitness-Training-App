import 'dart:convert';

import 'package:fitness_training_app/core/app_routes/app_routes.dart';
import 'package:fitness_training_app/service/api_check.dart';
import 'package:fitness_training_app/service/api_client.dart';
import 'package:fitness_training_app/service/api_url.dart';
import 'package:fitness_training_app/utils/ToastMsg/toast_message.dart';
import 'package:fitness_training_app/utils/app_strings/app_strings.dart';
import 'package:fitness_training_app/view/screens/nutrition_screen/customize_nutrition_day_model/CustomNutritionDayModel.dart';
import 'package:fitness_training_app/view/screens/nutrition_screen/inner_widget/custom_nutrition_singleModel/NutritionCustomSingleModel.dart';
import 'package:fitness_training_app/view/screens/nutrition_screen/recipe_nutrition_model/RecipeNutritionBreakfastResponse.dart';
import 'package:fitness_training_app/view/screens/nutrition_screen/recipe_nutrition_model/RecipeNutritionDinnerResponse.dart';
import 'package:fitness_training_app/view/screens/nutrition_screen/recipe_nutrition_model/RecipeNutritionLunchResponse.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class NutritionController extends GetxController {

  RxList<String> items = <String>[
    "Sat",
    "Sun",
    "Mon",
    "Tue",
    "Wed",
    "Thu",
    "Fir",
  ].obs;

  RxInt currentWeekIndex = 0.obs;

  RxList<String> tabNamelist =
      <String>[AppStrings.recipesName, AppStrings.mealplan].obs;

  RxList<String> tabIngredientslist =
      <String>[AppStrings.ingredients, AppStrings.instruction].obs;

  RxInt currentIndex = 0.obs;



  ///======================================>> Get Nutrition Recipes Breakfast List Api <<================================

  RxList<RecipeNutritionBreakfastResponse> recipesNutritionBreakfastList = <RecipeNutritionBreakfastResponse>[].obs;


  Future<void> getRecipeNutritionBreakfastList() async{

    EasyLoading.show(dismissOnTap: false, maskType: EasyLoadingMaskType.custom);

    var response = await ApiClient.getData(ApiUrl.getNutritionBreakfastRecipes);
    if (response.statusCode == 200) {

      recipesNutritionBreakfastList.value = List.from(response.body["data"].map((m)=> RecipeNutritionBreakfastResponse.fromJson(m)));
      debugPrint("recipesNutritionList:${recipesNutritionBreakfastList.length.toString()}");

      EasyLoading.dismiss();

    } else {

      if (response.statusText == ApiClient.somethingWentWrong) {
        showCustomSnackBar(AppStrings.checknetworkconnection, isError: true);
        EasyLoading.dismiss();

        refresh();
        return;
      } else {

        EasyLoading.dismiss();
        ApiChecker.checkApi(response);

        refresh();
        return;
      }
    }

  }






  ///======================================>> Get Nutrition Recipes Lunch List Api <<================================

  RxList<RecipeNutritionLunchResponse> recipesNutritionLunchList = <RecipeNutritionLunchResponse>[].obs;

  Future<void> getRecipeNutritionLunchList() async{

    EasyLoading.show(dismissOnTap: false, maskType: EasyLoadingMaskType.custom);

    var response = await ApiClient.getData(ApiUrl.getNutritionLunchRecipes);

    if (response.statusCode == 200) {

      recipesNutritionLunchList.value = List.from(response.body["data"].map((m)=> RecipeNutritionLunchResponse.fromJson(m)));

      debugPrint("RecipeNutritionLunchResponse:${recipesNutritionLunchList.length.toString()}");

      EasyLoading.dismiss();


    } else {

      if (response.statusText == ApiClient.somethingWentWrong) {
        showCustomSnackBar(AppStrings.checknetworkconnection, isError: true);
        EasyLoading.dismiss();

        refresh();
        return;
      } else {

        EasyLoading.dismiss();
        ApiChecker.checkApi(response);

        refresh();
        return;
      }
    }
  }



  ///======================================>> Get Nutrition Recipes Dinner List Api <<================================

  RxList<RecipeNutritionDinnerResponse> recipesNutritionDinnerList = <RecipeNutritionDinnerResponse>[].obs;

  Future<void> getRecipeNutritionDinnerList() async{

    EasyLoading.show(dismissOnTap: false, maskType: EasyLoadingMaskType.custom);

    var response = await ApiClient.getData(ApiUrl.getNutritionDinnerRecipes);

    if (response.statusCode == 200) {

      recipesNutritionDinnerList.value = List.from(response.body["data"].map((m)=> RecipeNutritionDinnerResponse.fromJson(m)));

      debugPrint("recipesNutritionDinnerList:${recipesNutritionDinnerList.length.toString()}");

      EasyLoading.dismiss();


    } else {

      if (response.statusText == ApiClient.somethingWentWrong) {
        showCustomSnackBar(AppStrings.checknetworkconnection, isError: true);
        EasyLoading.dismiss();

        refresh();
        return;
      } else {

        EasyLoading.dismiss();
        ApiChecker.checkApi(response);

        refresh();
        return;
      }
    }
  }



  RxList<String> goalList=[""].obs;

  RxList<String> cookingList=[""].obs;

  RxList<String> dietaryList=[""].obs;



  ///======== caloric Goal checkBox ===========
  RxBool goal_checkBox1 = false.obs;
  RxBool goal_checkBox2 = false.obs;
  RxBool goal_checkBox3 = false.obs;
  RxBool goal_checkBox4 = false.obs;

  ///======== Cooking Time Preference checkBox ===========

  RxBool cooking_checkBox1 = false.obs;
  RxBool cooking_checkBox2 = false.obs;
  RxBool cooking_checkBox3 = false.obs;


  ///======== Dietary Preference checkBox ===========

  RxBool dietary_checkBox1 = false.obs;
  RxBool dietary_checkBox2 = false.obs;
  RxBool dietary_checkBox3 = false.obs;
  RxBool dietary_checkBox4 = false.obs;
  RxBool dietary_checkBox5 = false.obs;
  RxBool dietary_checkBox6 = false.obs;


  ///======================================>> get customize-nutrition-plan/user-customize-single Api <<================================

  Rx<NutritionCustomSingleModel>? nutritionCustomSingleModel = NutritionCustomSingleModel().obs;

  Future<void> getNutritionMealPlanShow(String day) async{

    EasyLoading.show(dismissOnTap: false, maskType: EasyLoadingMaskType.custom);

    var response = await ApiClient.getData(ApiUrl.getSingeNutritionMealPlan(day: day));

    if (response.statusCode == 200) {

      if(response.body["data"]!=null){

        nutritionCustomSingleModel?.value = NutritionCustomSingleModel.fromJson(response.body["data"]);

        ///=============== caloricGoal already check selected checkBox select =============
        ///
        goal_checkBox1.value =   nutritionCustomSingleModel!.value.caloricGoal!.contains("1500");
        goal_checkBox2.value =  nutritionCustomSingleModel!.value.caloricGoal!.contains("2000");
        goal_checkBox3.value =   nutritionCustomSingleModel!.value.caloricGoal!.contains("2000 More");
        goal_checkBox4.value =   nutritionCustomSingleModel!.value.caloricGoal!.contains("not_sure");

        ///=============== cookTime already check selected checkBox select =============

        cooking_checkBox1.value =   nutritionCustomSingleModel!.value.cookTime!.contains("15");
        cooking_checkBox2.value =  nutritionCustomSingleModel!.value.cookTime!.contains("30");
        cooking_checkBox3.value =   nutritionCustomSingleModel!.value.cookTime!.contains("30+");


        ///=============== dietary already check selected checkBox select ====================

        dietary_checkBox1.value =   nutritionCustomSingleModel!.value.dietary!.contains("vegetarian");
        dietary_checkBox2.value =   nutritionCustomSingleModel!.value.dietary!.contains("keto");
        dietary_checkBox3.value =   nutritionCustomSingleModel!.value.dietary!.contains("vegan");
        dietary_checkBox4.value =   nutritionCustomSingleModel!.value.dietary!.contains("paleo");
        dietary_checkBox5.value =   nutritionCustomSingleModel!.value.dietary!.contains("gluten-free");
        dietary_checkBox6.value =   nutritionCustomSingleModel!.value.dietary!.contains("low-calorie");

      refresh();

      }else{

        nutritionCustomSingleModel?.value = NutritionCustomSingleModel();

        ///=============== caloricGoal null value check Unselected checkBox  =============
        goal_checkBox1.value = false;
        goal_checkBox2.value =  false;
        goal_checkBox3.value =  false;
        goal_checkBox4.value =  false;

        ///=============== cookTime null value check Unselected checkBox  =============

        cooking_checkBox1.value =  false;
        cooking_checkBox2.value = false;
        cooking_checkBox3.value = false;


        ///=============== dietary null value check Unselected checkBox   ====================

        dietary_checkBox1.value = false;
        dietary_checkBox2.value = false;
        dietary_checkBox3.value = false;
        dietary_checkBox4.value = false;
        dietary_checkBox5.value = false;
        dietary_checkBox6.value = false;

        refresh();
      }

      debugPrint("nutritionCustomSingleModel:${nutritionCustomSingleModel?.value.toJson()}");
      EasyLoading.dismiss();

    } else {
      EasyLoading.dismiss();

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



  ///======================================>> post meal plan create Api <<================================
  final storage = GetStorage();

  RxBool nutritionMalePlanCreateLoading = false.obs;

  Future<void> postNutritionMealPlanCreate(List<String>goalList,List<String>cookingList,List<String>dietaryList, String day) async{

    EasyLoading.show(dismissOnTap: false, maskType: EasyLoadingMaskType.custom);


    var body = jsonEncode({
      "caloric_goal":goalList,
      "cook_time": cookingList,
      "dietary":dietaryList,
      "days": day
    });

   // debugPrint("goalList:${goalList}   cookingList:${cookingList}   cookingList:${dietaryList}  day:${"$day"} body:${body}");

    var response = await ApiClient.postData(ApiUrl.nutritionMealPlanWorkOut ,body);

    if (response.statusCode == 201) {
      nutritionMalePlanCreateLoading.value = false;
      refresh();
      EasyLoading.dismiss();
      showCustomSnackBar(response.body["message"]!, isError: false);

      debugPrint("nutritionMalePlanCreateLoading:${response.body["message"]}");

      getNutritionMealPlanShow(day);
      refresh();

      //Get.toNamed(AppRoutes.RecipeMealPlanCreateScreen);
      Get.offNamed(AppRoutes.nutritionScreen);
    } else {
      EasyLoading.dismiss();
      nutritionMalePlanCreateLoading.value = false;
      refresh();

      if (response.statusText == ApiClient.somethingWentWrong) {
        showCustomSnackBar(AppStrings.checknetworkconnection, isError: true);

        return;
      } else {
        ApiChecker.checkApi(response);
        return;
      }
    }
  }


  ///======================================>> post meal plan Update Api <<================================
  Future<void> putNutritionMealPlanUpdate(List<String>goalList,List<String>cookingList,List<String>dietaryList, String day,String update_id) async{

    EasyLoading.show(dismissOnTap: false, maskType: EasyLoadingMaskType.custom);


    var body = jsonEncode({
      "caloric_goal":goalList,
      "cook_time": cookingList,
      "dietary":dietaryList,
      "days": day
    });


    var response = await ApiClient.patchData(ApiUrl.getSingeNutritionMealPlanUpdate(id: update_id) ,body);

    if (response.statusCode == 200) {
      nutritionMalePlanCreateLoading.value = false;
      refresh();
      EasyLoading.dismiss();
      showCustomSnackBar(response.body["message"]!, isError: false);

      debugPrint("nutritionMalePlanCreateLoading:${response.body["message"]}");

      getNutritionMealPlanShow(day);
      refresh();

      Get.offNamed(AppRoutes.nutritionScreen);

    } else {
      EasyLoading.dismiss();
      nutritionMalePlanCreateLoading.value = false;
      refresh();

      if (response.statusText == ApiClient.somethingWentWrong) {
        showCustomSnackBar(AppStrings.checknetworkconnection, isError: true);

        return;
      } else {
        ApiChecker.checkApi(response);
        return;
      }
    }
  }





  ///======================================>> Get customize-nutrition-plan/user-customize/ Day  <<================================

  RxList<CustomNutritionDayModel> customNutritionPlanDayList = <CustomNutritionDayModel>[].obs;

  Future<void> getCustomNutritionPlanDayList(String day) async{

    EasyLoading.show(dismissOnTap: true, maskType: EasyLoadingMaskType.custom);

    var response = await ApiClient.getData(ApiUrl.getNutritionCustomizePlanDay(day: day));

    if (response.statusCode == 200) {

      if(response.body["data"]!=null){

        customNutritionPlanDayList.value = List.from(response.body["data"].map((m)=> CustomNutritionDayModel.fromJson(m)));
        EasyLoading.dismiss();
      }


      debugPrint("customNutritionPlanDayList:${customNutritionPlanDayList.length.toString()}");
      EasyLoading.dismiss();
      refresh();

    } else {

      if (response.statusText == ApiClient.somethingWentWrong) {
        showCustomSnackBar(AppStrings.checknetworkconnection, isError: true);
        EasyLoading.dismiss();

        refresh();
        return;
      } else {

        EasyLoading.dismiss();
        ApiChecker.checkApi(response);

        refresh();
        return;
      }
    }
  }


  @override
  void onInit() {
    super.onInit();

    getRecipeNutritionBreakfastList();

    getRecipeNutritionLunchList();

   getRecipeNutritionDinnerList();
  }
}
