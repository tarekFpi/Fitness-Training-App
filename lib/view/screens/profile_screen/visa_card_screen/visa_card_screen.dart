// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:fitness_training_app/utils/app_strings/app_strings.dart';
import 'package:fitness_training_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:fitness_training_app/view/components/custom_button/custom_button.dart';
import 'package:fitness_training_app/view/components/custom_from_card/custom_from_card.dart';
import 'package:fitness_training_app/view/screens/profile_screen/visa_card_screen/inner_widget/custom_front_back_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VisaCardScreen extends StatelessWidget {
  const VisaCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarContent: AppStrings.addNewCard),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20,bottom: 50),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ///============= Front and Back visa card images =============
              CustomFrontBackContainer(),

              SizedBox(
                height: 20.h,
              ),

              ///========= Date of Birth ===========
              CustomFormCard(
                hasBackgroundColor: true,
                hintText: AppStrings.dateOfBirth,
                title: AppStrings.dateOfBirth,
                controller: TextEditingController(),
              ),

              ///========= addressCity ===========
              CustomFormCard(
                hasBackgroundColor: true,
                hintText: AppStrings.typeHere,
                title: AppStrings.addressCity,
                controller: TextEditingController(),
              ),

              ///========= addressCountry ===========
              CustomFormCard(
                hasBackgroundColor: true,
                hintText: AppStrings.typeHere,
                title: AppStrings.addressCountry,
                controller: TextEditingController(),
              ),

              ///========= addresspostalCode ===========
              CustomFormCard(
                hasBackgroundColor: true,
                hintText: AppStrings.typeHere,
                title: AppStrings.addresspostalCode,
                controller: TextEditingController(),
              ),

              ///========= line ===========
              CustomFormCard(
                hasBackgroundColor: true,
                hintText: AppStrings.typeHere,
                title: AppStrings.line,
                controller: TextEditingController(),
              ),

              ///========= bankAccountNumber ===========
              CustomFormCard(
                hasBackgroundColor: true,
                hintText: AppStrings.typeHere,
                title: AppStrings.bankAccountNumber,
                controller: TextEditingController(),
              ),
              ///========= accountHolderType ===========
              CustomFormCard(
                hasBackgroundColor: true,
                hintText: AppStrings.typeHere,
                title: AppStrings.accountHolderType,
                controller: TextEditingController(),
              ),

              ///========= bankInfo ===========
              CustomFormCard(
                hasBackgroundColor: true,
                hintText: AppStrings.typeHere,
                title: AppStrings.bankInfo,
                controller: TextEditingController(),
              ),
              ///========= bankInfoCurrency ===========
              CustomFormCard(
                hasBackgroundColor: true,
                hintText: AppStrings.typeHere,
                title: AppStrings.bankInfoCurrency,
                controller: TextEditingController(),
              ),
              ///========= bankInfoBusinessName ===========
              CustomFormCard(
                hasBackgroundColor: true,
                hintText: AppStrings.typeHere,
                title: AppStrings.bankInfoBusinessName,
                controller: TextEditingController(),
              ),
              ///========= bankInfoWebsite ===========
              CustomFormCard(
                hasBackgroundColor: true,
                hintText: AppStrings.typeHere,
                title: AppStrings.bankInfoWebsite,
                controller: TextEditingController(),
              ),
              ///========= bankInfoProductDescription ===========
              CustomFormCard(
                hasBackgroundColor: true,
                hintText: AppStrings.typeHere,
                maxLine: 4,
                title: AppStrings.bankInfoProductDescription,
                controller: TextEditingController(),
              ),
              SizedBox(height: 50.h,),
              CustomButton(onTap: (){},title: AppStrings.submit,)
            ],
          ),
        ),
      ),
    );
  }
}
