/*
// ignore_for_file: prefer_const_constructors
import 'package:fitness_training_app/utils/app_colors/app_colors.dart';
import 'package:fitness_training_app/utils/app_strings/app_strings.dart';
import 'package:fitness_training_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:fitness_training_app/view/components/custom_text/custom_text.dart';
import 'package:fitness_training_app/view/screens/home_screen/progress_graph_tracking/profress_graph_controller/progress_graph_controller.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
class ProgressGraphTracking extends StatelessWidget {
   ProgressGraphTracking({super.key});
  final ProgressGraphController progressGraphController =Get.find<ProgressGraphController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarContent: AppStrings.progressTracking),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 18.0),
        child: Column(
          children: [
            Container(
              height: 50.h,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: AppColors.grey06,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:
                  List.generate(progressGraphController.tabProgressslist.length, (index) {
                    return GestureDetector(
                      onTap: (){
                        progressGraphController.currentIndex.value = index;
                        progressGraphController.update();
                      },
                      child: Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width / 2.4,
                          //  height: 50.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: progressGraphController.currentIndex == index
                                ? AppColors.lightRed2
                                : AppColors.grey06,
                          ),
                          child: CustomText(
                            text: progressGraphController.tabProgressslist[index],
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.black,
                          ),
                        ),
                      ),
                    );
                  })),
            ),
           ///=================================
            */
/*Padding(
              padding: const EdgeInsets.all(16.0),
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: 100,
                  barTouchData: BarTouchData(enabled: false),
                  titlesData: FlTitlesData(
                    show: true,
                    rightTitles: SideTitles(showTitles: false),
                    topTitles: SideTitles(showTitles: false),
                    leftTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 28,
                      getTitles: (value) {
                        if (value == 25) return '25%';
                        if (value == 50) return '50%';
                        if (value == 75) return '75%';
                        if (value == 100) return '100%';
                        return '';
                      },
                      margin: 12,
                    ),
                    bottomTitles: SideTitles(
                      showTitles: true,
                      margin: 16,
                      getTitles: (double value) {
                        switch (value.toInt()) {
                          case 0:
                            return 'Sat';
                          case 1:
                            return 'Sun';
                          case 2:
                            return 'Mon';
                          case 3:
                            return 'Tue';
                          case 4:
                            return 'Wed';
                          case 5:
                            return 'Thurs';
                          case 6:
                            return 'Fri';
                          default:
                            return '';
                        }
                      },
                    ),
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                  barGroups: [
                    BarChartGroupData(x: 0, barRods: [
                      BarChartRodData(y: 55, colors: [Colors.redAccent], width: 15),
                    ]),
                    BarChartGroupData(x: 1, barRods: [
                      BarChartRodData(y: 20, colors: [Colors.redAccent], width: 15),
                    ]),
                    BarChartGroupData(x: 2, barRods: [
                      BarChartRodData(y: 45, colors: [Colors.redAccent], width: 15),
                    ]),
                    BarChartGroupData(x: 3, barRods: [
                      BarChartRodData(y: 100, colors: [Colors.redAccent], width: 15),
                    ]),
                    BarChartGroupData(x: 4, barRods: [
                      BarChartRodData(y: 75, colors: [Colors.redAccent], width: 15),
                    ]),
                    BarChartGroupData(x: 5, barRods: [
                      BarChartRodData(y: 65, colors: [Colors.redAccent], width: 15),
                    ]),
                    BarChartGroupData(x: 6, barRods: [
                      BarChartRodData(y: 85, colors: [Colors.redAccent], width: 15),
                    ]),
                  ],
                ),
              ),
            ),*//*


          ],
        ),
      ),
    );
  }
}
*/

/*
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ProgressGraphTracking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BarChart(
            BarChartData(
              maxY: 100,
              barTouchData: BarTouchData(enabled: false),
              titlesData: FlTitlesData(
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 40,
                    getTitlesWidget: (double value, TitleMeta meta) {
                      if (value == 0) return const Text('0%');
                      if (value == 25) return const Text('25%');
                      if (value == 50) return const Text('50%');
                      if (value == 75) return const Text('75%');
                      if (value == 100) return const Text('100%');
                      return Container();
                    },
                  ),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (double value, TitleMeta meta) {
                      switch (value.toInt()) {
                        case 0:
                          return const Text('Sat');
                        case 1:
                          return const Text('Sun');
                        case 2:
                          return const Text('Mon');
                        case 3:
                          return const Text('Tue');
                        case 4:
                          return const Text('Wed');
                        case 5:
                          return const Text('Thurs');
                        case 6:
                          return const Text('Fri');
                        default:
                          return Container();
                      }
                    },
                    reservedSize: 30,
                    // margin: 16,
                  ),
                ),
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                topTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
              ),
              gridData: FlGridData(show: true),
              borderData: FlBorderData(
                show: true,
                border: Border.all(color: Colors.white),
              ),
              barGroups: [
                BarChartGroupData(x: 0, barRods: [
                  BarChartRodData(
                    toY: 55,
                    color: Colors.redAccent,
                    width: 15,
                  ),
                ]),
                BarChartGroupData(x: 1, barRods: [
                  BarChartRodData(
                    toY: 20,
                    color: Colors.redAccent,
                    width: 15,
                  ),
                ]),
                BarChartGroupData(x: 2, barRods: [
                  BarChartRodData(
                    toY: 45,
                    color: Colors.redAccent,
                    width: 15,
                  ),
                ]),
                BarChartGroupData(x: 3, barRods: [
                  BarChartRodData(
                    toY: 100,
                    color: Colors.redAccent,
                    width: 15,
                  ),
                ]),
                BarChartGroupData(x: 4, barRods: [
                  BarChartRodData(
                    toY: 75,
                    color: Colors.redAccent,
                    width: 15,
                  ),
                ]),
                BarChartGroupData(x: 5, barRods: [
                  BarChartRodData(
                    toY: 65,
                    color: Colors.redAccent,
                    width: 15,
                  ),
                ]),
                BarChartGroupData(x: 6, barRods: [
                  BarChartRodData(
                    toY: 85,
                    color: Colors.redAccent,
                    width: 15,
                  ),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}*/
