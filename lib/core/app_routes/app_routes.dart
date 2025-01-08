// ignore_for_file: prefer_const_constructors

import 'package:fitness_training_app/view/screens/authentication/change_password_screen/change_password_screen.dart';
import 'package:fitness_training_app/view/screens/authentication/verification_Screen/verification_screen.dart';
import 'package:fitness_training_app/view/screens/chat_screen/chat_screen.dart';
import 'package:fitness_training_app/view/screens/chat_screen/inner_widget/message_screen.dart';
import 'package:fitness_training_app/view/screens/community_screen/community_comment_post.dart';
import 'package:fitness_training_app/view/screens/community_screen/community_screen.dart';
import 'package:fitness_training_app/view/screens/costom_plan_screen/costom_plan_screen.dart';
import 'package:fitness_training_app/view/screens/favorite-screen/favorite_screen.dart';
import 'package:fitness_training_app/view/screens/meal_plan_screen/meal_plan_screen.dart';
import 'package:fitness_training_app/view/screens/nutrition_screen/inner_widget/custom_meal_create_screen.dart';
import 'package:fitness_training_app/view/screens/nutrition_screen/nutrition_screen.dart';
import 'package:fitness_training_app/view/screens/nutrition_screen/recipe_ingredients_screen.dart';
import 'package:fitness_training_app/view/screens/progress_tracking_screen/progress_tracking_screen.dart';
import 'package:fitness_training_app/view/screens/resources_screen/resources_articles_screen.dart';
import 'package:fitness_training_app/view/screens/resources_screen/resources_screen.dart';
import 'package:fitness_training_app/view/screens/support_screen/subscription_screen.dart';
import 'package:fitness_training_app/view/screens/support_screen/support_screen.dart';
import 'package:fitness_training_app/view/screens/support_screen/support_zoom_screen.dart';
import 'package:fitness_training_app/view/screens/workout_resource_screen/workout_resource_screen.dart';
import 'package:fitness_training_app/view/screens/workout_resource_screen/workout_resource_video_play_screen.dart';
import 'package:fitness_training_app/view/screens/profile_screen/edit_profile_screen.dart';
import 'package:fitness_training_app/view/screens/profile_screen/help_center_screen/help_center_screen.dart';
import 'package:fitness_training_app/view/screens/profile_screen/privacy_policy_accepted.dart';
import 'package:fitness_training_app/view/screens/profile_screen/privacy_policy_screen.dart';
import 'package:fitness_training_app/view/screens/profile_screen/profile_screen.dart';
import 'package:fitness_training_app/view/screens/profile_screen/visa_card_screen/visa_card_screen.dart';
import 'package:get/get.dart';
import '../../view/screens/authentication/create_password_screen/new_password_screen.dart';
import '../../view/screens/authentication/sign_up_screen/finger_screen/finger_screen.dart';
import '../../view/screens/authentication/forgot_password_screen/forgot_password_screen.dart';
import '../../view/screens/authentication/registration_screen/goal_list_screen.dart';
import '../../view/screens/physical_activity/physical_activity_screen.dart';
import '../../view/screens/authentication/registration_screen/registration_field_screen.dart';
import '../../view/screens/authentication/registration_screen/registration_screen.dart';
import '../../view/screens/authentication/sign_in_screen/sign_in_screen.dart';
import '../../view/screens/authentication/sign_up_screen/sign_up_screen.dart';
import '../../view/screens/authentication/your_profile_screen/your_profile_screen.dart';
import '../../view/screens/home_screen/home_screen.dart';
import '../../view/screens/workout_screen/workout_screen.dart';
import '../../view/screens/notification_screen/notification_screen.dart';
import '../../view/screens/onboarding_screen/onboarding_screen.dart';
import '../../view/screens/search_screen/search_screen.dart';
import '../../view/screens/splash_screen/splash_screen.dart';

///=========================App Routes=========================
class AppRoutes {
  static const String splashScreen = "/SplashScreen";
  static const String onboardingScreen = "/OnboardingScreen";
  static const String signInScreen = "/SignInScreen";
  static const String signUpScreen = "/SignUpScreen";
  static const String forgotPasswordScreen = "/ForgotPasswordScreen";
  static const String newPasswordScreen = "/NewPasswordScreen";
  static const String fingerScreen = "/FingerScreen";
  static const String registrationScreen = "/RegistrationScreen";
  static const String registrationFieldScreen = "/RegistrationFieldScreen";
  static const String goalListScreen = "/GoalListScreen";
  static const String physicalActivityScreen = "/PhysicalActivityScreen";
  static const String yourProfileScreen = "/YourProfileScreen";
  static const String homeScreen = "/HomeScreen";
  static const String workoutScreen = "/WorkoutScreen";
  static const String profileScreen = "/ProfileScreen";
  static const String editProfileScreen = "/EditProfileScreen";
  static const String favoriteScreen = "/FavoriteScreen";
  static const String privacyPolicyScreen = "/PrivacyPolicyScreen";
  static const String privacyPolicyAccepted = "/PrivacyPolicyAccepted";
  static const String changePasswordScreen = "/ChangePasswordScreen";
  static const String visaCardScreen = "/VisaCardScreen";
  static const String workoutResourceScreen = "/WorkoutResourceScreen";
  static const String workoutResourceVideoPlayScreen = "/WorkoutResourceVideoPlayScreen";
  static const String costomPlanScreen = "/CostomPlanScreen";
  static const String nutritionScreen = "/NutritionScreen";
  static const String recipeIngredientsScreen = "/RecipeIngredientsScreen";
  static const String RecipeMealPlanCreateScreen = "/RecipeMealPlanCreateScreen";
  static const String mealPlanScreen = "/MealPlanScreen";
  static const String supportScreen = "/SupportScreen";
  static const String subscriptionScreen = "/SubscriptionScreen";
  static const String verificationScreen = "/VerificationScreen";
  static const String resourcesScreen = "/ResourcesScreen";
  static const String chatScreen = "/ChatScreen";
  static const String progressTrackingScreen = "/ProgressTrackingScreen";
  static const String helpCenterScreen = "/HelpCenterScreen";
  static const String resourcesArticlesScreen = "/ResourcesArticlesScreen";
  static const String messageScreen = "/MessageScreen";
  static const String zoomCallScreen = "/ZoomCallScreen";
  static const String progressGraphTracking = "/ProgressGraphTracking";
  static const String communityScreen = "/CommunityScreen";
  static const String communityCommentPost = "/CommunityCommentPost";


  ///======================== Notification Routes ========================

  static const String notificationScreen = "/NotificationScreen"; 

  ///========================== Search Routes ===========================

  static const String searchScreen = "/SearchScreen";

  static List<GetPage> routes = [
    ///===========================Authentication==========================
    GetPage(name: splashScreen, page: () => const SplashScreen()),
    GetPage(name: onboardingScreen, page: () => OnboardingScreen()),
    GetPage(name: signInScreen, page: () => SignInScreen()),
    GetPage(name: signUpScreen, page: () => SignUpScreen()),
    GetPage(name: forgotPasswordScreen, page: () => ForgotPasswordScreen()),
    GetPage(name: newPasswordScreen, page: () => NewPasswordScreen()),
    GetPage(name: fingerScreen, page: () => FingerScreen()),
    GetPage(name: registrationScreen, page: () => RegistrationScreen()),
    GetPage(name: registrationFieldScreen, page: () => RegistrationFieldScreen()),
    GetPage(name: goalListScreen, page: () => GoalListScreen()),
    GetPage(name: physicalActivityScreen, page: () => PhysicalActivityScreen()),
    GetPage(name: yourProfileScreen, page: () => YourProfileScreen()),
    GetPage(name: homeScreen, page: () => HomeScreen()),
    GetPage(name: workoutScreen, page: () => WorkoutScreen()),
    GetPage(name: profileScreen, page: () => ProfileScreen()),
    GetPage(name: editProfileScreen, page: () => EditProfileScreen()),
    GetPage(name: favoriteScreen, page: () => FavoriteScreen()),
    GetPage(name: privacyPolicyScreen, page: () => PrivacyPolicyScreen()),
    GetPage(name: privacyPolicyAccepted, page: () => PrivacyPolicyAccepted()),
    GetPage(name: changePasswordScreen, page: () => ChangePasswordScreen()),
    GetPage(name: visaCardScreen, page: () => VisaCardScreen()),
    GetPage(name: workoutResourceScreen, page: () => WorkoutResourceScreen()),
    GetPage(name: workoutResourceVideoPlayScreen, page: () => WorkoutResourceVideoPlayScreen()),
    GetPage(name: costomPlanScreen, page: () => CostomPlanScreen()),
    GetPage(name: nutritionScreen, page: () => NutritionScreen()),
    GetPage(name: recipeIngredientsScreen, page: () => RecipeIngredientsScreen()),
    GetPage(name: RecipeMealPlanCreateScreen, page: () => CustomMalePlanCreateScreen()),
    GetPage(name: mealPlanScreen, page: () => MealPlanScreen()),
    GetPage(name: supportScreen, page: () => SupportScreen()),
    GetPage(name: subscriptionScreen, page: () => SubscriptionScreen()),
    GetPage(name: verificationScreen, page: () => VerificationScreen()),
    GetPage(name: resourcesScreen, page: () => ResourcesScreen()),
    GetPage(name: chatScreen, page: () => ChatScreen()),
    GetPage(name: progressTrackingScreen, page: () => ProgressTrackingScreen()),
    GetPage(name: helpCenterScreen, page: () => HelpCenterScreen()),
    GetPage(name: resourcesArticlesScreen, page: () => ResourcesArticlesScreen()),
    GetPage(name: messageScreen, page: () => MessageScreen()),
    GetPage(name: communityScreen, page: () => CommunityScreen()),
    GetPage(name: communityCommentPost, page: () => CommunityCommentPost()),
    GetPage(name: zoomCallScreen, page: () => ZoomCallScreen()),
    //GetPage(name: progressGraphTracking, page: () => ProgressGraphTracking()),



    //=========================== Notification ===========================
    GetPage(name: notificationScreen, page: () => NotificationScreen()), 
    //========================== Search =========================== 
    GetPage(name: searchScreen, page: () => SearchScreen()),
  ];
}
