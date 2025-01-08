// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:fitness_training_app/helper/time_converter/time_converter.dart';
import 'package:fitness_training_app/service/api_url.dart';
import 'package:fitness_training_app/utils/ToastMsg/toast_message.dart';
import 'package:fitness_training_app/utils/app_colors/app_colors.dart';
import 'package:fitness_training_app/utils/app_strings/app_strings.dart';
import 'package:fitness_training_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:fitness_training_app/view/components/custom_loader/custom_loader.dart';
import 'package:fitness_training_app/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:fitness_training_app/view/components/custom_text/custom_text.dart';
import 'package:fitness_training_app/view/screens/favorite-screen/favorite_controller/favorite_controller.dart';
import 'package:fitness_training_app/view/screens/home_screen/home_controller/home_controller.dart';
import 'package:fitness_training_app/view/screens/workout_resource_screen/inner_widget/custom_container.dart';
import 'package:fitness_training_app/view/screens/workout_resource_screen/inner_widget/custom_round_container.dart';
import 'package:fitness_training_app/view/screens/workout_screen/model/WorkoutLatestRespons.dart';
import 'package:fitness_training_app/view/screens/workout_screen/model/WorkoutResponse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class WorkoutResourceScreen extends StatefulWidget {
  WorkoutResourceScreen({super.key});

  @override
  State<WorkoutResourceScreen> createState() => _WorkoutResourceScreenState();
}

class _WorkoutResourceScreenState extends State<WorkoutResourceScreen> {

  // final WorkoutLatestResponse workOutLatestModel= Get.arguments;

  var argumentData = Get.arguments;

  final HomeController homeController = Get.find<HomeController>();

  final FavoriteController favoriteController = Get.find<FavoriteController>();

  @override
  void initState() {
    super.initState();

     if(argumentData[0]["uid"]!=""){

      homeController.getWorkOutVidoeListById(argumentData[0]["uid"]);
    }
    favoriteController.getWorkOutFavoriteList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarContent: AppStrings.workoutResource,showLeading: true,),
      body: Obx(
         () {
          return Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [

               /*   CustomContainer(
                      workoutTitle: argumentData[0]['title'],
                      workoutDuration: argumentData[0]['duration'],
                      img: argumentData[0]['img'],
                      workoutData_id: argumentData[0]['workoutData_id'],
                      exercises_langth:  argumentData[0]['exercises_langth'],
                   ),
          */


                 /*Obx(
                    ()=> CustomContainer(
                        workoutTitle: "${homeController.workoutTitle.value}",
                        workoutDuration: "${homeController.workoutDuration.value}",
                        img: "${ApiUrl.imageUrl}${homeController.image.value}",
                        workoutData_id: "${homeController.workoutData_id.value}",
                        exercises_langth: "${homeController.workOutVideolist.length}",
                    ),
                  ),*/

          ///===================================== Workout ImageSlider Container ============

                  Stack(
                    children: [

                      CustomNetworkImage(
                        // imageUrl: AppConstants.sliderImage3,
                        imageUrl: "${homeController.image.value}",
                        borderRadius: BorderRadius.circular(20),
                        height: MediaQuery.sizeOf(context).width / 2,
                        width: MediaQuery.sizeOf(context).width,
                        border: Border.all(color: AppColors.lightRed2, width: 2.w),
                      ),
                      Positioned(
                          bottom: 0,
                          child: Container(
                            height: 50.h,
                            width: MediaQuery.sizeOf(context).width,
                            decoration: BoxDecoration(
                                color: AppColors.black.withOpacity(.5),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                )),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Row(
                                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 200,
                                            child: CustomText(
                                              //text: AppStrings.upperBodyExercise,
                                                text: "${homeController.workoutTitle.value}",
                                                color: AppColors.lightRed2,
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          //Icon(Icons.favorite,color: AppColors.grey_1,size: 20,)
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          ///================== Time ===================
                                          Icon(Icons.access_time_filled_sharp,color: AppColors.white,size: 15,),
                                          SizedBox(width: 5.w,),
                                          CustomText(
                                            //text: AppStrings.seconds,
                                              text: DateConverter.convertTimeToMinutes("${homeController.workoutDuration.value}"),
                                              color: AppColors.grey_5,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w400),
                                          SizedBox(width: 15.w,),

                                          ///================== Kcal ===================
                                          Icon(Icons.access_time_filled_sharp,color: AppColors.white,size: 15,),
                                          SizedBox(width: 5.w,),
                                          CustomText(
                                              text: AppStrings.kcal,
                                              color: AppColors.grey_5,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w400),
                                          SizedBox(width: 15.w,),
                                          ///================== Kcal ===================
                                          Icon(Icons.access_time_filled_sharp,color: AppColors.white,size: 15,),
                                          SizedBox(width: 5.w,),
                                          CustomText(
                                              text:"${homeController.workOutVideolist.length}"+ AppStrings.exercise,
                                              color: AppColors.grey_5,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w400),
                                        ],
                                      ),
                                    ],
                                  ),

                                  SizedBox(width: 20.w,),

                                   favoriteController.workOutFavoritelist
                                      .where((element) => element.workoutId == homeController.workoutData_id.value)
                                     .isNotEmpty?
                                  GestureDetector(
                                    onTap: (){
                                      //============= Delete Articles favorite Api ==========
                                   List<String> workOutId = favoriteController.workOutFavoritelist
                                          .where((element) => element.workoutId == homeController.workoutData_id.value)
                                          .map((e) => e.workoutId!)
                                          .toList();

                                      favoriteController.favoriteWorkOutDelete("${workOutId[0]}");

                                    },
                                    child: Icon(
                                      Icons.favorite,
                                      color: AppColors.lightRed,
                                      size: 30,
                                    ),
                                  ):GestureDetector(
                                    onTap: (){//

                                      //=============insert workout favorite Api==========

                                        if(homeController.workoutData_id.value.toString()=="null"){

                                          showCustomSnackBar("WorkOut Data Not Found..", isError: true);

                                        }else{

                                          //=============insert workout favorite Api==========
                                         favoriteController.favoriteWorkOutInsert("${homeController.workoutData_id.value}");
                                        }
                                    },
                                    child: Icon(
                                      Icons.favorite,
                                      color: AppColors.white,
                                      size: 30,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ))
                    ],
                  ),
                     SizedBox(
                     height: 20.h,
                     ),

                  ///================= round1 Text ===============
                  homeController.workOutVideolist.isNotEmpty?  Align(
                        alignment: Alignment.topLeft,
                       child: CustomText(
                        text: AppStrings.round1,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.lightRed,
                      ),
                      ): Align(
                    alignment: Alignment.topLeft,
                    child: CustomText(
                      text: "Exercises Data is Not available",
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.lightRed,
                    ),
                  ),


                  SizedBox(
                    height: 10.h,
                  ),

                  ///================= round1 Container ===============
                  ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: homeController.workOutVideolist.length,
                      itemBuilder: (BuildContext context, index) {

                        return homeController.workOutVideolist[index].round == "1"
                            ? CustomRoundContainer(
                            workListSingleList:
                            homeController.workOutVideolist[index])
                            : SizedBox();
                      }),

                 /*CustomRoundContainer(),
                  CustomRoundContainer(),
                  CustomRoundContainer(),*/

                   ///================= round2 Text ===============
                  homeController.workOutVideolist.isNotEmpty ?Align(
                    alignment: Alignment.topLeft,
                    child: CustomText(
                      text: AppStrings.round2,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.lightRed,
                    ),
                  ):SizedBox(),

                  SizedBox(
                    height: 10.h,
                  ),

                  homeController.workOutVidoeLoading.value?CustomLoader(): ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: homeController.workOutVideolist.length,
                      itemBuilder: (BuildContext context, index) {

                        return homeController.workOutVideolist[index].round == "2"
                            ? CustomRoundContainer(
                            workListSingleList:
                            homeController.workOutVideolist[index])
                            : SizedBox();
                      })

                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
