import 'package:fitness_training_app/core/app_routes/app_routes.dart';
import 'package:fitness_training_app/service/api_url.dart';
import 'package:fitness_training_app/utils/ToastMsg/toast_message.dart';
import 'package:fitness_training_app/utils/app_colors/app_colors.dart';
import 'package:fitness_training_app/utils/app_strings/app_strings.dart';
import 'package:fitness_training_app/view/components/custom_loader/custom_loader.dart';
import 'package:fitness_training_app/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:fitness_training_app/view/components/custom_text/custom_text.dart';
import 'package:fitness_training_app/view/screens/favorite-screen/favorite_controller/favorite_controller.dart';
import 'package:fitness_training_app/view/screens/home_screen/home_controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class CustomWorkFavoriteScreen extends StatefulWidget {
  final String name;
  final String minutes;
  final String kcal;
  final String exercise;
  final String image;
  final String uid;
  final String programme_id;

  CustomWorkFavoriteScreen(
      {super.key,
        required this.name,
        required this.minutes,
        required this.kcal,
        required this.exercise,
        required this.image,
        required this.uid,
        required this.programme_id,
      });

  @override
  State<CustomWorkFavoriteScreen> createState() => _CustomWorkFavoriteScreenState();
}

class _CustomWorkFavoriteScreenState extends State<CustomWorkFavoriteScreen> {

  final HomeController homeController = Get.find<HomeController>();

  final FavoriteController favoriteController = Get.find<FavoriteController>();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){

       Get.toNamed(AppRoutes.workoutResourceScreen,
            arguments: [
              {
                "uid": widget.programme_id,
              },
            ]);
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height / 6.5,
          decoration: BoxDecoration(
            color: AppColors.grey_3,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomText(
                      text: widget.name,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.black,
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Flexible(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ///===================Time=================
                          Row(
                            children: [
                              Icon(
                                Icons.access_time_filled_sharp,
                                color: AppColors.black,
                                size: 15,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              CustomText(
                                text: widget.minutes,
                                color: AppColors.black,
                                fontSize: 14.sp,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 20.w,
                          ),

                          ///=================Kcal================
                          Row(
                            children: [
                            /*  Icon(
                                Icons.keyboard_command_key_rounded,
                                color: AppColors.black,
                                size: 15,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              SizedBox(
                                width: 50,
                                child: CustomText(
                                  text: kcal,
                                  color: AppColors.black,
                                  fontSize: 14.sp,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),*/
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),

                    ///=================extension================
                    Flexible(
                      child: Row(
                        children: [
                       /*   Icon(
                            Icons.extension,
                            color: AppColors.black,
                            size: 15,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          CustomText(
                            text: exercise,
                            color: AppColors.black,
                            fontSize: 14.sp,
                          ),*/

                          Icon(
                            Icons.keyboard_command_key_rounded,
                            color: AppColors.black,
                            size: 15,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          CustomText(
                            text: widget.kcal+" ${AppStrings.kcal}",
                            color: AppColors.black,
                            fontSize: 14.sp,
                          ),
                        ],
                      ),
                    )
                  ],
                ),

                ///================== Slider Image ==================
                Flexible(
                  child: Stack(
                    children: [
                      CustomNetworkImage(
                        imageUrl: widget.image,
                        width: MediaQuery.sizeOf(context).width / 2.7,
                        height: MediaQuery.sizeOf(context).height / 5,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                      ),
                      Positioned(
                        top: 0,
                        right: 10,
                        child: PopupMenuButton(
                          child:  Icon(
                            Icons.more_vert,
                            color: AppColors.brinkPink,
                            size: 25.sp,
                          ),

                          itemBuilder: (BuildContext context) {
                            return [
                              PopupMenuItem<String>(
                                value: 'Item1',
                                child:  Text('Delete'),
                                onTap: (){

                                  //===============================    workOut favorite Delete  By Id Api=============================
                                  favoriteController.workOutFavoriteDeleteLoading.value?CustomLoader(): favoriteController.favoriteWorkOutDelete(widget.uid);
                                },
                              ),
                            ];
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}