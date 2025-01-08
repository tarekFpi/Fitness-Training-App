
import 'package:fitness_training_app/helper/time_converter/time_converter.dart';
import 'package:fitness_training_app/utils/app_colors/app_colors.dart';
import 'package:fitness_training_app/view/components/custom_text/custom_text.dart';
import 'package:fitness_training_app/view/screens/community_screen/community_post_model/PostShowResponseModel.dart';
import 'package:fitness_training_app/view/screens/community_screen/communty_controller/communty_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

 class CommunityCommentPost extends StatefulWidget {

 //  final PostShowResponseModel commentPost;

     CommunityCommentPost({super.key});
 
   @override
   State<CommunityCommentPost> createState() => _CommunityCommentPostState();
 }
 
 class _CommunityCommentPostState extends State<CommunityCommentPost> {


  final CommuntyController communtyController = Get.find<CommuntyController>();

   //final Comment postCommentModel = Get.arguments;

   final PostShowResponseModel postCommentModel = Get.arguments;

   @override
   Widget build(BuildContext context) {

     return Column(
       children: [

         Container(
           alignment: Alignment.center,
           height: 64.h,
           width: MediaQuery.of(context).size.width,
           decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(100),
             color: AppColors.white,
           ),
           child: Padding(
             padding: const EdgeInsets.only(left: 12.0),
             child: Row(
               crossAxisAlignment: CrossAxisAlignment.center,
               mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 SizedBox(
                   width: 10.w,
                 ),
                 CustomText(
                   text: "data:${postCommentModel.comments?[0].content}",
                   color: AppColors.grey002,
                   fontSize: 12.w,
                   fontWeight: FontWeight.w500,
                   bottom: 4,
                   textAlign: TextAlign.end,
                 ),

                 /*Column(
                       children: List.generate(postCommentModel.comments!.length, (index) {

                         final model = postCommentModel.comments?[index];

                         return  Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [

                             Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               // crossAxisAlignment: CrossAxisAlignment.end,
                               children: [

                                 SizedBox(
                                   width: 200.w,
                                   child: CustomText(
                                     text: "${model?.content}",
                                     color: AppColors.brinkPink,
                                     fontSize: 12.w,
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
                                   text: "2024-11-27T05:00:18.502Z",
                                   color: AppColors.grey002,
                                   fontSize: 12.w,
                                   fontWeight: FontWeight.w500,
                                   bottom: 4,
                                   textAlign: TextAlign.end,
                                 ),

                               ],
                             ),
                           ],
                         );
                       }),
                     ),*/

               ],
             ),
           ),
         ),
         SizedBox(
           height: 10.h,
         ),
       ],
     );
   }
 }
 