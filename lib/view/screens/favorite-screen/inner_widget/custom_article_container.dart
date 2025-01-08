// ignore_for_file: prefer_const_constructors
import 'package:fitness_training_app/core/app_routes/app_routes.dart';
import 'package:fitness_training_app/utils/ToastMsg/toast_message.dart';
import 'package:fitness_training_app/utils/app_colors/app_colors.dart';
import 'package:fitness_training_app/utils/app_strings/app_strings.dart';
import 'package:fitness_training_app/view/components/custom_loader/custom_loader.dart';
import 'package:fitness_training_app/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:fitness_training_app/view/components/custom_text/custom_text.dart';
import 'package:fitness_training_app/view/screens/favorite-screen/favorite_controller/favorite_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomArticleContainer extends StatelessWidget {
  final String topic;
  final String title;
  final String description;
  final String minutes;
  final String image;
  final String articleId;

    CustomArticleContainer({
    super.key,
    required this.topic,
    required this.title,
    required this.description,
    required this.minutes,
    required this.image,
    required this.articleId,
  });

  final FavoriteController favoriteController = Get.find<FavoriteController>();


  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return InkWell(
          onTap: (){
            Get.toNamed(AppRoutes.resourcesArticlesScreen,arguments: [
              {
                "topic": topic,
                "title": title,
                "image":image,
                "description":description,
              },
            ]);
          },
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height / 6,
                  decoration: BoxDecoration(
                    color: AppColors.lightRed2,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        ///=================== image =================
                        CustomNetworkImage(
                          imageUrl: image,
                          width: MediaQuery.sizeOf(context).width / 2.7,
                          height: MediaQuery.sizeOf(context).height / 5,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        SizedBox(width: 20.w),

                        ///=================== Article Details  =================
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    //text: AppStrings.loseFat,
                                    text: "${topic}",
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.black,
                                  ),
                                  PopupMenuButton(
                                    child:  Icon(
                                      Icons.more_vert,
                                      color: AppColors.white,
                                      size: 25.sp,
                                    ),

                                    itemBuilder: (BuildContext context) {
                                      return [
                                        PopupMenuItem<String>(
                                          value: 'Item1',
                                          child:  Text('Delete'),
                                          onTap: (){
                                            //===============================  favorite Article Delete By Id Api =============================

                                          favoriteController.articlesFavoriteDeleteLoading.value?CustomLoader(): favoriteController.favoriteArticlesDelete(articleId);

                                          },
                                        ),
                                      ];
                                    },
                                  )
                                ],
                              ),
                              CustomText(
                               // text: AppStrings.loseFattitle,
                                text: "${description}",
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w300,
                                color: AppColors.black,
                                maxLines: 3,
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 8,
                  right: 8,
                  child: Container(
                    height: 30.h,
                    width: 80.w,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Center(
                      child: CustomText(
                        text: minutes,
                        color: AppColors.black,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}

