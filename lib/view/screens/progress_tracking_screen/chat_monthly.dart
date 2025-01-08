
import 'package:fitness_training_app/helper/extensions/color_extensions.dart';
import 'package:fitness_training_app/utils/app_colors/app_colors.dart';
import 'package:fitness_training_app/view/screens/progress_tracking_screen/progress_tracking_controller/progress_controller.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class BarChartMonthly extends StatefulWidget {
  BarChartMonthly({super.key});

  final Color leftBarColor = AppColors.contentColorYellow;
  final Color rightBarColor = AppColors.contentColorRed;
  final Color avgColor =

  AppColors.contentColorOrange.avg(AppColors.contentColorRed);

  @override
  State<StatefulWidget> createState() => BarChartMonthlyState();
}

class BarChartMonthlyState extends State<BarChartMonthly> {

  final double width = 7;

  late List<BarChartGroupData> rawBarGroups;
  late List<BarChartGroupData> showingBarGroups;

  int touchedGroupIndex = -1;

  final ProgressController progressController = Get.find<ProgressController>();

   late BarChartGroupData  barGroup0;
  late BarChartGroupData  barGroup1;
  late BarChartGroupData  barGroup2;
  late BarChartGroupData  barGroup3;
  late BarChartGroupData  barGroup4;
  late BarChartGroupData  barGroup5;
  late BarChartGroupData  barGroup6;
  late BarChartGroupData  barGroup7;
  late BarChartGroupData  barGroup8;
  late BarChartGroupData  barGroup9;
  late BarChartGroupData  barGroup10;
  late BarChartGroupData  barGroup11;

  @override
  Widget build(BuildContext context) {

    return AspectRatio(
      aspectRatio: 1,
      child: Obx(
              () {

           if(progressController.chartMonthlyShowList.length!=null){


             if( progressController.chartMonthlyShowList[0].exercise! <=  20){

               barGroup0 = makeGroupData(0, progressController.chartMonthlyShowList[0].exercise?.toDouble()??0.0, 0);


             }
             if( progressController.chartMonthlyShowList[1].exercise! <=  20){
               barGroup1 = makeGroupData(1, progressController.chartMonthlyShowList[1].exercise?.toDouble()??0.0, 0);

             }
             if( progressController.chartMonthlyShowList[2].exercise! <=  20){
               barGroup2 = makeGroupData(2, progressController.chartMonthlyShowList[2].exercise?.toDouble()??0.0, 0);

             }
             if( progressController.chartMonthlyShowList[3].exercise! <=  20){
               barGroup3 = makeGroupData(3, progressController.chartMonthlyShowList[3].exercise?.toDouble()??0.0, 0);

             }
             if( progressController.chartMonthlyShowList[4].exercise! <=  20){
               barGroup4 = makeGroupData(4, progressController.chartMonthlyShowList[4].exercise?.toDouble()??0.0, 0);

             }
             if( progressController.chartMonthlyShowList[5].exercise! <=  20){
               barGroup5 = makeGroupData(5, progressController.chartMonthlyShowList[5].exercise?.toDouble()??0.0, 0);

             }
             if( progressController.chartMonthlyShowList[6].exercise! <=  20){
               barGroup6 = makeGroupData(6, progressController.chartMonthlyShowList[6].exercise?.toDouble()??0.0, 0);

             }
             if( progressController.chartMonthlyShowList[7].exercise! <=  20){

               barGroup7 = makeGroupData(7, progressController.chartMonthlyShowList[7].exercise?.toDouble()??0.0, 0);

             }
             if( progressController.chartMonthlyShowList[8].exercise! <=  20){

               barGroup8 = makeGroupData(8, progressController.chartMonthlyShowList[8].exercise?.toDouble()??0.0, 0);

             }
             if( progressController.chartMonthlyShowList[9].exercise! <=  20){
               barGroup9 = makeGroupData(9, progressController.chartMonthlyShowList[9].exercise?.toDouble()??0.0, 0);

             }

             if( progressController.chartMonthlyShowList[10].exercise! <=  20){

               barGroup10 = makeGroupData(10, progressController.chartMonthlyShowList[10].exercise?.toDouble()??0.0, 0);

             }
             if( progressController.chartMonthlyShowList[11].exercise! <=  20){
               barGroup11 = makeGroupData(11, progressController.chartMonthlyShowList[11].exercise?.toDouble()??0.0, 0);
             }
           }


       /*    final barGroup0 = makeGroupData(0, 20,0);
           final barGroup1 = makeGroupData(1, 10,0);
           final barGroup2 = makeGroupData(2, 20,0);
           final barGroup3 = makeGroupData(3, 8,0);
           final barGroup4 = makeGroupData(4, 10,0);
           final barGroup5 = makeGroupData(5, 30,0);
           final barGroup6 = makeGroupData(6, 10,0);
           final barGroup7 = makeGroupData(7, 16,0);
           final barGroup8 = makeGroupData(8, 18,0);
           final barGroup9 = makeGroupData(9, 16,0);
           final barGroup10 = makeGroupData(10, 20,0);
           final barGroup11 = makeGroupData(11, 20,0);*/

      /*      final  barGroup0 =  makeGroupData(0, progressController.chartMonthlyShowList[0].exercise?.toDouble()??0.0, 0);
            final barGroup1 = makeGroupData(1, progressController.chartMonthlyShowList[1].exercise?.toDouble()??0.0, 0);
            final barGroup2 = makeGroupData(2, progressController.chartMonthlyShowList[2].exercise?.toDouble()??0.0, 0);
            final barGroup3 = makeGroupData(3, progressController.chartMonthlyShowList[3].exercise?.toDouble()??0.0, 0);
            final barGroup4 = makeGroupData(4, progressController.chartMonthlyShowList[4].exercise?.toDouble()??0.0, 0);
            final barGroup5 = makeGroupData(5, progressController.chartMonthlyShowList[5].exercise?.toDouble()??0.0, 0);
            final barGroup6 = makeGroupData(6, progressController.chartMonthlyShowList[6].exercise?.toDouble()??0.0, 0);
            final barGroup7 = makeGroupData(7, progressController.chartMonthlyShowList[7].exercise?.toDouble()??0.0, 0);
            final barGroup8 = makeGroupData(8, progressController.chartMonthlyShowList[8].exercise?.toDouble()??0.0, 0);
            final barGroup9 = makeGroupData(9, progressController.chartMonthlyShowList[9].exercise?.toDouble()??0.0, 0);
            final barGroup10 = makeGroupData(10, progressController.chartMonthlyShowList[10].exercise?.toDouble()??0.0, 0);
            final barGroup11 = makeGroupData(11, progressController.chartMonthlyShowList[11].exercise?.toDouble()??0.0, 0);
*/


            final items = [
              barGroup0,
              barGroup1,
              barGroup2,
              barGroup3,
              barGroup4,
              barGroup5,
              barGroup6,
              barGroup7,
              barGroup8,
              barGroup9,
              barGroup10,
              barGroup11
            ];

            rawBarGroups = items;

            showingBarGroups = rawBarGroups;

            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                 mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  const SizedBox(
                    height: 50,
                  ),

                  Expanded(
                   // height: 140,
                    child: BarChart(
                      BarChartData(
                        maxY: 20,
                        barTouchData: BarTouchData(
                          touchTooltipData: BarTouchTooltipData(
                            getTooltipColor: ((group) {
                              return Colors.grey;
                            }),
                            getTooltipItem: (a, b, c, d) => null,
                          ),
                          touchCallback: (FlTouchEvent event, response) {
                            if (response == null || response.spot == null) {
                              setState(() {
                                touchedGroupIndex = -1;
                                showingBarGroups = List.of(rawBarGroups);
                              });
                              return;
                            }

                            touchedGroupIndex = response.spot!.touchedBarGroupIndex;

                            setState(() {
                              if (!event.isInterestedForInteractions) {
                                touchedGroupIndex = -1;
                                showingBarGroups = List.of(rawBarGroups);
                                return;
                              }
                              showingBarGroups = List.of(rawBarGroups);
                              if (touchedGroupIndex != -1) {
                                var sum = 0.0;
                                for (final rod
                                in showingBarGroups[touchedGroupIndex].barRods) {
                                  sum += rod.toY;
                                }
                                final avg = sum /
                                    showingBarGroups[touchedGroupIndex]
                                        .barRods
                                        .length;

                                showingBarGroups[touchedGroupIndex] =
                                    showingBarGroups[touchedGroupIndex].copyWith(
                                      barRods: showingBarGroups[touchedGroupIndex]
                                          .barRods
                                          .map((rod) {
                                        return rod.copyWith(
                                            toY: avg, color: widget.avgColor);
                                      }).toList(),
                                    );
                              }
                            });
                          },
                        ),
                        titlesData: FlTitlesData(
                          show: true,
                          rightTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          topTitles:  const AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: bottomTitles,
                              reservedSize: 42,
                            ),
                          ),
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              reservedSize: 28,
                              interval: 1,
                              getTitlesWidget: leftTitles,
                            ),
                          ),
                        ),
                        borderData: FlBorderData(
                          show: false,
                        ),
                        barGroups: showingBarGroups,
                        gridData: FlGridData(show: false),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                ],
              ),
            );
          }
      ),
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff7589a2),
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    if (value == 0) {
      text = '';
    } else if (value == 10) {
      text = '';
    } else if (value == 19) {
      text = '';
    } else {
      return Container();
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 0,
      child: Text(text, style: style),
    );
  }


  Widget bottomTitles(double value, TitleMeta meta) {

 //   final titles = <String>['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun','Jul', 'Aug', 'Sep', 'Oct', 'Nov','Dec'];
    final titles = <String>['Jan', '', 'Mar', '', 'May', '','Jul', '', 'Sep', '', 'Nov',''];

    final Widget text = Text(
      titles[value.toInt()],
      style: TextStyle(
        color: Color(0xff7589a2),
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16, //margin top
      child: text,
    );
  }

  BarChartGroupData makeGroupData(int x, double y1, double y2) {
    return BarChartGroupData(
      barsSpace: 4,
      x: x,
      barRods: [
        BarChartRodData(
          toY: y1,
          color: widget.leftBarColor,
          width: width,
        ),
        BarChartRodData(
          toY: y2,
          color: widget.rightBarColor,
          width: width,
        ),
      ],
    );
  }

  Widget makeTransactionsIcon() {
    const width = 4.5;
    const space = 3.5;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          width: width,
          height: 10,
          color: Colors.white.withOpacity(0.4),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 28,
          color: Colors.white.withOpacity(0.8),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 42,
          color: Colors.white.withOpacity(1),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 28,
          color: Colors.white.withOpacity(0.8),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 10,
          color: Colors.white.withOpacity(0.4),
        ),
      ],
    );
  }
}