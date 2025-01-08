import 'package:fitness_training_app/utils/app_colors/app_colors.dart';
import 'package:fitness_training_app/view/components/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPlanText extends StatelessWidget {
  const CustomPlanText(
      {super.key,
      required this.items,
      required this.currentIndex,
        required this.onChanged});
  final List<String> items;
  final int currentIndex;
  final Function(int) onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(items.length, (index) {
            return GestureDetector(
              onTap: ()=> onChanged(index),
              child: Container(
                decoration: BoxDecoration(
                border: Border(
                  bottom: currentIndex == index ? BorderSide(width: 2, color: AppColors.brinkPink): BorderSide()
                ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: CustomText(
                    text: items[index],
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.lightRed2,
                  ),
                ),
              ),
            );
          }),
        ));
  }
}
