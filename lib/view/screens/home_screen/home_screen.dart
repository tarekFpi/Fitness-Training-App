// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:fitness_training_app/core/app_routes/app_routes.dart';
import 'package:fitness_training_app/service/api_url.dart';
import 'package:fitness_training_app/utils/ToastMsg/toast_message.dart';
import 'package:fitness_training_app/utils/app_colors/app_colors.dart';
import 'package:fitness_training_app/utils/app_const/app_const.dart';
import 'package:fitness_training_app/utils/app_icons/app_icons.dart';
import 'package:fitness_training_app/utils/app_strings/app_strings.dart';
import 'package:fitness_training_app/view/components/custom_app_bar/custom_app_bar_title.dart';
import 'package:fitness_training_app/view/components/custom_button/custom_button.dart';
import 'package:fitness_training_app/view/components/custom_nav_bar/custom_navbar.dart';
import 'package:fitness_training_app/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:fitness_training_app/view/components/custom_text/custom_text.dart';
import 'package:fitness_training_app/view/components/general_error.dart';
import 'package:fitness_training_app/view/screens/home_screen/home_controller/home_controller.dart';
import 'package:fitness_training_app/view/screens/home_screen/inner_widget/custom_icon_widget.dart';
import 'package:fitness_training_app/view/screens/home_screen/inner_widget/custom_workout_card.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../helper/time_converter/time_converter.dart';
import '../../components/home_simmer_efect/home_simmer_efect.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController homeController = Get.find<HomeController>();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarTitle(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Obx(() {
            switch (homeController.homeStatus.value) {
              case Status.loading:
                return HomeScreenShimmer();
              case Status.error:
                return GeneralErrorScreen(
                  status: homeController.homeStatus.value,
                  onTap: () {},
                );
              case Status.internetError:
                return Center(
                  child: GeneralErrorScreen(
                    status: homeController.homeStatus.value,
                    onTap: () {

                    },
                  ),
                );
              case Status.completed:
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomText(
                      text: AppStrings.nameTitle,
                      fontSize: 14,
                      color: AppColors.grey_1,
                      maxLines: 2,
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ///================== pick workout ==================
                        CustomIconWidget(
                          onTap: () {
                            Get.toNamed(AppRoutes.workoutScreen);
                          },
                          imageSrc: AppIcons.icon1,
                          title: AppStrings.pickWorkout,
                        ),
                        //SizedBox(width: 20.w,),
                        Container(
                          height: 40.h,
                          width: .5.w,
                          color: AppColors.lightRed,
                        ),

                        ///================== trackMyProgress ==================
                        CustomIconWidget(
                          onTap: () {
                            Get.toNamed(AppRoutes.progressTrackingScreen);
                          },
                          imageSrc: AppIcons.icon2,
                          title: AppStrings.trackMyProgress,
                        ),
                        //SizedBox(width: 20.w,),
                        Container(
                          height: 40.h,
                          width: .5.w,
                          color: AppColors.lightRed,
                        ),

                        ///================== pick Recipe ==================
                        CustomIconWidget(
                          onTap: () {
                            Get.toNamed(AppRoutes.nutritionScreen);
                          },
                          imageSrc: AppIcons.icon3,
                          title: AppStrings.pickRecipe,
                        ),
                        // SizedBox(width: 20.w,),
                        Container(
                          height: 40.h,
                          width: .5.w,
                          color: AppColors.lightRed,
                        ),

                        ///================== community ==================
                        CustomIconWidget(
                          onTap: () {
                            Get.toNamed(AppRoutes.communityScreen);
                          },
                          imageSrc: AppIcons.icon4,
                          title: AppStrings.community,
                        ),
                        //SizedBox(width: 20.w,),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width,
                      height: MediaQuery.sizeOf(context).height / 5,
                      decoration: BoxDecoration(
                        color: AppColors.lightRed2,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ///================== workoutProgram Api Data Empty Check default widgets show ==================

                            homeController.workOutLatest?.value == null
                                ? Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ///================== workoutProgram Button  ==================
                                      CustomButton(
                                        onTap: () {},
                                        title: AppStrings.workoutProgram + "1",
                                        width: 116.w,
                                        height: 40.h,
                                        fontSize: 12.sp,
                                        fillColor: AppColors.grey_3,
                                        textColor: AppColors.black,
                                      ),

                                      CustomText(
                                        text: AppStrings.mins,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w300,
                                        color: AppColors.white,
                                      ),

                                      CustomText(
                                        text: AppStrings.gimeGains,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.white,
                                        maxLines: 2,
                                        textAlign: TextAlign.start,
                                        overflow: TextOverflow.ellipsis,
                                      ),

                                      ///================== enrollNow Button ==================
                                      CustomButton(
                                        onTap: () {
                                         /* Get.toNamed(
                                              AppRoutes.workoutResourceScreen);*/

                                          showCustomSnackBar("Data Not Found..", isError: true);
                                        },
                                        title: AppStrings.enrollNow,
                                        width: 100.w,
                                        height: 35.h,
                                        fontSize: 12.sp,
                                        fillColor: AppColors.black,
                                        textColor: AppColors.white,
                                      ),
                                    ],
                                  )
                                :

                                ///================== workoutProgram  ==================

                                Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ///================== workoutProgram Button ==================
                                      CustomButton(
                                        onTap: () {},
                                        title:
                                            "${homeController.workOutLatest?.value?.toString()}",
                                        //title: "${homeController.workOutLatest.value.title}",
                                        width: 116.w,
                                        height: 40.h,
                                        fontSize: 12.sp,
                                        fillColor: AppColors.grey_3,
                                        textColor: AppColors.black,
                                      ),

                                      Obx(
                                        () => CustomText(
                                          //  text: AppStrings.mins,
                                          text: DateConverter
                                              .convertTimeToMinutes(
                                                  homeController.workOutLatest
                                                          ?.value?.duration ??
                                                      ''),
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w300,
                                          color: AppColors.white,
                                        ),
                                      ),

                                      Obx(
                                        () => SizedBox(
                                          width: 200.w,
                                          child: CustomText(
                                            text:
                                                "${homeController.workOutLatest?.value?.description}",
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w700,
                                            color: AppColors.white,
                                            maxLines: 2,
                                            textAlign: TextAlign.start,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ),

                                      ///================== enrollNow Button ==================
                                      CustomButton(
                                        onTap: () {
                                          Get.toNamed(
                                              AppRoutes.workoutResourceScreen,
                                              arguments:
                                                  /*homeController.workOutLatest.value.id*/
                                                  [
                                                {
                                                  "uid": homeController
                                                      .workOutLatest?.value?.id,
                                                  "title": homeController
                                                      .workOutLatest
                                                      ?.value
                                                      ?.title,
                                                  "duration": homeController
                                                      .workOutLatest
                                                      ?.value
                                                      ?.duration,
                                                  "img":
                                                      "${ApiUrl.imageUrl}${homeController.workOutLatest?.value?.img ?? ""}",
                                                },
                                              ]);
                                        },
                                        title: AppStrings.enrollNow,
                                        width: 100.w,
                                        height: 35.h,
                                        fontSize: 12.sp,
                                        fillColor: AppColors.black,
                                        textColor: AppColors.white,
                                      ),
                                    ],
                                  ),

                            ///================== Slider Image ==================


            homeController.workOutLatest?.value == null?

                CustomNetworkImage(
                                  imageUrl: AppConstants.sliderImage1,
                                  //  imageUrl: "${ApiUrl.imageUrl}${homeController.workOutlist[0].img??""}",
                                  width: MediaQuery.sizeOf(context).width / 3,
                                  height: MediaQuery.sizeOf(context).height / 5,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(150),
                                      bottomLeft: Radius.circular(150),
                                      topRight: Radius.circular(20),
                                      bottomRight: Radius.circular(20)),
                                ):

                           CustomNetworkImage(
                                  // imageUrl: AppConstants.sliderImage1,
                                  imageUrl:
                                      "${ApiUrl.imageUrl}${homeController.workOutLatest?.value?.img ?? ""}",
                                  width: MediaQuery.sizeOf(context).width / 3,
                                  height: MediaQuery.sizeOf(context).height / 5,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(150),
                                      bottomLeft: Radius.circular(150),
                                      topRight: Radius.circular(20),
                                      bottomRight: Radius.circular(20)),
                  ),

                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),

                    ///================== Workouts ==================
                    Obx(
                      () => homeController.workOutlist.isEmpty
                          ? Text("")
                          : Align(
                              alignment: Alignment.topLeft,
                              child: CustomText(
                                text: AppStrings.workouts,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColors.white,
                              ),
                            ),
                    ),

                    SizedBox(
                      height: 10.h,
                    ),

                    ///================== CustomWorkoutCard ==================
                    Align(
                      alignment: Alignment.topLeft,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                              homeController.workOutlist.length, (index) {
                            final model = homeController.workOutlist[index];

                            return CustomWorkoutCard(
                              imageSrc: "${ApiUrl.imageUrl}${model.img ?? ""}",
                              title: model.title ?? "",
                              subtitle: model.workoutData?.description ?? "",
                              onTap: () {
                                Get.toNamed(AppRoutes.workoutResourceScreen,
                                    arguments: [
                                      {
                                        "uid": model.id,
                                        "title": model.title,
                                        "duration": model.workoutData?.duration,
                                        "img":
                                            "${ApiUrl.imageUrl}${model.img ?? ""}",
                                      },
                                    ]);
                              },
                            );
                          }),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),

                    ///================== Workouts ==================
                    Align(
                      alignment: Alignment.topLeft,
                      child: CustomText(
                        text: AppStrings.nutriton,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.white,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),

                    ///================== Nutrition Card ==================
                    Align(
                      alignment: Alignment.topLeft,
                      child: SingleChildScrollView(
                        dragStartBehavior: DragStartBehavior.start,
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: List.generate(
                              homeController.recipiProgramModelList.length,
                              (index) {
                            final model =
                                homeController.recipiProgramModelList[index];
                            return CustomWorkoutCard(
                              imageSrc: model.img ?? '',
                              title: model.title ?? '',
                              subtitle: model.description ?? '',
                              onTap: () {
                                Get.toNamed(AppRoutes.recipeIngredientsScreen,
                                    arguments: model);
                              },
                            );
                          }),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                  ],
                );
            }
          }),
        ),
      ),
      bottomNavigationBar: CustomNavbar(
        currentIndex: 0,
      ),
    );
  }
}
