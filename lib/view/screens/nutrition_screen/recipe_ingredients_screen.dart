// ignore_for_file: prefer_const_constructors

import 'package:fitness_training_app/service/api_url.dart';
import 'package:fitness_training_app/utils/app_colors/app_colors.dart';
import 'package:fitness_training_app/utils/app_const/app_const.dart';
import 'package:fitness_training_app/utils/app_strings/app_strings.dart';
import 'package:fitness_training_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:fitness_training_app/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:fitness_training_app/view/components/custom_text/custom_text.dart';
import 'package:fitness_training_app/view/screens/home_screen/home_controller/home_controller.dart';
import 'package:fitness_training_app/view/screens/home_screen/home_model/recipi_program_model.dart';
import 'package:fitness_training_app/view/screens/nutrition_screen/inner_widget/custom_instruction.dart';
import 'package:fitness_training_app/view/screens/nutrition_screen/inner_widget/custom_protein_card.dart';
import 'package:fitness_training_app/view/screens/nutrition_screen/inner_widget/custom_row_container.dart';
import 'package:fitness_training_app/view/screens/nutrition_screen/nutrition_controller/nutrition_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RecipeIngredientsScreen extends StatelessWidget {
  RecipeIngredientsScreen({super.key});
  final NutritionController controller = Get.find<NutritionController>();

  final RecipiProgramModel item = Get.arguments ;

  final HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; // Cache MediaQuery size

    return Scaffold(
      appBar: CustomAppBar(appBarContent: AppStrings.nutrition),
      body: SingleChildScrollView(
        child: Obx(() {

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 8.0.h),
                  child: Column(
                    children: [

                      /// Image at the top
                      CustomNetworkImage(
                       // imageUrl: AppConstants.ntrition1,
                        imageUrl: "${ApiUrl.imageUrl}${item.img}",
                        height: size.height / 4.5,
                        width: size.width,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      SizedBox(height: 20.h),

                      /// Content Container
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 0.0.w,vertical: 20.h),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    /// Title Row (Avocado Toast with Egg and Time)
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [

                                        CustomText(
                                          //text: AppStrings.avocadoToastWithEgg,
                                          text: "${item.title}",
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.black,
                                          bottom: 10.h,
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.access_time_filled_sharp,
                                              size: 10,
                                              color: AppColors.grey_1,
                                            ),
                                            SizedBox(width: 5.w),
                                            CustomText(
                                             // text: AppStrings.mins,
                                              text: "${item.duration}",
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.grey_1,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    CustomText(
                                       //text: AppStrings.avocadoToastWithEggTitle,
                                        text: "${item.description}",
                                      fontSize: 12.sp,textAlign: TextAlign.start,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.grey_1,
                                      maxLines: 3,
                                      bottom: 10.h,
                                    ),

                                    /// Nutritional Information
                                    CustomText(
                                      text: AppStrings.nutritionalInformation,
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.black,
                                    ),
                                    SizedBox(height: 20.h),

                                    CustomProteinCard(item),
                                    SizedBox(height: 20.h),

                                  ],
                                ),
                              ),
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
                                    List.generate(controller.tabIngredientslist.length, (index) {
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
                                            text: controller.tabIngredientslist[index],
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.black,
                                          ),
                                        ),
                                      );
                                    })),
                              ),
                              if (controller.currentIndex.value == 0)
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                  children: [

                                    /// Nutrient Week Challenge and Targeted Plan

                                    /// Ingredients Section
                                    SizedBox(height: 20.h),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomText(
                                          text: AppStrings.ingredients,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.black,
                                        ),
                                        Row(
                                          children: [
                                            CustomText(
                                              text: AppStrings.servings,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.black,
                                            ),
                                            SizedBox(width: 8.w),
                                            _buildCounterButton(Icons.remove, context),
                                            SizedBox(width: 8.w),
                                            CustomText(
                                              text: "0",
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w700,
                                              color: AppColors.black,
                                            ),
                                            SizedBox(width: 8.w),
                                            _buildCounterButton(Icons.add, context),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 20.h),

                                    /// Dynamic Ingredients List
                                    ListView.builder(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: item.ingredientsData?.length, // Adjust based on data
                                      itemBuilder: (context, index) {
                                        return CustomRowContainer(item.ingredientsData![index]);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              if (controller.currentIndex.value == 1)


                                 CustomInstruction(item),

                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
        ),
      ),
    );
  }

  /// Helper function for Add/Remove buttons
  Widget _buildCounterButton(IconData icon, BuildContext context) {
    return Container(
      height: 14.h,
      width: 14.w,
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.black, width: 1),
      ),
      child: Icon(icon, color: AppColors.black, size: 10.sp),
    );
  }
}