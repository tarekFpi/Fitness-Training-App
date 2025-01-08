// ignore_for_file: prefer_const_constructors

import 'package:fitness_training_app/helper/time_converter/time_converter.dart';
import 'package:fitness_training_app/service/api_url.dart';
import 'package:fitness_training_app/utils/ToastMsg/toast_message.dart';
import 'package:fitness_training_app/utils/app_colors/app_colors.dart';
import 'package:fitness_training_app/utils/app_const/app_const.dart';
import 'package:fitness_training_app/utils/app_strings/app_strings.dart';
import 'package:fitness_training_app/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:fitness_training_app/view/components/custom_text/custom_text.dart';
import 'package:fitness_training_app/view/screens/favorite-screen/favorite_controller/favorite_controller.dart';
import 'package:fitness_training_app/view/screens/workout_screen/model/WorkoutLatestRespons.dart';
import 'package:fitness_training_app/view/screens/workout_screen/model/WorkoutResponse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomContainer extends StatefulWidget {

  String workoutTitle="";
  String workoutDuration="";
  String img="";
  String workoutData_id="";
  String exercises_langth="";

   CustomContainer({super.key,required this.workoutTitle,required this.workoutDuration,required this.img,
     required this.workoutData_id,
     required this.exercises_langth,
   });

  @override
  State<CustomContainer> createState() => _CustomContainerState();
}
class _CustomContainerState extends State<CustomContainer> {

  final FavoriteController favoriteController = Get.find<FavoriteController>();

  @override
  Widget build(BuildContext context) {
    return  Obx((){
      return Stack(
        children: [

          CustomNetworkImage(
            // imageUrl: AppConstants.sliderImage3,
            imageUrl: widget.img==""?AppConstants.sliderImage3:widget.img,
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
                              CustomText(
                                //text: AppStrings.upperBodyExercise,
                                  text: "${widget.workoutTitle}",
                                  color: AppColors.lightRed2,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600),
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
                                  text: DateConverter.convertTimeToMinutes(widget.workoutDuration),
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
                                  text:"${widget.exercises_langth} "+ AppStrings.exercise,
                                  color: AppColors.grey_5,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400),

                            ],
                          ),
                        ],
                      ),
                      SizedBox(width: 20.w,),

                      favoriteController.workOutFavoritelist
                          .where((element) => element.workoutId == widget.workoutData_id)
                          .isNotEmpty?  GestureDetector(
                        onTap: (){

                          //============= Delete workout favorite Api ==========

                          /*       List<String> articleId = favoriteController.articleFavoritelist
                            .where((element) => element.articleId == widget.workoutData_id)
                            .map((e) => e.articleId!)
                            .toList();

                        favoriteController.favoriteArticlesDelete("${articleId[0]}");
*/
                        },
                        child: Icon(
                          Icons.favorite,
                          color: AppColors.lightRed,
                          size: 30,
                        ),
                      ):GestureDetector(
                        onTap: (){

                          if(widget.workoutData_id.toString()=="null"){

                            showCustomSnackBar("WorkOut Data Not Found..", isError: true);

                          }else{

                            //=============insert workout favorite Api==========
                            favoriteController.favoriteWorkOutInsert("${widget.workoutData_id}");

                          }

                          setState(() {

                          });
                          //   showCustomSnackBar("workoutData_id:${widget.workoutData_id}", isError: true);
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
      );
    });
  }
}
