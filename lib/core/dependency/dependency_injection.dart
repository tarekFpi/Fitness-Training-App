import 'package:fitness_training_app/view/screens/authentication/auth_controller/auth_controller.dart';
import 'package:fitness_training_app/view/screens/authentication/registration_screen/registration_controller/registration_controller.dart';
import 'package:fitness_training_app/view/screens/chat_screen/chat_controller/chat_controller.dart';
import 'package:fitness_training_app/view/screens/community_screen/communty_controller/communty_controller.dart';
import 'package:fitness_training_app/view/screens/costom_plan_screen/custom_plan_controller/custom_plan_controller.dart';
import 'package:fitness_training_app/view/screens/favorite-screen/favorite_controller/favorite_controller.dart';
import 'package:fitness_training_app/view/screens/home_screen/home_controller/home_controller.dart';
import 'package:fitness_training_app/view/screens/meal_plan_screen/inner_widget/meal_plan_image_controller.dart';
import 'package:fitness_training_app/view/screens/nutrition_screen/nutrition_controller/nutrition_controller.dart';
import 'package:fitness_training_app/view/screens/progress_graph_tracking/profress_graph_controller/progress_graph_controller.dart';
import 'package:fitness_training_app/view/screens/progress_tracking_screen/progress_tracking_controller/progress_controller.dart';
import 'package:fitness_training_app/view/screens/resources_screen/resources_controller/resources_controller.dart';
import 'package:fitness_training_app/view/screens/notification_screen/notification_controller/notification_controller.dart';
import 'package:fitness_training_app/view/screens/profile_screen/edit_profile_screen/edit_profile_controller/edit_profile_controller.dart';
import 'package:fitness_training_app/view/screens/profile_screen/profile_controller/profile_controller.dart';
import 'package:fitness_training_app/view/screens/search_screen/articaleSearchController.dart';
import 'package:fitness_training_app/view/screens/search_screen/workoutSearchController.dart';
import 'package:fitness_training_app/view/screens/support_screen/subscription_controller/SubscriptionController.dart';
import 'package:get/get.dart';

import '../../view/screens/onboarding_screen/onboarding_controller/onboarding_controller.dart';
import '../../view/screens/workout_resource_screen/video_controller.dart/video_controller.dart';

class DependencyInjection extends Bindings {
  @override
  void dependencies() {

    ///========================== User section==================
    Get.lazyPut(() => OnboardingController(), fenix: true);
    Get.lazyPut(() => NotificationController(), fenix: true);
    Get.lazyPut(() => FavoriteController(), fenix: true);
    Get.lazyPut(() => MealPlanImageController(), fenix: true);
    Get.lazyPut(() => ResourcesController(), fenix: true);
    Get.lazyPut(() => ProgressController(), fenix: true);
    Get.lazyPut(() => ProfileController(), fenix: true);
    Get.lazyPut(() => EditProfileController(), fenix: true);
    Get.lazyPut(() => ChatController(), fenix: true);
    Get.lazyPut(() => NutritionController(), fenix: true);
    Get.lazyPut(() => CustomPlanController(), fenix: true);
    Get.lazyPut(() => RegistrationController(), fenix: true);
    Get.lazyPut(() => ProgressGraphController(), fenix: true);
    Get.lazyPut(() => CommuntyController(), fenix: true);
    Get.lazyPut(() => AuthController(), fenix: true);
    Get.lazyPut(() => VideoController(), fenix: true);
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => SubscriptionController(), fenix: true);
    Get.lazyPut(() => WorkoutSearchController(), fenix: true);
    Get.lazyPut(() => ArticleSearchController(), fenix: true);

  }
}
