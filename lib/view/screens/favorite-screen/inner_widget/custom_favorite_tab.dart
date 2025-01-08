import 'package:fitness_training_app/view/components/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFavoriteTab extends StatelessWidget {
  const CustomFavoriteTab({
    super.key,
    required this.tabNameList,
    required this.curentIndex,
    required this.onTap,
    this.selectedTabColor,
    this.unselectedTabColor,
    this.selectedTextColor,
    this.unselectedTextColor,
    this.width,
    this.gap,
  });

  final List<String> tabNameList;
  final int curentIndex;
  final Function(int index) onTap;
  final Color? selectedTabColor;
  final Color? unselectedTabColor;
  final Color? selectedTextColor;
  final Color? unselectedTextColor;
  final double? width;
  final double? gap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        tabNameList.length,
        (index) => Row(
          children: [
            GestureDetector(
              onTap: () => onTap(index),
              child: Container(
                width: width ?? 70.w,
                height: 25.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: curentIndex == index
                      ? selectedTabColor
                      : unselectedTabColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: CustomText(
                  text: tabNameList[index],
                  fontSize: 14.w,
                  fontWeight: FontWeight.w500,
                  color: curentIndex == index
                      ? selectedTextColor ?? Colors.white
                      : unselectedTextColor ?? Colors.black,
                ),
              ),
            ),
            SizedBox(
              width: gap ?? 0.w,
            )
          ],
        ),
      ),
    );
  }
}
