import 'package:fitness_training_app/utils/app_colors/app_colors.dart';
import 'package:fitness_training_app/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:fitness_training_app/view/components/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPostCard extends StatelessWidget {
  const CustomPostCard({
    super.key,
    required this.profileImage,
    required this.profileName,
    required this.postTime,
    required this.postTitle,
    required this.postImage,
    required this.profileNameButton,
    this.moreButton,
    required this.commentLength,
    required this.loveLenth,
    required this.commentButton,
    required this.loveButton,

  });

  final String profileImage;
  final String profileName;
  final String postTime;

  final String postTitle;
  final String postImage;
  final VoidCallback profileNameButton;
  final VoidCallback? moreButton;
  final String commentLength;
  final String loveLenth;
  final VoidCallback commentButton;
  final VoidCallback loveButton;


  @override
  Widget build(BuildContext context) {
    //======================= Conatiner ===================//
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
                        //=========== Profile Image ==================//
                        CustomNetworkImage(
                          imageUrl: profileImage,
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
                                profileNameButton();
                              },
                              child: CustomText(
                                text: profileName,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColors.white,
                              ),
                            ),
                            CustomText(
                              text: postTime,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black_60,
                            ),
                            //===================== Profile Email id ================//

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
                  text: postTitle,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black,
                  maxLines: 3,
                  bottom: 13.h,
                ),
                //=============== Post Image =============//
                CustomNetworkImage(
                  imageUrl: postImage,
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
                    //==================== loveButton Button ===================//
                    PostTextIcon(
                        onTap: loveButton,
                        imageSrc: Icons.thumb_up_alt_rounded,
                        iconName: loveLenth),
                    ///======================= Comment Button ==================///
                    PostTextIcon(
                        onTap: commentButton,
                        imageSrc: Icons.comment_bank,
                        iconName: commentLength),




                    //================ Book marks Button ===================//

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
  }
}

class PostTextIcon extends StatelessWidget {
  const PostTextIcon({
    super.key,
      this.imageSrc,
    required this.iconName,
    required this.onTap,
    this.color_status,
  });
  final IconData? imageSrc;
  final String iconName;
  final VoidCallback onTap;
  final bool? color_status;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        InkWell(
          onTap: onTap,
          child: Icon(imageSrc,
            color:color_status==true? Colors.green:Colors.black,
            // sizeWidth: 24,
          ),
        ),

        SizedBox(
          width: 6.5.w,
        ),

        CustomText(
          text: iconName,
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.black,
        ),
      ],
    );
  }
}
