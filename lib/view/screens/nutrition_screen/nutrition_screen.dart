// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:fitness_training_app/core/app_routes/app_routes.dart';
import 'package:fitness_training_app/service/api_url.dart';
import 'package:fitness_training_app/utils/ToastMsg/toast_message.dart';
import 'package:fitness_training_app/utils/app_colors/app_colors.dart';
import 'package:fitness_training_app/utils/app_const/app_const.dart';
import 'package:fitness_training_app/utils/app_icons/app_icons.dart';
import 'package:fitness_training_app/utils/app_strings/app_strings.dart';
import 'package:fitness_training_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:fitness_training_app/view/components/custom_image/custom_image.dart';
import 'package:fitness_training_app/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:fitness_training_app/view/components/custom_text/custom_text.dart';
import 'package:fitness_training_app/view/screens/meal_plan_screen/meal_plan_screen.dart';
import 'package:fitness_training_app/view/screens/nutrition_screen/inner_widget/custom_card.dart';
import 'package:fitness_training_app/view/screens/nutrition_screen/inner_widget/custom_nutrition_container.dart';
import 'package:fitness_training_app/view/screens/nutrition_screen/nutrition_controller/nutrition_controller.dart';
import 'package:fitness_training_app/view/screens/support_screen/subscription_controller/SubscriptionController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NutritionScreen extends StatelessWidget {
  NutritionScreen({super.key});

  final NutritionController controller = Get.find<NutritionController>();

  final SubscriptionController subscriptionController = Get.find<SubscriptionController>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarContent: AppStrings.nutrition,showLeading: true),
      body: Obx(() {

          return Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 8.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  ///================== Nutrient Week Challenge And Targeted Plan =========

                  Container(
                    height: 50.h,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: AppColors.grey06,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:
                            List.generate(controller.tabNamelist.length, (index) {
                          return GestureDetector(
                            onTap: (){
                              controller.currentIndex.value = index;
                              controller.update();
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width / 2.4,
                            //  height: 50.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                color: controller.currentIndex.value == index
                                    ? AppColors.lightRed2
                                    : AppColors.grey06,
                              ),
                              child: CustomText(
                                text: controller.tabNamelist[index],
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.black,
                              ),
                            ),
                          );
                        })),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),

                  if (controller.currentIndex.value == 0)
                  ///==============NEw Recipes ===============
                    Align(
                    alignment: Alignment.topLeft,
                    child: CustomText(
                      text: AppStrings.newRecipes,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: AppColors.white,
                      bottom: 20.h,
                    ),
                  ),

                  ///=============== Nutrition Container ========
                  if (controller.currentIndex.value == 0)
                    CustomNutritionContainer(),

                  ///============== breakfast===============
                  if (controller.currentIndex.value == 0)

                    controller.recipesNutritionBreakfastList.isNotEmpty?
                    Align(
                    alignment: Alignment.topLeft,
                    child: CustomText(
                      text: AppStrings.breakfast,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: AppColors.white,
                      bottom: 10.h,
                      top: 15.h,
                    ),
                  ):Align(
                        alignment: Alignment.topLeft,
                        child: CustomText(
                          text: "Breakfast Data is Not Available",
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: AppColors.white,
                          bottom: 10.h,
                          top: 15.h,
                        )),

                  ///============ Nutrition Recipes Breakfast api fetch ============================
                  if (controller.currentIndex.value == 0)
                    Align(
                      alignment: Alignment.topLeft,
                      child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          children: List.generate(controller.recipesNutritionBreakfastList.length, (index) {
                       // return CustomCard();

                       final recipeBreakfastModel = controller.recipesNutritionBreakfastList[index];

                        return GestureDetector(
                          onTap: (){

                            if(subscriptionController.mySubscriptionShow.value.packageData!.accessItems!.contains("nutrition")){

                              Get.toNamed(AppRoutes.recipeIngredientsScreen,
                                  arguments: [
                                    {
                                      "uid": recipeBreakfastModel.recipeId,
                                    },
                                  ]
                              );

                            }else{

                              showCustomSnackBar("Subscription Nutrition Not purchased!!..", isError: true);
                            }

                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Container(
                              width: 100.w,
                              height: 150.h,
                              child: Column(
                                children: [

                                  ///========================== Nutrition Image ==============
                                  CustomNetworkImage(
                                  //  imageUrl: AppConstants.ntrition,
                                    imageUrl: "${recipeBreakfastModel.recipeprogrammesData?.img??""}",
                                    height: 100.h,
                                    width: 100.w,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  SizedBox(
                                    height: 4.h,
                                  ),

                                  ///================== Title Name ==================
                                  CustomText(
                                   // text: AppStrings.avocadoToastWithEgg,
                                    text: "${recipeBreakfastModel.recipeprogrammesData?.title}",
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.yellow,
                                    maxLines: 2,
                                    //textAlign: TextAlign.justify,
                                  ),
                                  SizedBox(
                                    height: 4.h,
                                  ),
                                  Row(
                                    children: [
                                      ///================= Time Icon =================
                                      Icon(
                                        Icons.access_time_filled_sharp,
                                        size: 10.h,
                                        color: AppColors.purple,
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      ///================= Mins Text =================
                                      Flexible(
                                        child: CustomText(
                                         // text: AppStrings.mins,
                                          text:"${recipeBreakfastModel.recipeprogrammesData?.duration}",
                                          fontSize: 8,
                                          color: AppColors.white,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 4.w,
                                      ),

                                      ///================= Kcal Icon =================
                                      CustomImage(
                                        imageSrc: AppIcons.kaclIcon,
                                        height: 10.h,
                                        width: 10.w,
                                        imageColor: AppColors.purple,
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),

                                      ///================= cal Text =================
                                      Flexible(
                                        child: CustomText(
                                         // text: AppStrings.cal,
                                          text:"${recipeBreakfastModel.recipeprogrammesData?.energy}"+AppStrings.cal,
                                          fontSize: 8,
                                          color: AppColors.white,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      })),
                        ),
                    ),

                  ///============== lunch ===============
                  if (controller.currentIndex.value == 0)

                    controller.recipesNutritionLunchList.isNotEmpty?
                    Align(
                    alignment: Alignment.topLeft,
                    child: CustomText(
                      text: AppStrings.lunch,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: AppColors.white,
                      bottom: 20.h,
                      top: 15.h,
                    ),
                  ):Align(
                        alignment: Alignment.topLeft,
                        child: CustomText(
                          text: "Lunch Data is Not Available",
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: AppColors.white,
                          bottom: 10.h,
                          top: 15.h,
                        )),

                  ///============ Nutrition Recipes Lunch api fetch ====

                  if (controller.currentIndex.value == 0)

                    Align(
                      alignment: Alignment.topLeft,
                      child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          children: List.generate(controller.recipesNutritionLunchList.length, (index) {

                            final lunchModel = controller.recipesNutritionLunchList[index];
                        return GestureDetector(
                          onTap: (){

                            if(subscriptionController.mySubscriptionShow.value.packageData!.accessItems!.contains("nutrition")){

                              Get.toNamed(AppRoutes.recipeIngredientsScreen,
                                  arguments: [
                                    {
                                      "uid": lunchModel.recipeId,
                                    },
                                  ]
                              );
                            }else{

                              showCustomSnackBar("Subscription Nutrition Not purchased!!..", isError: true);
                            }

                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Container(
                              width: 100.w,
                              height: 150.h,
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [

                                  ///========================== Ntrition Image ==============
                                  CustomNetworkImage(
                                    //  imageUrl: AppConstants.ntrition,
                                    imageUrl: "${lunchModel.recipeprogrammesData?.img??""}",
                                    height: 100.h,
                                    width: 100.w,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  SizedBox(
                                    height: 4.h,
                                  ),
                                  ///================== Title Name ==================
                                  Flexible(
                                    child: CustomText(
                                      // text: AppStrings.avocadoToastWithEgg,
                                      text: "${lunchModel.recipeprogrammesData?.title}",
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.yellow,
                                      maxLines: 2,
                                      //textAlign: TextAlign.justify,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 4.h,
                                  ),
                                  Row(
                                    children: [
                                      ///================= Time Icon =================
                                      Icon(
                                        Icons.access_time_filled_sharp,
                                        size: 10.h,
                                        color: AppColors.purple,
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),

                                      ///================= Mains Text =================
                                      Flexible(
                                        child: CustomText(
                                          // text: AppStrings.mins,
                                          text:"${lunchModel.recipeprogrammesData?.duration}",
                                          fontSize: 8,
                                          color: AppColors.white,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),

                                      SizedBox(
                                        width: 4.w,
                                      ),

                                      ///================= Kcal Icon =================
                                      CustomImage(
                                        imageSrc: AppIcons.kaclIcon,
                                        height: 10.h,
                                        width: 10.w,
                                        imageColor: AppColors.purple,
                                      ),

                                      SizedBox(
                                        width: 5.w,
                                      ),

                                      ///================= cal Text =================
                                      Flexible(
                                        child: CustomText(
                                          // text: AppStrings.cal,
                                          text:"${lunchModel.recipeprogrammesData?.energy}"+AppStrings.cal,
                                          fontSize: 8,
                                          color: AppColors.white,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      })),
                    ),
                    ),


                   ///============== dinner  ===============
                  if (controller.currentIndex.value == 0)

                controller.recipesNutritionDinnerList.isNotEmpty? Align(
                    alignment: Alignment.topLeft,
                    child: CustomText(
                      text: AppStrings.dinner,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: AppColors.white,
                      bottom: 10.h,
                      top: 15.h,
                    ),
                  ):Align(
                         alignment: Alignment.topLeft,
                         child: CustomText(
                           text: "Dinner Data is Not Available",
                           fontSize: 20,
                           fontWeight: FontWeight.w700,
                           color: AppColors.white,
                           bottom: 10.h,
                           top: 15.h,
                         )),


                  ///============ Custom Container Dinner ====
                 if (controller.currentIndex.value == 0)
                    Align(
                      alignment: Alignment.topLeft,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                            children: List.generate(controller.recipesNutritionDinnerList.length, (index) {

                              final dinner_Model = controller.recipesNutritionDinnerList[index];

                              return GestureDetector(
                                onTap: (){

                                  if(subscriptionController.mySubscriptionShow.value.packageData!.accessItems!.contains("nutrition")){

                                    Get.toNamed(AppRoutes.recipeIngredientsScreen,
                                        arguments: [
                                          {
                                            "uid": dinner_Model.recipeId,
                                          },
                                        ]
                                    );
                                  }else{

                                    showCustomSnackBar("Subscription Nutrition Not purchased!!..", isError: true);
                                  }

                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Container(
                                    width: 100.w,
                                    height: 150.h,
                                    child: Column(
                                      // mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [

                                        ///========================== Ntrition Image ==============
                                        CustomNetworkImage(
                                        //imageUrl: AppConstants.ntrition,
                                          imageUrl: "${dinner_Model.recipeprogrammesData?.img??""}",
                                          height: 100.h,
                                          width: 100.w,
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                        SizedBox(
                                          height: 4.h,
                                        ),
                                        ///================== Title Name ==================
                                        Flexible(
                                          child: CustomText(
                                            // text: AppStrings.avocadoToastWithEgg,
                                            text: "${dinner_Model.recipeprogrammesData?.title}",
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.yellow,
                                            maxLines: 2,
                                            //textAlign: TextAlign.justify,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 4.h,
                                        ),
                                        Row(
                                          children: [
                                            ///================= Time Icon =================
                                            Icon(
                                              Icons.access_time_filled_sharp,
                                              size: 10.h,
                                              color: AppColors.purple,
                                            ),
                                            SizedBox(
                                              width: 5.w,
                                            ),

                                            ///================= Mins Text =================
                                            Flexible(
                                              child: CustomText(
                                                // text: AppStrings.mins,
                                                text:"${dinner_Model.recipeprogrammesData?.duration}",
                                                fontSize: 8,
                                                color: AppColors.white,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),

                                            SizedBox(
                                              width: 4.w,
                                            ),

                                            ///================= Kcal Icon =================
                                            CustomImage(
                                              imageSrc: AppIcons.kaclIcon,
                                              height: 10.h,
                                              width: 10.w,
                                              imageColor: AppColors.purple,
                                            ),

                                            SizedBox(
                                              width: 5.w,
                                            ),

                                            ///================= cal Text =================
                                            Flexible(
                                              child: CustomText(
                                                // text: AppStrings.cal,
                                                text:"${dinner_Model.recipeprogrammesData?.energy}"+AppStrings.cal,
                                                fontSize: 8,
                                                color: AppColors.white,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            })),
                      ),
                    ),


                  if (controller.currentIndex.value == 1)  MealPlanScreen(),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
