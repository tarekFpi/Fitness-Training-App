// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:fitness_training_app/core/app_routes/app_routes.dart';
import 'package:fitness_training_app/service/api_url.dart';
import 'package:fitness_training_app/utils/ToastMsg/toast_message.dart';
import 'package:fitness_training_app/utils/app_colors/app_colors.dart';
import 'package:fitness_training_app/utils/app_const/app_const.dart';
import 'package:fitness_training_app/utils/app_strings/app_strings.dart';
import 'package:fitness_training_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:fitness_training_app/view/components/custom_loader/custom_loader.dart';
import 'package:fitness_training_app/view/components/custom_nav_bar/custom_navbar.dart';
import 'package:fitness_training_app/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:fitness_training_app/view/components/custom_text/custom_text.dart';
import 'package:fitness_training_app/view/screens/favorite-screen/article_favorite_model/ArticleFavoriteListResponse.dart';
import 'package:fitness_training_app/view/screens/favorite-screen/favorite_controller/favorite_controller.dart';
import 'package:fitness_training_app/view/screens/home_screen/home_controller/home_controller.dart';
import 'package:fitness_training_app/view/screens/resources_screen/inner_widget/custom_resources_container.dart';
import 'package:fitness_training_app/view/screens/resources_screen/inner_widget/custom_resources_tab.dart';
import 'package:fitness_training_app/view/screens/resources_screen/inner_widget/custom_row_container.dart';
import 'package:fitness_training_app/view/screens/resources_screen/resources_controller/resources_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class ResourcesScreen extends StatefulWidget {
  ResourcesScreen({super.key});

  @override
  State<ResourcesScreen> createState() => _ResourcesScreenState();
}

class _ResourcesScreenState extends State<ResourcesScreen> {

  final ResourcesController resourcesController =
  Get.find<ResourcesController>();

  final FavoriteController favoriteController = Get.find<FavoriteController>();

  final HomeController homeController = Get.find<HomeController>();

  //article
   var article_status = "";

   @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if(Get.arguments!=null){

      article_status =Get.arguments[0]["article"];

      resourcesController.curentIndex.value=1;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarContent: AppStrings.resourcesName,),

      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Obx(() {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                ///================= Resources Tab =================
                CustomResourcesTab(
                  tabNameList: resourcesController.tabNamelist,
                  curentIndex: resourcesController.curentIndex.value,
                  onTap: (value) {

                  resourcesController.curentIndex.value = value;

                  },
                  selectedTextColor: AppColors.white,
                  unselectedTextColor: AppColors.lightRed2,
                  unselectedTabColor: Colors.white,
                  selectedTabColor: AppColors.lightRed2,
                ),

                ///================= What's Workout =================
                CustomText(
                  text: AppStrings.whatWorkout,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.lightRed2,
                  top: 20.h,
                  bottom: 10.h,
                ),

                ///================= whatWorkoutTitle =================
                CustomText(
                  text: AppStrings.whatWorkoutTitle,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.white,
                  maxLines: 2,
                  bottom: 20.h,
                ),

                ///================= CustomResourcesContainer =================

                if (resourcesController.curentIndex.value == 0)

                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [


                      GridView.count(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        children: List.generate(homeController.workOutlist.length, (index) {
                          final model = homeController.workOutlist[index];

                          return   CustomResourcesContainer(workOutmodel: model);
                        }),
                      ),

                    /*  Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomResourcesContainer(),
                          CustomResourcesContainer(),
                        ],
                      ),*/
                    ],
                  ),

                if (resourcesController.curentIndex.value == 1)

                 ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: favoriteController.ariticalList.length,
                    itemBuilder: (context, index) {

                      var item = favoriteController.ariticalList[index];

                      /*return CustomRowContainer(
                       // name: AppStrings.strength,
                        topic: "${item.topic}",
                        //title: AppStrings.strengthTitle,
                        title: "${item.title}",
                        //image: AppConstants.sliderImage1,
                        image: "${ApiUrl.imageUrl}${item.img ?? ""}",
                        description: "${item.description}",
                        article_id: "${item.id}",
                      );*/

                       return Padding(
                         padding: const EdgeInsets.only(bottom: 20),
                         child: GestureDetector(
                          onTap: () {
                            Get.toNamed(AppRoutes.resourcesArticlesScreen,arguments: [
                              {
                                "topic": item.topic,
                                "title": item.title,
                                "image":"${item.img ?? ""}",
                                "description":item.description,
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
                                          text: "${item.topic}",
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.black,
                                          textAlign: TextAlign.start,
                                        ),
                                        SizedBox(height: 10.h),
                                        CustomText(
                                          text: "${item.title}",
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
                                        imageUrl: "${item.img ?? ""}",
                                        width: MediaQuery.sizeOf(context).width / 2.7,
                                        height: MediaQuery.sizeOf(context).height / 7,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          bottomLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                          bottomRight: Radius.circular(20),
                                        ),
                                      ),



                                   Positioned(
                                        top: 0,
                                        right: 10,
                                        child:favoriteController.articleFavoritelist
                                            .where((element) => element.articleId == item.id)
                                            .isNotEmpty?  GestureDetector(
                                            onTap: (){

                                           ///============= Delete Articles favorite Api ==========

                                            List<String> articleId = favoriteController.articleFavoritelist
                                                .where((element) => element.articleId == item.id)
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

                                            ///=============insert Articles favorite Api==========

                                            favoriteController.favoriteArticlesInsert("${item.id}");

                                          },
                                          child: Icon(
                                            Icons.favorite,
                                            color: AppColors.white,
                                            size: 30,
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
              ],
            ),
          );
        }),
      ),
      bottomNavigationBar: CustomNavbar(currentIndex: 1),
    );
  }
}



