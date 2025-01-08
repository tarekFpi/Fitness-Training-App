// ignore_for_file: prefer_const_constructors
import 'dart:io';
import 'package:fitness_training_app/utils/ToastMsg/toast_message.dart';
import 'package:fitness_training_app/utils/app_colors/app_colors.dart';
import 'package:fitness_training_app/utils/app_const/app_const.dart';

import 'package:fitness_training_app/utils/app_strings/app_strings.dart';
import 'package:fitness_training_app/view/components/custom_button/custom_button.dart';
import 'package:fitness_training_app/view/components/custom_from_card/custom_from_card.dart';

import 'package:fitness_training_app/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:fitness_training_app/view/components/custom_text/custom_text.dart';
import 'package:fitness_training_app/view/screens/community_screen/communty_controller/communty_controller.dart';
import 'package:fitness_training_app/view/screens/community_screen/inner_widget/custom_post_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CustomCreatePost extends StatefulWidget {
  CustomCreatePost({super.key});

  @override
  State<CustomCreatePost> createState() => _CustomCreatePostState();
}

class _CustomCreatePostState extends State<CustomCreatePost> {

  final CommuntyController communtyController = Get.find<CommuntyController>();



  @override
  Widget build(BuildContext context) {
    return  Obx(
            () {
        return Container(
          padding: EdgeInsets.all(20),
          //height: 200.h,
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
            color: AppColors.lightRed2,
                borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //================ Profile Image ====================//
                  CustomNetworkImage(
                    imageUrl: AppConstants.userNtr,
                    height: 48.h,
                    width: 48.w,
                    boxShape: BoxShape.circle,
                  ),
                  SizedBox(width:12.w),
                  //================== Post Text Field ==================//
                  Expanded(
                    child: CustomPostTextField(
                      fillColor: AppColors.lightRed2,
                      maxLines: communtyController.maxLines.value,
                      textEditingController: communtyController.postTextEditingController.value,
                      hintText: "What's on your mind?",
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

                      if(communtyController.postTextEditingController.value.text==""){

                        showCustomSnackBar("Comments is Empty!!", isError: true);

                      }else if(communtyController.imagePath.value.isEmpty){

                        showCustomSnackBar("Image is Empty!!", isError: true);

                      }else{

                        communtyController.communityPostInsert();

                      }

                    }, title: AppStrings.post,)
                ],
              ),
              //============================ Image Add button =================//
             Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: (){
                      communtyController. getImage();
                    },
                    child: Container(
                      height: 200.h,
                      width: MediaQuery.sizeOf(context).width,
                      decoration: BoxDecoration(
                        color: AppColors.lightRed2,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: AppColors.white.withOpacity(0.4)),
                      ),
                      child: communtyController.imagePath.value.isNotEmpty
                          ? Image.file(
                       // communtyController.imagePath.value,
                        File(communtyController.imagePath.value),
                        fit: BoxFit.cover,
                      )
                      //=================  Add Photos and videos ===============//
                          : Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor:
                              AppColors.lightRed,
                              child: Icon(
                                Icons.add,
                                color: AppColors.white,
                              ),
                            ),
                             SizedBox(height: 8.h,),
                             CustomText(
                              text: "Add Photos ",
                              color: AppColors.white,
                               bottom: 5.h,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 16,
                  ),

              /*    TextFormField(
                    controller: communtyController.postTextEditingController.value,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter your comment";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      label: const CustomText(
                        text: "Enter your comment",
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: AppColors.white,
                      ),
                      hintText: 'your comment',
                      hintStyle: TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: AppColors.white,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: AppColors.white,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),

                    ),
                  ),*/

                ],
              ),
            ],
          ),
        );
      }
    );


  }
}
