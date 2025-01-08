// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:fitness_training_app/core/app_routes/app_routes.dart';
import 'package:fitness_training_app/helper/time_converter/time_converter.dart';
import 'package:fitness_training_app/service/api_url.dart';
import 'package:fitness_training_app/utils/app_const/app_const.dart';
import 'package:fitness_training_app/utils/app_icons/app_icons.dart';
import 'package:fitness_training_app/view/components/custom_image/custom_image.dart';
import 'package:fitness_training_app/view/components/custom_loader/custom_loader.dart';
import 'package:fitness_training_app/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:fitness_training_app/view/components/custom_text/custom_text.dart';
import 'package:fitness_training_app/view/components/custom_text_field/custom_text_field.dart';
import 'package:fitness_training_app/view/screens/favorite-screen/favorite_controller/favorite_controller.dart';
import 'package:fitness_training_app/view/screens/home_screen/home_controller/home_controller.dart';
import 'package:fitness_training_app/view/screens/search_screen/articaleSearchController.dart';
import 'package:fitness_training_app/view/screens/search_screen/workoutSearchController.dart';
import 'package:fitness_training_app/view/screens/workout_screen/inner_widget/upper_body_container.dart';
import 'package:fitness_training_app/view/screens/notification_screen/inner_widget.dart/custom_notification_tab.dart';
import 'package:fitness_training_app/view/screens/notification_screen/notification_controller/notification_controller.dart';
import 'package:fitness_training_app/view/screens/search_screen/inner_widget/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../../utils/app_colors/app_colors.dart';
import '../../../utils/app_strings/app_strings.dart';
import '../../components/custom_app_bar/custom_app_bar.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  final NotificationController notificationController =
      Get.find<NotificationController>();

  //final HomeController homeController = Get.find<HomeController>();

  final FavoriteController favoriteController = Get.find<FavoriteController>();

  final WorkoutSearchController workoutSearchController = Get.find<WorkoutSearchController>();

  final ArticleSearchController articleSearchController = Get.find<ArticleSearchController>();

  final queryEditingController = TextEditingController();

  String query = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          appBarContent: AppStrings.search,
          showLeading: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w),
          child: Obx(
               () {
              return SingleChildScrollView(
                child: Column(
                  children: [

                    SizedBox(height: 20.h),

                    ///================== Search Text Field =================

                   CustomTextField(
                      textEditingController:queryEditingController,
                      fillColor: AppColors.white,
                    //  hintText: AppStrings.search,
                      hintText: "Search for title...",
                      onChanged: (value){
                        setState(() {
                          query = value;
                        });

                        if(notificationController.curentIndex.value==0){

                          workoutSearchController.searchWorkOutList(value);
                        }

                        if(notificationController.curentIndex.value==1){
                          articleSearchController.searchArticaleList(value);
                        }
                      },

                     /* suffixIcon: const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: CustomImage(imageSrc: AppIcons.search),
                      ),*/
                     suffixIcon: query.isBlank == true || query.isEmpty
                         ? Icon(
                       FluentIcons.search_24_regular,
                       size: 24,
                     )
                         : IconButton(
                         icon: Icon(Icons.close,size: 24,),
                         onPressed: () {
                           setState(() {
                             query = "";
                           });
                           queryEditingController.clear();
                           FocusScope.of(context).unfocus();
                           workoutSearchController.searchWorkOutList("");
                           articleSearchController.searchArticaleList("");
                         }),
                      isDens: true,
                    ),
                    SizedBox(height: 20.h),

                  ///  ======================== Tab ========================
                    CustomNotificationTab(
                        width: 100.w,
                      tabNameList: notificationController.searchList,
                      curentIndex: notificationController.curentIndex.value,
                      onTap: (value){
                        notificationController.curentIndex.value = value;
                      },
                      selectedTextColor: AppColors.white,
                    unselectedTextColor: AppColors.lightRed2,
                    unselectedTabColor: Colors.white,
                    selectedTabColor: AppColors.lightRed2,
                    ),

                   SizedBox(height: 30.h,),

                   ///=================== Search Container =================

                    if (notificationController.curentIndex.value == 0)

                       workoutSearchController.obx((state)=>Column(
                        children: List.generate(state!.length, (index) {

                          final model= state?[index];

                          return GestureDetector(
                            onTap: () {
                              Get.toNamed(AppRoutes.workoutResourceScreen,
                                arguments: [
                                  {
                                    "uid": model?.id,
                                  }
                                ],
                              );
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
                                          SizedBox(
                                            width: 200,
                                            child: CustomText(
                                              text: "${model?.title}",
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.black,
                                              overflow: TextOverflow.ellipsis,
                                            ),
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
                                                      text: DateConverter
                                                          .convertTimeToMinutes(
                                                          model?.workoutData?.duration ??
                                                              ''),
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
                                                    Icon(
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
                                                        text: "${model?.workoutData?.energy} ${AppStrings.kcal}",
                                                        color: AppColors.black,
                                                        fontSize: 14.sp,
                                                        overflow: TextOverflow.ellipsis,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5.h,
                                          ),

                                          ///=================Kcal================
                                          Flexible(
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.extension,
                                                  color: AppColors.black,
                                                  size: 15,
                                                ),
                                                SizedBox(
                                                  width: 5.w,
                                                ),
                                                CustomText(
                                                  text: "${model?.workoutData?.exercises?.length} ${AppStrings.exercise}",
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
                                              imageUrl: "${model?.workoutData?.equipmentImg}",
                                              width: MediaQuery.sizeOf(context).width / 2.7,
                                              height: MediaQuery.sizeOf(context).height / 5,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(20),
                                                  bottomLeft: Radius.circular(20),
                                                  topRight: Radius.circular(20),
                                                  bottomRight: Radius.circular(20)),
                                            ),
                                      /* Positioned(
                                      top: 0,
                                      right: 10,
                                      child: Icon(
                                        Icons.favorite,
                                        color: AppColors.white,
                                        size: 30,
                                      ),
                                    ),*/
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      )),



                    if (notificationController.curentIndex.value == 1)

                      articleSearchController.obx((state)=> ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: state?.length,
                        itemBuilder: (context, index) {

                          var item = state?[index];

                          return Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: GestureDetector(
                              onTap: () {
                                Get.toNamed(AppRoutes.resourcesArticlesScreen,arguments: [
                                  {
                                    "topic": item?.topic,
                                    "title": item?.title,
                                    "image":"${item?.img ?? ""}",
                                    "description":item?.description,
                                  },
                                ]);
                              },
                              child: Container(
                                width: MediaQuery.sizeOf(context).width,
                                decoration: BoxDecoration(
                                  color: AppColors.lightRed2,
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [

                                      Flexible(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(height: 10.h),
                                            CustomText(
                                              text: "${item?.topic}",
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.black,
                                              textAlign: TextAlign.start,
                                            ),
                                            SizedBox(height: 10.h),
                                            CustomText(
                                              text: "${item?.title}",
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.w300,
                                              color: AppColors.white,
                                              maxLines: 5,
                                              textAlign: TextAlign.start,
                                              overflow: TextOverflow.visible,
                                            ),
                                          ],
                                        ),
                                      ),

                                      ///================== Slider Image ==================
                                      Stack(
                                        children: [
                                          CustomNetworkImage(
                                            imageUrl: "${item?.img ?? ""}",
                                            width: MediaQuery.sizeOf(context).width / 2.7,
                                            height: MediaQuery.sizeOf(context).height / 7,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              bottomLeft: Radius.circular(20),
                                              topRight: Radius.circular(20),
                                              bottomRight: Radius.circular(20),
                                            ),
                                          ),

                                          ///=============insert Articles favorite Api==========
                                         /*
                                          Positioned(
                                            top: 0,
                                            right: 10,
                                            child:favoriteController.articleFavoritelist
                                                .where((element) => element.articleId == item?.id)
                                                .isNotEmpty?  GestureDetector(
                                              onTap: (){

                                                ///============= Delete Articles favorite Api ==========

                                                List<String> articleId = favoriteController.articleFavoritelist
                                                    .where((element) => element.articleId == item?.id)
                                                    .map((e) => e.articleId!)
                                                    .toList();

                                                favoriteController.favoriteArticlesDelete("${articleId[0]}");

                                              },
                                              child: Icon(
                                                Icons.favorite,
                                                color: AppColors.lightRed,
                                                size: 30,
                                              ),
                                            ):GestureDetector(
                                              onTap: (){

                                                ///=============insert Articles favorite Api ==========

                                                favoriteController.favoriteArticlesInsert("${item?.id}");
                                                 articleSearchController.showArticleList();
                                              },
                                              child: Icon(
                                                Icons.favorite,
                                                color: AppColors.white,
                                                size: 30,
                                              ),
                                            ),
                                          )*/
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),)





                  ],
                ),
              );
            }
          ),
        ));
  }
}
