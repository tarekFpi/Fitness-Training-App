import 'package:fitness_training_app/utils/app_images/app_images.dart';
import 'package:fitness_training_app/utils/app_strings/app_strings.dart';



class UnbordingContent {
  String image;
  String name;
  String title;

  UnbordingContent({required this.image, required this.name, required this.title});
}

List<UnbordingContent> contents = [
  UnbordingContent(
      image: AppImages.onboradingOne,
      name: AppStrings.flatButt,
      title: AppStrings.flatButtTitle
  ),
  UnbordingContent(
      image: AppImages.onboradingTwo,
      name: AppStrings.letsFixThat,
      title: AppStrings.letsFixThatTitle
  ),
  UnbordingContent(
      image: AppImages.onboradingThree,
      name: AppStrings.fitnessTraining,
      title: AppStrings.fitnessTrainingTitle
  ),
];