 import 'package:fitness_training_app/utils/ToastMsg/toast_message.dart';
import 'package:fitness_training_app/utils/app_colors/app_colors.dart';
import 'package:fitness_training_app/utils/app_strings/app_strings.dart';
import 'package:fitness_training_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:fitness_training_app/view/components/custom_button/custom_button.dart';
import 'package:fitness_training_app/view/components/custom_text/custom_text.dart';
import 'package:fitness_training_app/view/screens/costom_plan_screen/inner_widget/custom_plan_text.dart';
import 'package:fitness_training_app/view/screens/nutrition_screen/nutrition_controller/nutrition_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';



 class CustomMalePlanCreateScreen extends StatefulWidget { CustomMalePlanCreateScreen({super.key});


 @override
 State<CustomMalePlanCreateScreen> createState() => _CustomMalePlanCreateScreenState();
 }

 class _CustomMalePlanCreateScreenState extends State<CustomMalePlanCreateScreen> {

   final NutritionController controller = Get.find<NutritionController>();

   final storage = GetStorage();

   String day="sat";

   String update_uid="";

 @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller.getNutritionMealPlanShow(day);

    controller.currentWeekIndex.value=0;
    }


    void customMealCreate(){

      controller.goalList.clear();
      controller.cookingList.clear();
      controller.dietaryList.clear();

      ///======== caloric Goal checkBox null check for storage Insert ===========

      if(storage.read("goal_checkBox1") !=null){
        controller.goalList.add("${storage.read("goal_checkBox1")}");
      }

      if(storage.read("goal_checkBox2") !=null){


        controller.goalList.add("${storage.read("goal_checkBox2")}");
      }

     if(storage.read("goal_checkBox3") !=null){
      controller.goalList.add("${storage.read("goal_checkBox3")}");
      }

      if(storage.read("goal_checkBox4") !=null){

        controller.goalList.add("${storage.read("goal_checkBox4")}");
      }



   ///======== cooking check Box null check for storage Insert ===========

      if(storage.read("cooking_checkBox1") !=null){

        controller.cookingList.add("${storage.read("cooking_checkBox1")}");
      }
      if(storage.read("cooking_checkBox2") !=null){

        controller.cookingList.add("${storage.read("cooking_checkBox2")}");


      }
      if(storage.read("cooking_checkBox3") !=null){

        controller.cookingList.add("${storage.read("cooking_checkBox3")}");

      }

      ///======== Dietary check Box null check for storage Insert ===========

       if(storage.read("dietary_checkBox1") !=null){

         controller.dietaryList.add("${storage.read("dietary_checkBox1")}");

       }

      if(storage.read("dietary_checkBox2") !=null){

        controller.dietaryList.add("${storage.read("dietary_checkBox2")}");


      }

      if(storage.read("dietary_checkBox3") !=null){

        controller.dietaryList.add("${storage.read("dietary_checkBox3")}");

      }

      if(storage.read("dietary_checkBox4") !=null){

        controller.dietaryList.add("${storage.read("dietary_checkBox4")}");

      }

      if(storage.read("dietary_checkBox5") !=null){

        controller.dietaryList.add("${storage.read("dietary_checkBox5")}");

      }

      if(storage.read("dietary_checkBox6") !=null){

       controller.dietaryList.add("${storage.read("dietary_checkBox6")}");

      }

    controller.postNutritionMealPlanCreate(controller.goalList,controller.cookingList,controller.dietaryList,day);


    //  debugPrint("postNutritionMealPlanCreate:${controller.goalList.value}   cookingList:${controller.cookingList.value}   cookingList:${controller.dietaryList.value}  day:${"$day"} ");
    }


   ///===============Update Customer meal create ==================
   void customMealUpdate(){

     controller.goalList.clear();
     controller.cookingList.clear();
     controller. dietaryList.clear();

     ///======== caloric Goal checkBox null check for storage Update ===========

     if(storage.read("goal_checkBox1") !=null){
       controller.goalList.add(storage.read("goal_checkBox1"));
     }

   if(storage.read("goal_checkBox2") !=null){

     controller.goalList.add(storage.read("goal_checkBox2"));
     }

     if(storage.read("goal_checkBox3") !=null){
       controller.goalList.add("${storage.read("goal_checkBox3")}");
     }

     if(storage.read("goal_checkBox4") !=null){

       controller.goalList.add("${storage.read("goal_checkBox4")}");

     }


     ///======== cooking check Box null check for storage Update ===========

     if(storage.read("cooking_checkBox1") !=null){

       controller.cookingList.add("${storage.read("cooking_checkBox1")}");
     }
     if(storage.read("cooking_checkBox2") !=null){

       controller. cookingList.add("${storage.read("cooking_checkBox2")}");
     }
     if(storage.read("cooking_checkBox3") !=null){

       controller. cookingList.add("${storage.read("cooking_checkBox3")}");
     }



     ///======== Dietary check Box null check for storage Update ===========

     if(storage.read("dietary_checkBox1") !=null){

       controller.dietaryList.add("${storage.read("dietary_checkBox1")}");
     }

     if(storage.read("dietary_checkBox2") !=null){

       controller.dietaryList.add("${storage.read("dietary_checkBox2")}");
     }

     if(storage.read("dietary_checkBox3") !=null){

       controller.dietaryList.add("${storage.read("dietary_checkBox3")}");
     }

     if(storage.read("dietary_checkBox4") !=null){

       controller.dietaryList.add("${storage.read("dietary_checkBox4")}");
     }

     if(storage.read("dietary_checkBox5") !=null){

       controller.dietaryList.add("${storage.read("dietary_checkBox5")}");
     }

     if(storage.read("dietary_checkBox6") !=null){

       controller.dietaryList.add("${storage.read("dietary_checkBox6")}");
     }

      controller.putNutritionMealPlanUpdate(controller.goalList,controller.cookingList,controller.dietaryList,day,update_uid);

 //    debugPrint("Update_goalList:${controller.goalList.value}   cookingList:${controller.cookingList.value}   cookingList:${controller.dietaryList}  day:${"$day"} uid:${update_uid}");
   }

   @override
   Widget build(BuildContext context) {

     return Scaffold(
       appBar: const CustomAppBar(appBarContent: AppStrings.meal_plan,showLeading: true),
       body: Obx(
          () {

            update_uid = "${controller.nutritionCustomSingleModel!.value.id}";

           return SingleChildScrollView(
             child: Padding(
               padding: const EdgeInsets.all(8.0),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [

                   SizedBox(
                     height: 8.h,
                   ),

                   //================== your weekly meal plan ===================//
                    CustomText(
                     text: "your weekly meal plan",
                     fontSize: 16,
                     fontWeight: FontWeight.w700,
                     bottom: 5.h,
                     color: Colors.white,
                   ),

                   SizedBox(
                     height: 12.h,
                   ),

                   //==================   weekly meal plan ===================//
                   CustomPlanText(
                     items: controller.items,
                     currentIndex: controller.currentWeekIndex.value,
                     onChanged: (value) {
                       controller.currentWeekIndex.value = value;

                       day = controller.items[controller.currentWeekIndex.value];

                       if(controller.items[controller.currentWeekIndex.value]=="Sat"){
                         day="sat";

                       }
                       if(controller.items[controller.currentWeekIndex.value]=="Sun"){
                         day="sun";

                       }
                       if(controller.items[controller.currentWeekIndex.value]=="Mon"){
                         day="mon";
                       }
                       if(controller.items[controller.currentWeekIndex.value]=="Tue"){
                         day="tue";
                       }
                       if(controller.items[controller.currentWeekIndex.value]=="Wed"){
                         day="wed";

                       }
                       if(controller.items[controller.currentWeekIndex.value]=="Thu"){
                         day="thu";

                       }
                       if(controller.items[controller.currentWeekIndex.value]=="Fir"){
                         day="fri";
                       }
                       controller.getNutritionMealPlanShow(day);

                     },
                   ),

                   SizedBox(
                     height: 12.h,
                   ),

                   //==================  Caloric Goal meal plan ===================//
                   CustomText(
                     text: "Caloric Goal",
                     fontSize: 18,
                     fontWeight: FontWeight.w700,
                     bottom: 5.h,
                     color: AppColors.brinkPink,
                   ),

                   SizedBox(
                     height: 8.h,
                   ),
                   CustomText(
                     text: "What is your daily caloric intake goal?",
                     fontSize: 12,
                     fontWeight: FontWeight.w300,
                     bottom: 5.h,
                     color: Colors.white,
                   ),
             ///================ caloric Goal checkBox ===============================
                   Row(
                     mainAxisAlignment: MainAxisAlignment.start,
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [

                       Checkbox(
                         checkColor: AppColors.white,
                         activeColor: AppColors.brinkPink,
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(3.0),
                         ),
                         side: const BorderSide(
                           // ======> CHANGE THE BORDER COLOR HERE <======
                           color: AppColors.brinkPink,
                           // Give your checkbox border a custom width
                           width: 1.4,
                         ),
                         value: controller.goal_checkBox1.value,
                         onChanged: (bool? value) {
                          /// setState(() { });
                           controller.goal_checkBox1.value = value!;

                             if (controller.goal_checkBox1.value) {

                               storage.write("goal_checkBox1", "1500");

                             } else {

                               storage.remove("goal_checkBox1");

                             }

                         },
                       ),

                       CustomText(
                         text: "Less than 1500 calories",
                         fontSize: 12,
                         fontWeight: FontWeight.w300,
                         bottom: 5.h,
                         color: Colors.white,
                       ),
                     ],
                   ),

                   Row(
                     mainAxisAlignment: MainAxisAlignment.start,
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [

                       Checkbox(
                         checkColor: AppColors.white,
                         activeColor: AppColors.brinkPink,
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(3.0),
                         ),
                         side: const BorderSide(
                           // ======> CHANGE THE BORDER COLOR HERE <======
                           color: AppColors.brinkPink,
                           // Give your checkbox border a custom width
                           width: 1.4,
                         ),
                         value: controller.goal_checkBox2.value,
                         onChanged: (bool? value) {

                           controller.goal_checkBox2.value = value!;

                             if (controller.goal_checkBox2.value) {
                               storage.write("goal_checkBox2", "2000");
                             } else {
                               storage.remove("goal_checkBox2");
                             }
                         },
                       ),

                       CustomText(
                         text: "1500-2000 calories",
                         fontSize: 12,
                         fontWeight: FontWeight.w300,
                         bottom: 5.h,
                         color: Colors.white,
                       ),
                     ],
                   ),

                   Row(
                     mainAxisAlignment: MainAxisAlignment.start,
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [

                       Checkbox(
                         checkColor: AppColors.white,
                         activeColor: AppColors.brinkPink,
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(3.0),
                         ),
                         side: const BorderSide(
                           // ======> CHANGE THE BORDER COLOR HERE <======
                           color: AppColors.brinkPink,
                           // Give your checkbox border a custom width
                           width: 1.4,
                         ),
                         value:controller.goal_checkBox3.value,
                         onChanged: (bool? value) {

                           controller.goal_checkBox3.value = value!;

                             if (controller.goal_checkBox3.value) {
                               storage.write("goal_checkBox3", "2000 More");
                             } else {
                               storage.remove("goal_checkBox3");
                             }

                         },
                       ),

                       CustomText(
                         text: "More than 2000 calories",
                         fontSize: 12,
                         fontWeight: FontWeight.w300,
                         bottom: 5.h,
                         color: Colors.white,
                       ),
                     ],
                   ),

                   Row(
                     mainAxisAlignment: MainAxisAlignment.start,
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [

                       Checkbox(
                         checkColor: AppColors.white,
                         activeColor: AppColors.brinkPink,
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(3.0),
                         ),
                         side: const BorderSide(
                           // ======> CHANGE THE BORDER COLOR HERE <======
                           color: AppColors.brinkPink,
                           // Give your checkbox border a custom width
                           width: 1.4,
                         ),
                         value:controller.goal_checkBox4.value,
                         onChanged: (bool? value) {

                           controller.goal_checkBox4.value = value!;

                             if (controller.goal_checkBox4.value) {
                               storage.write("goal_checkBox4", "not_sure");
                             } else {
                               storage.remove("goal_checkBox4");
                             }

                         },
                       ),

                       CustomText(
                         text: "Not sure/Don't have a goal",
                         fontSize: 12,
                         fontWeight: FontWeight.w300,
                         bottom: 5.h,
                         color: Colors.white,
                       ),
                     ],
                   ),

                   CustomText(
                     text: "Cooking Time Preference",
                     fontSize: 18,
                     fontWeight: FontWeight.w500,
                     bottom: 5.h,
                     color:AppColors.brinkPink,
                   ),

                   CustomText(
                     text: "How much time are you willing to spend cooking each meal?",
                     fontSize: 12,
                     fontWeight: FontWeight.w300,
                     bottom: 5.h,
                     color:AppColors.white,
                   ),
      ///======== Cooking Time Preference checkBox ===================================

                   Row(
                     mainAxisAlignment: MainAxisAlignment.start,
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [

                       Checkbox(
                         checkColor: AppColors.white,
                         activeColor: AppColors.brinkPink,
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(3.0),
                         ),
                         side: const BorderSide(
                           // ======> CHANGE THE BORDER COLOR HERE <======
                           color: AppColors.brinkPink,
                           // Give your checkbox border a custom width
                           width: 1.4,
                         ),
                         value:controller. cooking_checkBox1.value,
                         onChanged: (bool? value) {

                           controller.cooking_checkBox1.value = value!;

                             if (controller.cooking_checkBox1.value) {
                               storage.write("cooking_checkBox1", "15");
                             } else {
                               storage.remove("cooking_checkBox1");
                             }

                         },
                       ),

                       CustomText(
                         text: "Less than 15 minutes",
                         fontSize: 12,
                         fontWeight: FontWeight.w300,
                         bottom: 5.h,
                         color: Colors.white,
                       ),
                     ],
                   ),

                   Row(
                     mainAxisAlignment: MainAxisAlignment.start,
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [

                       Checkbox(
                         checkColor: AppColors.white,
                         activeColor: AppColors.brinkPink,
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(3.0),
                         ),
                         side: const BorderSide(
                           // ======> CHANGE THE BORDER COLOR HERE <======
                           color: AppColors.brinkPink,
                           // Give your checkbox border a custom width
                           width: 1.4,
                         ),
                         value:controller.cooking_checkBox2.value,
                         onChanged: (bool? value) {

                           controller.cooking_checkBox2.value = value!;

                             if (controller.cooking_checkBox2.value) {
                               storage.write("cooking_checkBox2", "30");
                             } else {
                               storage.remove("cooking_checkBox2");
                             }

                         },
                       ),

                       CustomText(
                         text: "15-30 minutes",
                         fontSize: 12,
                         fontWeight: FontWeight.w300,
                         bottom: 5.h,
                         color: Colors.white,
                       ),
                     ],
                   ),

                   Row(
                     mainAxisAlignment: MainAxisAlignment.start,
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [

                       Checkbox(
                         checkColor: AppColors.white,
                         activeColor: AppColors.brinkPink,
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(3.0),
                         ),
                         side: const BorderSide(
                           // ======> CHANGE THE BORDER COLOR HERE <======
                           color: AppColors.brinkPink,
                           // Give your checkbox border a custom width
                           width: 1.4,
                         ),
                         value: controller.cooking_checkBox3.value,
                         onChanged: (bool? value) {

                           controller.cooking_checkBox3.value = value!;

                             if (controller.cooking_checkBox3.value) {
                               storage.write("cooking_checkBox3", "30+");
                             } else {
                               storage.remove("cooking_checkBox3");
                             }

                         },
                       ),

                       CustomText(
                         text: "More than 30 minutes",
                         fontSize: 12,
                         fontWeight: FontWeight.w300,
                         bottom: 5.h,
                         color: Colors.white,
                       ),
                     ],
                   ),

                   CustomText(
                     text: "Dietary Preferences",
                     fontSize: 18,
                     fontWeight: FontWeight.w500,
                     bottom: 5.h,
                     color:AppColors.brinkPink,
                   ),
                   CustomText(
                     text: "What are your dietary preferences?",
                     fontSize: 12,
                     fontWeight: FontWeight.w300,
                     bottom: 5.h,
                     color:AppColors.white,
                   ),

       ///======== Dietary Preference checkBox =========================
                   Row(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [

                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [

                           Row(
                             mainAxisAlignment: MainAxisAlignment.start,
                             crossAxisAlignment: CrossAxisAlignment.center,
                             children: [

                               Checkbox(
                                 checkColor: AppColors.white,
                                 activeColor: AppColors.brinkPink,
                                 shape: RoundedRectangleBorder(
                                   borderRadius: BorderRadius.circular(3.0),
                                 ),
                                 side: const BorderSide(
                                   // ======> CHANGE THE BORDER COLOR HERE <======
                                   color: AppColors.brinkPink,
                                   // Give your checkbox border a custom width
                                   width: 1.4,
                                 ),
                                 value:controller.dietary_checkBox1.value,
                                 onChanged: (bool? value) {

                                   controller.dietary_checkBox1.value = value!;

                                     if (controller.dietary_checkBox1.value) {
                                       storage.write("dietary_checkBox1", "vegetarian");
                                     } else {
                                       storage.remove("dietary_checkBox1");
                                     }

                                 },
                               ),

                               CustomText(
                                 text: "Vegetarian",
                                 fontSize: 12,
                                 fontWeight: FontWeight.w300,
                                 bottom: 5.h,
                                 color: Colors.white,
                               ),
                             ],
                           ),

                           Row(
                             mainAxisAlignment: MainAxisAlignment.start,
                             crossAxisAlignment: CrossAxisAlignment.center,

                             children: [

                               Checkbox(
                                 checkColor: AppColors.white,
                                 activeColor: AppColors.brinkPink,
                                 shape: RoundedRectangleBorder(
                                   borderRadius: BorderRadius.circular(3.0),
                                 ),
                                 side: const BorderSide(
                                   // ======> CHANGE THE BORDER COLOR HERE <======
                                   color: AppColors.brinkPink,
                                   // Give your checkbox border a custom width
                                   width: 1.4,
                                 ),
                                 value:controller.dietary_checkBox3.value,
                                 onChanged: (bool? value) {

                                   controller.dietary_checkBox3.value = value!;

                                     if (controller.dietary_checkBox3.value) {
                                       storage.write("dietary_checkBox3", "vegan");
                                     } else {
                                       storage.remove("dietary_checkBox3");
                                     }

                                 },
                               ),

                               CustomText(
                                 text: "Vegan",
                                 fontSize: 12,
                                 fontWeight: FontWeight.w300,
                                 bottom: 5.h,
                                 color: Colors.white,
                               ),
                             ],
                           ),

                           Row(
                             mainAxisAlignment: MainAxisAlignment.start,
                             crossAxisAlignment: CrossAxisAlignment.center,
                             children: [

                               Checkbox(
                                 checkColor: AppColors.white,
                                 activeColor: AppColors.brinkPink,
                                 shape: RoundedRectangleBorder(
                                   borderRadius: BorderRadius.circular(3.0),
                                 ),
                                 side: const BorderSide(
                                   // ======> CHANGE THE BORDER COLOR HERE <======
                                   color: AppColors.brinkPink,
                                   // Give your checkbox border a custom width
                                   width: 1.4,
                                 ),
                                 value:controller.dietary_checkBox5.value,
                                 onChanged: (bool? value) {

                                   controller.dietary_checkBox5.value = value!;

                                     if (controller.dietary_checkBox5.value) {
                                       storage.write("dietary_checkBox5", "gluten-free");
                                     } else {
                                       storage.remove("dietary_checkBox5");
                                     }

                                 },
                               ),

                               CustomText(
                                 text: "Gluten-Free",
                                 fontSize: 12,
                                 fontWeight: FontWeight.w300,
                                 bottom: 5.h,
                                 color: Colors.white,
                               ),
                             ],
                           ),
                         ],
                       ),

                       SizedBox(
                         width: 24.w,
                       ),

                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [

                           Row(
                             mainAxisAlignment: MainAxisAlignment.start,
                             crossAxisAlignment: CrossAxisAlignment.center,
                             children: [

                               Checkbox(
                                 checkColor: AppColors.white,
                                 activeColor: AppColors.brinkPink,
                                 shape: RoundedRectangleBorder(
                                   borderRadius: BorderRadius.circular(3.0),
                                 ),
                                 side: const BorderSide(
                                   // ======> CHANGE THE BORDER COLOR HERE <======
                                   color: AppColors.brinkPink,
                                   // Give your checkbox border a custom width
                                   width: 1.4,
                                 ),
                                 value:controller.dietary_checkBox2.value,
                                 onChanged: (bool? value) {

                                   controller.dietary_checkBox2.value = value!;

                                     if (controller.dietary_checkBox2.value) {
                                       storage.write("dietary_checkBox2", "keto");
                                     } else {
                                       storage.remove("dietary_checkBox2");
                                     }

                                 },
                               ),

                               CustomText(
                                 text: "Keto",
                                 fontSize: 12,
                                 fontWeight: FontWeight.w300,
                                 bottom: 5.h,
                                 color: Colors.white,
                               ),
                             ],
                           ),

                           Row(
                             mainAxisAlignment: MainAxisAlignment.start,
                             crossAxisAlignment: CrossAxisAlignment.center,

                             children: [

                               Checkbox(
                                 checkColor: AppColors.white,
                                 activeColor: AppColors.brinkPink,
                                 shape: RoundedRectangleBorder(
                                   borderRadius: BorderRadius.circular(3.0),
                                 ),
                                 side: const BorderSide(
                                   // ======> CHANGE THE BORDER COLOR HERE <======
                                   color: AppColors.brinkPink,
                                   // Give your checkbox border a custom width
                                   width: 1.4,
                                 ),
                                 value: controller.dietary_checkBox4.value,
                                 onChanged: (bool? value) {

                                   controller.dietary_checkBox4.value = value!;

                                     if (controller.dietary_checkBox4.value) {
                                       storage.write("dietary_checkBox4", "paleo");
                                     } else {
                                       storage.remove("dietary_checkBox4");
                                     }

                                 },
                               ),

                               CustomText(
                                 text: "Paleo",
                                 fontSize: 12,
                                 fontWeight: FontWeight.w300,
                                 bottom: 5.h,
                                 color: Colors.white,
                               ),
                             ],
                           ),

                           Row(
                             mainAxisAlignment: MainAxisAlignment.start,
                             crossAxisAlignment: CrossAxisAlignment.center,
                             children: [

                               Checkbox(
                                 checkColor: AppColors.white,
                                 activeColor: AppColors.brinkPink,
                                 shape: RoundedRectangleBorder(
                                   borderRadius: BorderRadius.circular(3.0),
                                 ),
                                 side: const BorderSide(
                                   // ======> CHANGE THE BORDER COLOR HERE <======
                                   color: AppColors.brinkPink,
                                   // Give your checkbox border a custom width
                                   width: 1.4,
                                 ),
                                 value: controller.dietary_checkBox6.value,
                                 onChanged: (bool? value) {

                                   controller.dietary_checkBox6.value = value!;

                                     if (controller.dietary_checkBox6.value) {
                                       storage.write("dietary_checkBox6", "low-calorie");
                                     } else {
                                       storage.remove("dietary_checkBox6");
                                     }

                                 },
                               ),

                               CustomText(
                                 text: "Low-Calorie",
                                 fontSize: 12,
                                 fontWeight: FontWeight.w300,
                                 bottom: 5.h,
                                 color: Colors.white,
                               ),
                             ],
                           ),
                         ],
                       ),
                     ],
                   ),

                   const SizedBox(
                     height: 12,
                   ),

                  controller.nutritionCustomSingleModel?.value.id == null ? Align(
                     alignment: Alignment.center,
                     child: CustomButton(
                       width: 200.w,
                       onTap: () {

                        customMealCreate();

                       },
                       title: AppStrings.create,
                       textColor: Colors.black,
                       fontSize: 24,
                     ),
                   ):Align(
                    alignment: Alignment.center,
                    child: CustomButton(
                      width: 200.w,
                      onTap: () {

                        customMealUpdate();
                      },
                      title: AppStrings.update,
                      textColor: Colors.black,
                      fontSize: 24,
                    ),
                  ),

                   const SizedBox(
                     height: 12,
                   ),
                 ],
               ),
             ),
           );
         }
       ),
     );
   }
 }