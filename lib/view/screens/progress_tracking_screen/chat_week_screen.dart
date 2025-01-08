
import 'package:fitness_training_app/helper/extensions/color_extensions.dart';
import 'package:fitness_training_app/utils/app_colors/app_colors.dart';
import 'package:fitness_training_app/view/screens/progress_tracking_screen/progress_tracking_controller/progress_controller.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class BarChartWeek extends StatefulWidget {
  BarChartWeek({super.key});

  final Color leftBarColor = AppColors.contentColorYellow;
  final Color rightBarColor = AppColors.contentColorRed;
  final Color avgColor =

  AppColors.contentColorOrange.avg(AppColors.contentColorRed);

  @override
  State<StatefulWidget> createState() => BarChartWeekState();
}

class BarChartWeekState extends State<BarChartWeek> {

  final double width = 7;

  late List<BarChartGroupData> rawBarGroups;
  late List<BarChartGroupData> showingBarGroups;

  int touchedGroupIndex = -1;

  final ProgressController progressController = Get.find<ProgressController>();

  @override
  void initState() {
    super.initState();

/* final barGroup1 = makeGroupData(0, 20, 0);
    final barGroup2 = makeGroupData(1, 16, 0);
    final barGroup3 = makeGroupData(2, 18, 0);
    final barGroup4 = makeGroupData(3, 20, 0);
    final barGroup5 = makeGroupData(4, 17, 0);
    final barGroup6 = makeGroupData(5, 19, 0);
    final barGroup7 = makeGroupData(6, 10, 0);

    final items = [
      barGroup1,
      barGroup2,
      barGroup3,
      barGroup4,
      barGroup5,
      barGroup6,
      barGroup7,
    ];
    rawBarGroups = items;
    showingBarGroups = rawBarGroups;*/
  }

  late BarChartGroupData  barGroup0;
  late BarChartGroupData  barGroup1;
  late BarChartGroupData  barGroup2;
  late BarChartGroupData  barGroup3;
  late BarChartGroupData  barGroup4;
  late BarChartGroupData  barGroup5;
  late BarChartGroupData  barGroup6;


  @override
  Widget build(BuildContext context) {

    return AspectRatio(
      aspectRatio: 1,
      child: Obx(
       () {


         if(progressController.chartWeeklyShowList.length!=null){


           if( progressController.chartWeeklyShowList[0].exercise! <=  20){

             barGroup0 = makeGroupData(0, progressController.chartWeeklyShowList[0].exercise?.toDouble()??0.0, 0);

           }
           if( progressController.chartWeeklyShowList[1].exercise! <=  20){
             barGroup1 = makeGroupData(1, progressController.chartWeeklyShowList[1].exercise?.toDouble()??0.0, 0);

           }
           if( progressController.chartWeeklyShowList[2].exercise! <=  20){
             barGroup2 = makeGroupData(2, progressController.chartWeeklyShowList[2].exercise?.toDouble()??0.0, 0);

           }
           if( progressController.chartWeeklyShowList[3].exercise! <=  20){
             barGroup3 = makeGroupData(3, progressController.chartWeeklyShowList[3].exercise?.toDouble()??0.0, 0);

           }
           if( progressController.chartWeeklyShowList[4].exercise! <=  20){
             barGroup4 = makeGroupData(4, progressController.chartWeeklyShowList[4].exercise?.toDouble()??0.0, 0);

           }
           if( progressController.chartWeeklyShowList[5].exercise! <=  20){
             barGroup5 = makeGroupData(5, progressController.chartWeeklyShowList[5].exercise?.toDouble()??0.0, 0);

           }
           if( progressController.chartWeeklyShowList[6].exercise! <=  20){
             barGroup6 = makeGroupData(6, progressController.chartWeeklyShowList[6].exercise?.toDouble()??0.0, 0);
           }
         }



         final items = [
           barGroup0,
           barGroup1,
           barGroup2,
           barGroup3,
           barGroup4,
           barGroup5,
           barGroup6,
         ];

         rawBarGroups = items;

         showingBarGroups = rawBarGroups;

          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
              /*  Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    makeTransactionsIcon(),
                    const SizedBox(
                      width: 38,
                    ),
                    const Text(
                      'Transactions',
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    const Text(
                      'state',
                      style: TextStyle(color: Color(0xff77839a), fontSize: 16),
                    ),
                  ],
                ),*/
                const SizedBox(
                  height: 38,
                ),
                Expanded(
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
                        rightTitles:   const AxisTitles(
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
                      gridData:   FlGridData(show: false),
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

    final titles = <String>['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

    final Widget text = Text(
      titles[value.toInt()],
      style: const TextStyle(
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