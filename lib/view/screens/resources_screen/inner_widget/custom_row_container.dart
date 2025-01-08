// ignore_for_file: prefer_const_constructors
import 'package:fitness_training_app/core/app_routes/app_routes.dart';
import 'package:fitness_training_app/utils/ToastMsg/toast_message.dart';
import 'package:fitness_training_app/utils/app_colors/app_colors.dart';
import 'package:fitness_training_app/view/components/custom_loader/custom_loader.dart';
import 'package:fitness_training_app/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:fitness_training_app/view/components/custom_text/custom_text.dart';
import 'package:fitness_training_app/view/screens/favorite-screen/favorite_controller/favorite_controller.dart';
import 'package:fitness_training_app/view/screens/resources_screen/resources_controller/resources_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomRowContainer extends StatefulWidget {
  final String topic;
  final String title;
  final String image;
  final String description;
  final String article_id;

    CustomRowContainer({
    super.key,
    required this.topic,
    required this.title,
    required this.image,
    required this.description,
    required this.article_id,
  });

  @override
  State<CustomRowContainer> createState() => _CustomRowContainerState();
}

class _CustomRowContainerState extends State<CustomRowContainer> {
  final FavoriteController favoriteController = Get.find<FavoriteController>();

  final ResourcesController resourcesController =
  Get.find<ResourcesController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: GestureDetector(
        onTap: () {
        Get.toNamed(AppRoutes.resourcesArticlesScreen,arguments: [
          {
            "topic": widget.topic,
            "title": widget.title,
            "image":widget.image,
            "description":widget.description,
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
                        text: widget.topic,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(height: 10.h),
                      CustomText(
                        text: widget.title,
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
                      imageUrl: widget.image,
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
                            .where((element) => element.articleId == widget.article_id)
                            .isNotEmpty?  InkWell(
                          onTap: (){

                          },
                          child: Icon(
                            Icons.favorite,
                            color: AppColors.lightRed,
                            size: 30,
                          ),
                        ):InkWell(
                          onTap: (){

                            //=============insert Articles favorite Api======
                            favoriteController.articlesCreateLoading.value?CustomLoader() :
                            favoriteController.favoriteArticlesInsert(widget.article_id);

                            // showCustomSnackBar("Add:${widget.article_id}", isError: false);
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
  }
}


