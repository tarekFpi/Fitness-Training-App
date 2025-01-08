// ignore_for_file: prefer_const_constructors

import 'package:fitness_training_app/helper/time_converter/time_converter.dart';
import 'package:fitness_training_app/service/api_url.dart';
import 'package:fitness_training_app/utils/app_colors/app_colors.dart';
import 'package:fitness_training_app/utils/app_const/app_const.dart';
import 'package:fitness_training_app/utils/app_strings/app_strings.dart';
import 'package:fitness_training_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:fitness_training_app/view/components/custom_loader/custom_loader.dart';
import 'package:fitness_training_app/view/components/custom_loader/custom_loader.dart';
import 'package:fitness_training_app/view/components/custom_nav_bar/custom_navbar.dart';
import 'package:fitness_training_app/view/components/custom_text/custom_text.dart';
import 'package:fitness_training_app/view/screens/favorite-screen/favorite_controller/favorite_controller.dart';
import 'package:fitness_training_app/view/screens/favorite-screen/inner_widget/custom_article_container.dart';
import 'package:fitness_training_app/view/screens/favorite-screen/inner_widget/custom_favorite_tab.dart';
import 'package:fitness_training_app/view/screens/favorite-screen/inner_widget/custom_video_container.dart';
import 'package:fitness_training_app/view/screens/favorite-screen/inner_widget/custom_workout_favorite.dart';
import 'package:fitness_training_app/view/screens/workout_screen/inner_widget/upper_body_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FavoriteScreen extends StatefulWidget {
   FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {

  final FavoriteController favoriteController =
  Get.find<FavoriteController>();

  @override
  void initState() {
    super.initState();

    favoriteController.getWorkOutFavoriteList();

    favoriteController.getArticleFavoriteList();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:  CustomAppBar(appBarContent: AppStrings.favorite),
      body: Obx(() {

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomText(
                        text: AppStrings.sortBy,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.lightRed2,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      // Ensure CustomFavoriteTab does not use Expanded or Flexible improperly
                      CustomFavoriteTab(
                        gap: 18.w,
                        tabNameList: favoriteController.tabNamelist,
                        curentIndex: favoriteController.curentIndex.value,
                        onTap: (value) {
                          favoriteController.curentIndex.value = value;
                        },
                        selectedTextColor: AppColors.white,
                        unselectedTextColor: AppColors.brinkPink,
                        unselectedTabColor: Colors.white,
                        selectedTabColor: AppColors.brinkPink,
                      ),
                    ],
                  ),
                ),

                if (favoriteController.curentIndex.value == 0)
                  Expanded(
                    child: ListView(
                      children: List.generate(favoriteController.workOutFavoritelist.length, (index) {
                        final model = favoriteController.workOutFavoritelist[index];

                        return CustomWorkFavoriteScreen( //UpperBodyContainer
                         // name: AppStrings.upperBody,
                          name: "${model.workoutsData?.title}",
                          //minutes: AppStrings.seconds,
                          minutes: "${DateConverter
                              .convertTimeToMinutes(
                               model.workoutsData?.duration ??
                                  '')}",
                         // kcal: AppStrings.kcal,
                          kcal: "${model.workoutsData?.energy}",
                          exercise: AppStrings.exercise,
                          //image: AppConstants.sliderImage1,
                          image: "${model.workoutsData?.equipmentImg}",
                          uid: "${model.id}",
                          programme_id: "${model.workoutsData?.programmeId}",
                        );
                      }),
                    ),
                  ),

         /*       if (favoriteController.curentIndex.value == 1)
                  Expanded(
                    child: ListView(
                      children: List.generate(6, (index) {
                        return CustomVideoContainer(
                          name: AppStrings.upperBody,
                          minutes: AppStrings.seconds,
                          kcal: AppStrings.kcal,
                          exercise: AppStrings.exercise,
                          image: AppConstants.sliderImage1,
                        );
                      }),
                    ),
                  ),*/
                if (favoriteController.curentIndex.value == 1)

                   Expanded(
                    child: ListView(
                      children: List.generate(favoriteController.articleFavoritelist.length, (index) {

                        final model = favoriteController.articleFavoritelist[index];

                        return CustomArticleContainer(
                        //  name: AppStrings.upperBody,
                           topic:"${model.articlesData?.topic}",
                           title:"${model.articlesData?.title}",
                          description:"${model.articlesData?.description}",
                        //  minutes: AppStrings.seconds,
                           minutes: DateConverter
                              .formatTimeAgo(
                              "${model.articlesData?.publishedDate??""}"),
                        //  image: AppConstants.sliderImage1,
                          image:"${model.articlesData?.img}",
                          articleId:"${model.articleId}",
                        );
                      }),
                    ),
                  ),
              ],
            ),
          );
        }
      ),
      bottomNavigationBar: CustomNavbar(currentIndex: 2),
    );
  }
}
