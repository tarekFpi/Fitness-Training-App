// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

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
import 'package:fitness_training_app/view/screens/costom_plan_screen/custom_plan_controller/custom_plan_controller.dart';
import 'package:fitness_training_app/view/screens/costom_plan_screen/inner_widget/custom_click_box.dart';
import 'package:fitness_training_app/view/screens/costom_plan_screen/inner_widget/custom_plan_text.dart';
import 'package:fitness_training_app/view/screens/workout_screen/inner_widget/upper_body_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CostomPlanScreen extends StatefulWidget {
  CostomPlanScreen({super.key});

  @override
  State<CostomPlanScreen> createState() => _CostomPlanScreenState();
}

class _CostomPlanScreenState extends State<CostomPlanScreen> {

  final CustomPlanController customPlanController = Get.find<CustomPlanController>();

  final storage = GetStorage();

  ///"fix flat", "build", "all over muscle", "lose weight"

  bool isfix_flat = false;
  bool isbuild = false;
  bool isall_over = false;
  bool islose = false;

  String week_status ="";

  List<String> datalist=[];

    String fix_flat="";
    String build_type="";
    String all_over_muscle ="";
   String lose_weight="";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getSelectCheckBoxValue();
  }

  void getSelectCheckBoxValue(){

    //=============== already check selected checkBox select ========
 if(storage.read("button_clickStatus")==true){


   if(storage.read("fix_flat") !=null){

     fix_flat = storage.read("fix_flat");

     isfix_flat =true;
     datalist.add('"$fix_flat"');
   }

   if(storage.read("build")!=null){

     build_type =storage.read("build");
     isbuild = true;
     datalist.add('"$build_type"');
   }

   if(storage.read("all_over_muscle")!=null){

     all_over_muscle =storage.read("all_over_muscle");
     isall_over = true;
     datalist.add('"$all_over_muscle"');
   }

   if(storage.read("lose_weight")!=null){

     lose_weight =storage.read("lose_weight");
     islose = true;
     datalist.add('"$lose_weight"');
   }

   //=============== already check selected value fetch data ========
   if(storage.read("fix_flat") !=null || storage.read("build")!=null || storage.read("all_over_muscle")!=null || storage.read("lose_weight")!=null){

     if(customPlanController.items[customPlanController.currentWeekIndex.value]=="week 1"){
       week_status="week_1";

     }

     if(customPlanController.items[customPlanController.currentWeekIndex.value]=="week 2"){
       week_status="week_2";
     }

     if(customPlanController.items[customPlanController.currentWeekIndex.value]=="week 3"){
       week_status="week_3";
     }

     if(customPlanController.items[customPlanController.currentWeekIndex.value]=="week 4"){
       week_status="week_4";
     }

     if(customPlanController.items[customPlanController.currentWeekIndex.value]=="week 5"){
       week_status="week_5";
     }

     customPlanController.getCustomPlanWorkOutListByData(datalist,week_status);
   }
 }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarContent: AppStrings.customPlan,
        showLeading: true,
      ),
      floatingActionButton: CustomButton(
        width: 150.w,
        onTap: () {

           datalist.clear();

            if(storage.read("fix_flat") !=null){

              fix_flat = storage.read("fix_flat");

              datalist.add('"$fix_flat"');
            }

           if(storage.read("build")!=null){

             build_type =storage.read("build");
             datalist.add('"$build_type"');

           }

           if(storage.read("all_over_muscle")!=null){

             all_over_muscle =storage.read("all_over_muscle");
             datalist.add('"$all_over_muscle"');

           }

           if(storage.read("lose_weight")!=null){

             lose_weight =storage.read("lose_weight");
             datalist.add('"$lose_weight"');
           }

           if(customPlanController.items[customPlanController.currentWeekIndex.value]=="week 1"){
            week_status="week_1";

          }

         if(customPlanController.items[customPlanController.currentWeekIndex.value]=="week 2"){
           week_status="week_2";
         }

          if(customPlanController.items[customPlanController.currentWeekIndex.value]=="week 3"){
             week_status="week_3";
          }

           if(customPlanController.items[customPlanController.currentWeekIndex.value]=="week 4"){
             week_status="week_4";
           }

           if(customPlanController.items[customPlanController.currentWeekIndex.value]=="week 5"){
             week_status="week_5";
           }

           if(datalist.isNotEmpty){

             customPlanController.getCustomPlanWorkOutListByData(datalist,week_status);

             debugPrint("datalist:${datalist}");

             storage.write("button_clickStatus",true);

           }else{

             showCustomSnackBar("Fitness Goal Data is Empty!!", isError: true);
           }
        },
        title: AppStrings.saveChange,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 8.0),
        child: SingleChildScrollView(
          child: Obx(() {
            return Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 50.h,
                 // width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                  //  color: AppColors.grey06,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:
                          List.generate(customPlanController.tabNamelist.length, (index) {
                        return GestureDetector(
                          onTap: () {
                            customPlanController.currentIndex.value = index;
                            customPlanController.update();
                          },
                          child: Container(
                            alignment: Alignment.center,
                           // width: MediaQuery.of(context).size.width / 2.4,
                              width: MediaQuery.of(context).size.width/1.2,
                            //  height: 50.h,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: customPlanController.currentIndex.value == index
                                  ? AppColors.lightRed2
                                  : AppColors.grey06,
                            ),
                            child: CustomText(
                              text: customPlanController.tabNamelist[index],
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black,
                            ),
                          ),
                        );
                      })),
                ),
                SizedBox(
                  height: 20.h,
                ),

                ///================== Customize Your Plan ===================
                CustomText(
                  bottom: 10,
                  text: AppStrings.customizeYour,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.white,
                ),

                ///================== Tailor ===================
                CustomText(
                  bottom: 10,
                  text: AppStrings.tailor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w300,
                  color: AppColors.grey_1,
                ),

                CustomPlanText(
                  items: customPlanController.items,
                  currentIndex: customPlanController.currentWeekIndex.value,
                  onChanged: (value) {
                    customPlanController.currentWeekIndex.value = value;
                  },
                ),

                SizedBox(
                  height: 12,
                ),
                ///================== Fitness Goal ===================
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: AppStrings.fitnessGoal,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                    ),
                    /*IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.delete,
                          color: AppColors.lightRed2,
                        ))*/

                  ],
                ),


                ///================== Click Box ===================
                ///"fix flat", "build", "all over muscle", "lose weight"
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Row(
                      children: [
                        Checkbox(
                            activeColor: AppColors.lightRed2,
                            fillColor:
                                WidgetStateProperty.all(AppColors.lightRed2),
                            checkColor: AppColors.white,
                            value: isfix_flat,
                            onChanged: (bool? value) {
                              setState(() {

                                isfix_flat = value!;
                                if (isfix_flat) {
                                  storage.write("fix_flat", "fix flat");
                                } else {
                                  storage.remove("fix_flat");

                             //   showCustomSnackBar("week:${storage.read("fix_flat")}", isError: true);
                                }
                              });
                            }),
                        CustomText(
                          text: "Fix Flat",
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.white,
                        ),
                      ],
                    ),

                    /* CustomClickBox(
                     // text: AppStrings.loseWeight,
                      text: "Fix Flat",
                    ),*/

                    Row(
                      children: [
                        Checkbox(
                            activeColor: AppColors.lightRed2,
                            fillColor:
                                WidgetStateProperty.all(AppColors.lightRed2),
                            checkColor: AppColors.white,
                            value: isall_over,
                            onChanged: (bool? value) {
                              setState(() {
                                isall_over = value!;
                                if (isall_over) {
                                  storage.write(
                                      "all_over_muscle", "All Over Muscle");
                                } else {
                                  storage.remove("all_over_muscle");
                                }
                              });
                            }),
                        CustomText(
                          text: "All Over Muscle",
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.white,
                        ),
                      ],
                    ),

                    /*CustomClickBox(
                     // text: AppStrings.fullBodyStrecthing,
                      text: "",
                    )*/
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [

                        Checkbox(
                            activeColor: AppColors.lightRed2,
                            fillColor:
                                WidgetStateProperty.all(AppColors.lightRed2),
                            checkColor: AppColors.white,
                            value: isbuild,
                            onChanged: (bool? value) {
                              setState(() {
                                isbuild = value!;
                                if (isbuild) {
                                  storage.write("build", "Build");
                                } else {
                                  storage.remove("build");
                                }
                              });
                            }),
                        CustomText(
                          text: "Build",
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.white,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                            activeColor: AppColors.lightRed2,
                            fillColor:
                                WidgetStateProperty.all(AppColors.lightRed2),
                            checkColor: AppColors.white,
                            value: islose,
                            onChanged: (bool? value) {
                              setState(() {
                                islose = value!;
                                if (islose) {
                                  storage.write("lose_weight", "Lose Weight");
                                } else {
                                  storage.remove("lose_weight");
                                }
                              });
                            }),
                        CustomText(
                          text: "Lose Weight",
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.white,
                        ),
                      ],
                    ),

                    /*   CustomClickBox(
                      //text: AppStrings.weightGain,
                      text: "Build",
                    ),
                    CustomClickBox(
                      //text: AppStrings.fullBodyStrecthing,
                      text: "Lose Weight",
                    )*/
                  ],
                ),
                /* Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomClickBox(
                      text: AppStrings.loseWeight,

                    ),
                    CustomClickBox(
                      text: AppStrings.fullBodyStrecthing,
                    )
                  ],
                ), */
                SizedBox(
                  height: 20.h,
                ),
                CustomText(
                  bottom: 20,
                  text: AppStrings.workoutType,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.white,
                ),

                ///=================== CustomPlan Workout Api fetch =========================================
         /*      Column(
                  children: List.generate(6, (index) {
                    return UpperBodyContainer(
                      name: AppStrings.upperBody,
                      minutes: AppStrings.seconds,
                      kcal: AppStrings.kcal,
                      exercise: AppStrings.exercise,
                      image: AppConstants.sliderImage1,
                      work_id: '',
                    );
                  }),
                ),
*/
                 Column(
                  children: List.generate(customPlanController.customPlanWorkOutList.length, (index) {

                    final customModel =customPlanController.customPlanWorkOutList[index];

                    debugPrint("customModel_image:${customModel.workoutsData?.img ?? ""}");

                    return InkWell(
                        onTap: () {
                          Get.toNamed(AppRoutes.workoutResourceScreen,
                            arguments: [
                              {
                                "uid": customModel.workoutsData?.programmeId,
                              }
                            ],
                          );
                        },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width,
                          height: MediaQuery.sizeOf(context).height / 6.5,
                          decoration: BoxDecoration(
                            color: AppColors.grey_3,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    CustomText(
                                      text: "${customModel.workoutsData?.title}",
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.black,
                                    ),
                                    SizedBox(
                                      height: 30.h,
                                    ),
                                    Flexible(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          ///===================Time=================
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.access_time_filled_sharp,
                                                color: AppColors.black,
                                                size: 15,
                                              ),
                                              SizedBox(
                                                width: 5.w,
                                              ),
                                              CustomText(
                                                text: DateConverter.convertTimeToMinutes("${customModel.workoutsData?.duration}"),
                                                color: AppColors.black,
                                                fontSize: 14.sp,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 20.w,
                                          ),

                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),

                                    ///=================Kcal================
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.keyboard_command_key_rounded,
                                          color: AppColors.black,
                                          size: 15,
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        SizedBox(
                                          width: 50,
                                          child: CustomText(
                                            text: "${customModel.workoutsData?.energy} "+AppStrings.kcal,
                                            color: AppColors.black,
                                            fontSize: 14.sp,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),

                                    ///=================Extension================
                                   /* Flexible(
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.extension,
                                            color: AppColors.black,
                                            size: 15,
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),

                                        ],
                                      ),
                                    )*/
                                  ],
                                ),

                                ///================== Slider Image ==================
                                ///"${ApiUrl.imageUrl}${model.workoutData?.equipmentImg ?? ""}"

                                Flexible(
                                  child: Stack(
                                    children: [
                                      CustomNetworkImage(
                                        imageUrl: "${customModel.workoutsData?.img ?? ""}",
                                        width: MediaQuery.sizeOf(context).width / 2.7,
                                        height: MediaQuery.sizeOf(context).height / 5,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            bottomLeft: Radius.circular(20),
                                            topRight: Radius.circular(20),
                                            bottomRight: Radius.circular(20)),
                                      ),

                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
                SizedBox(
                  height: 20.h,
                ),
                /*Center(
                  child: CustomButton(
                    width: 200.w,
                    onTap: () {},
                    title: AppStrings.saveChange,
                  ),
                ),*/
                SizedBox(
                  height: 30.h,
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
