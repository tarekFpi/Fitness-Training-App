import 'package:fitness_training_app/utils/app_colors/app_colors.dart';
import 'package:fitness_training_app/utils/app_strings/app_strings.dart';
import 'package:fitness_training_app/view/components/custom_text/custom_text.dart';
import 'package:fitness_training_app/view/screens/home_screen/home_model/recipi_program_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomInstruction extends StatelessWidget {

  const CustomInstruction(this.item, {super.key});

  final RecipiProgramModel item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

        /*  Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: AppStrings.ingredients,
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.black,
              ),
              Row(
                children: [
                  CustomText(
                    text: AppStrings.servings,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  CustomText(
                    text: ": 1",
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                ],
              ),
            ],
          ),
          CustomText(
            top: 10.h,
            text: AppStrings.step1,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
            bottom: 20.h,
          ),*/

          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: item.instructionsData?.length, // Adjust based on data
            itemBuilder: (context, index) {
              return Container(
                 margin: EdgeInsets.only(top: 10.h),
                //height: 80,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  color: AppColors.amber,
                  borderRadius: BorderRadius.circular(10),
                ),child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        top: 10.h,
                      //  text: "Toast the Bread:",
                        text: "${item.instructionsData?[index].title}",
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                      ),
                      CustomText(
                        top: 10.h,
                       // text: "Toast the wheat bread until golden and crisp.",
                        text: "${item.instructionsData?[index].description}",
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w300,
                        color: AppColors.grey002,
                      ),
                    ],
                  )
              ),
              );
            },
          )

        ],
      ),
    );
  }
}
