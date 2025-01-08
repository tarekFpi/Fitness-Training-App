// ignore_for_file: prefer_const_constructors

import 'package:expandable_menu/expandable_menu.dart';
import 'package:fitness_training_app/core/app_routes/app_routes.dart';
import 'package:fitness_training_app/helper/time_converter/time_converter.dart';
import 'package:fitness_training_app/service/api_url.dart';
import 'package:fitness_training_app/utils/ToastMsg/toast_message.dart';
import 'package:fitness_training_app/utils/app_colors/app_colors.dart';
import 'package:fitness_training_app/utils/app_const/app_const.dart';
import 'package:fitness_training_app/utils/app_strings/app_strings.dart';
import 'package:fitness_training_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:fitness_training_app/view/components/custom_button/custom_button.dart';
import 'package:fitness_training_app/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:fitness_training_app/view/components/custom_text/custom_text.dart';
import 'package:fitness_training_app/view/screens/community_screen/community_comment_post.dart';
import 'package:fitness_training_app/view/screens/community_screen/communty_controller/communty_controller.dart';
import 'package:fitness_training_app/view/screens/community_screen/inner_widget/custom_create_post.dart';
import 'package:fitness_training_app/view/screens/community_screen/inner_widget/custom_post_card.dart';
import 'package:fitness_training_app/view/screens/community_screen/inner_widget/custom_post_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:expandable_menu/expandable_menu.dart';
class CommunityScreen extends StatefulWidget {
    CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {

  final CommuntyController communtyController = Get.find<CommuntyController>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarContent: AppStrings.communityName,showLeading: true,),
      body: Obx(
       () {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 20.h),
              child: Column(

                children: [

                  CustomCreatePost(),

                  SizedBox(
                    height: 10.h,
                  ),

                  /*  return CustomPostCard(
                        commentButton: () {

                        },
                        commentLength: "10",
                        loveButton: () {},
                        loveLenth: "10",
                        postImage: AppConstants.ntrition,
                        postTime: "10:10 PM",
                        postTitle: "jahid is very bad",
                        profileImage: AppConstants.girlsPhoto,
                        profileName: "jahida",
                        profileNameButton: () {
                        },
                        moreButton: () {},

                      );*/

                  Column(
                    children: List.generate(communtyController.postShowList.length, (index) {

                    final model = communtyController.postShowList[index];

                      return Column(
                        children: [
                          Container(
                            width: MediaQuery.sizeOf(context).width,
                            decoration: BoxDecoration(
                              color: AppColors.lightRed2.withOpacity(0.9),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(14.0.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [

                                          ///=========== Profile Image ==================//
                                          CustomNetworkImage(
                                            imageUrl:"${model.usersData?.img == null?AppConstants.girlsPhoto:model.usersData?.img}",
                                            height: 44.h,
                                            width: 44.w,
                                            boxShape: BoxShape.circle,
                                          ),
                                          SizedBox(
                                            width: 12.w,
                                          ),
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              //============== Profile Name ====================//
                                              InkWell(
                                                onTap: () {
                                                 // profileNameButton();
                                                },
                                                child: CustomText(
                                                  text: "${model.usersData?.name}",
                                                  fontSize: 18.sp,
                                                  fontWeight: FontWeight.w700,
                                                  color: AppColors.white,
                                                ),
                                              ),
                                              CustomText(
                                                text: "${DateConverter.formatTimeAgo("${model.createdAt}")}",
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.black_60,
                                              ),
                                              ///===================== Profile Email id ================//
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 17.w,
                                  ),
                                  CustomText(
                                    textAlign: TextAlign.left,
                                    text: "${model.content}",
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.black,
                                    maxLines: 3,
                                    bottom: 13.h,
                                  ),
                                  ///=============== Post Image =============//

                                   CustomNetworkImage(
                                    imageUrl:"${model.media?[0]??""}",
                                    height: 180.h,
                                    width: MediaQuery.sizeOf(context).width,
                                    borderRadius: BorderRadius.circular(8),
                                  ),

                                  SizedBox(
                                    height: 13.w,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [

                                      ///==================== like insert Button ===================//


                                      Row(
                                        children: [

                                          model.isLiked==true? InkWell(
                                                  onTap: (){
                                                communtyController.postCommnutyLikeUnLike("${model.id}");
                                                  },
                                                child: Icon(
                                                     Icons.thumb_up_alt_rounded,
                                                       color:Colors.black,
                                                   ),
                                              ):InkWell(
                                              onTap: (){
                                                communtyController.commnutyLikeInsert("${model.id}");
                                              },
                                              child: Icon(Icons.thumb_up_alt_rounded,color:Colors.white)),

                                          SizedBox(
                                            width: 6.5.w,
                                          ),

                                          CustomText(
                                            text: "Like ${model.likes?.length}",
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.black,
                                          ),
                                        ],
                                      ),



                                  /*   PostTextIcon(
                                          onTap: (){

                                          },
                                          imageSrc:model.likes!.where((element) => element.userId == model.userId)
                                              .isNotEmpty?
                                              Icons.thumb_up_alt_rounded
                                              :Icons.thumb_down,
                                          iconName: "Like",), */


             ///======================= Comment Button ==================/// CommunityCommentPost
                                      PostTextIcon(
                                          onTap: (){
                                         communtyController.commetTextEditingController.value.text ="";
             ///====================================  Comment insert showDialog ===========================================================
                                            showDialog(
                                              context: context,
                                              builder: (ctx) => AlertDialog(
                                                backgroundColor: AppColors.brinkPink,
                                                insetPadding: EdgeInsets.all(8),
                                                contentPadding: EdgeInsets.all(8),
                                                title: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [

                                                      CustomText(
                                                      text: "Show User Comment",
                                                      fontSize: 22,
                                                      fontWeight: FontWeight.w500,
                                                      color: AppColors.white,
                                                      bottom: 8,
                                                    ),

                                                    Align(
                                                      alignment: Alignment.centerRight,
                                                      child: InkWell(
                                                          onTap: () {
                                                            Navigator.of(context).pop();
                                                          },
                                                          child: const Icon(
                                                            Icons.close,
                                                            size: 32,
                                                            color: Colors.black,
                                                          )),
                                                    )
                                                  ],
                                                ),
                                                content:  SizedBox(
                                                  height: 500.h,
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [

                                                      Column(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        children: List.generate(model.comments!.length, (index) {

                                                        final modelComment = model.comments?[index];


                                                       return  Container(
                                                          margin: EdgeInsets.only(top: 8),
                                                          alignment: Alignment.topLeft,
                                                          height: 64.h,
                                                          width: MediaQuery.of(context).size.width,
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(100),
                                                            color: AppColors.white,
                                                          ),

                                                          child: Column(
                                                             mainAxisAlignment: MainAxisAlignment.center,
                                                             crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [

                                                              Padding(
                                                                padding: const EdgeInsets.only(right: 8,left: 8),
                                                                child: Row(
                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                  // crossAxisAlignment: CrossAxisAlignment.end,
                                                                  children: [

                                                                    SizedBox(
                                                                      width: 200.w,
                                                                      child: CustomText(
                                                                        text: "${modelComment?.content}",
                                                                        color: AppColors.black,
                                                                        fontSize: 18.w,
                                                                        fontWeight: FontWeight.w500,
                                                                        overflow: TextOverflow.ellipsis,
                                                                        textAlign: TextAlign.start,
                                                                      ),
                                                                    ),

                                                                    SizedBox(
                                                                      width: 16.w,
                                                                    ),
                                                                    //${DateConverter.formatTimeAgo("")}

                                                                    CustomText(
                                                                      text: "${DateConverter.formatTimeAgo("${modelComment?.createdAt}")}",
                                                                      color: AppColors.black,
                                                                      fontSize: 14.w,
                                                                      fontWeight: FontWeight.w500,
                                                                      bottom: 4,
                                                                      textAlign: TextAlign.end,
                                                                    ),

                                                                  ],
                                                                ),
                                                              ),

                                                            ],
                                                          ),
                                                        );
                                                      }),
                                                      ),

                                                      Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Row(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [

                                                            SizedBox(width:12.w),

                                                            ///================== comment Text Field ==================//
                                                            Expanded(
                                                              child: CustomPostTextField(
                                                                fillColor: AppColors.lightRed2,
                                                                maxLines: communtyController.maxLines.value,
                                                                textEditingController: communtyController.commetTextEditingController.value,
                                                                hintText: "What's on your comment?",
                                                                onChanged: (value) {
                                                                  if(value.length > 22 * communtyController.maxLines.value){

                                                                    if(value.isEmpty){
                                                                      communtyController.maxLines.value = 1;
                                                                    }
                                                                  }
                                                                },
                                                              ),
                                                            ),
                                                            CustomButton(
                                                              height: 40.h,
                                                              width: 70.w,
                                                              fontSize: 14.sp,
                                                              onTap: (){

                                                                if(communtyController.commetTextEditingController.value.text==""){

                                                                  showCustomSnackBar("Comments is Empty!!", isError: true);

                                                                }else{
                                                                   communtyController.commentInsert("${model.id}");

                                                                   Navigator.of(context).pop();
                                                                }

                                                              }, title: AppStrings.post,)
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );

                                          },
                                          imageSrc: Icons.comment_bank,
                                          iconName: "comment ${model.comments?.length}",),

                                      ///================ Book marks Button ===================//

                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 13.w,
                          ),
                        ],
                      );
                    }),
                  ),
                ],
              ),
            ),
          );
        }
      ),
    );
  }


}


