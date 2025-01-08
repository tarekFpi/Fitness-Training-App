class ApiUrl {
   // static const String baseUrl = "http://192.168.12.31:5003/api/v1"; //old baseUrl

   static const String baseUrl = "http://54.157.71.177:5003/api/v1";

 // static const String imageUrl = "http://192.168.12.31:5003";

  static const String socketUrl = "http://192.168.12.31:5003/chat";


///========================= Authentication ===========================

  static const String login = "/auth/user-login";
  static const String signUp = "/auth/user-signup";
  static const String signUpverifyOTP = "/auth/user-verify";
  static const String forgotPasswordVerify = "/auth/user-forget-verify";
  static const String forgotPassword = "/auth/user-forget-password";
  static const String forgotCreateNewPassword = "/auth/user-reset-password";

  static const String chagnePassword = "/auth/user-change-password";

  static const String socialAuth = "/auth/social-login";

 /// static const String resendOtp = "";


  ///=============================== Home   get recipe programme=============================
   static const String getHomeRecepiProgram = "/recipe-programme";

  ///=============================== Home   get recipe programme single Data =============================
  static String getRecepiNutritionProgram({required String id}) =>  "/recipe-programme/$id";

  ///=============================== show WorkOutLatest Api=============================
  static const String getHomeWorkOutLatest = "/programme/latest";


  ///=============================== show privacy-policy  Api=============================
  static const String getPrivacy_policy = "/setting/privacy-policy";


  ///=============================== subscribe exting Check  =============================
  static const String subscribe_extingCheck = "/subscribe/my-subscription";


  ///=============================== user-accept-privacy-policy exist Api=============================
  static const String existPrivacy_policy = "/setting/user-accept-privacy-policy";

  ///=============================== user-accept-privacy-policy crate Api=============================
  static const String cratePrivacy_policy = "/setting/user-accept-privacy-policy";


  ///=============================== setting-faq show Api=============================
  static const String settingFaq = "/setting/faq";

  //=============================== progress Tracking  show Api =============================
  static   String progressTrackingList ({required String date}) => "/user-workout/by-date?exerciseDate=$date";


  ///=============================== chart weekly show Api =============================
  static   String chartWeekly = "/user-exercise/weekly-tracking";

  ///=============================== chart monthly show Api =============================
  static   String monthlyWeekly = "/user-exercise/monthly-tracking";


  ///=============================== user-exercise/monthly-status  show Api =============================
  static   String statusExercise = "/user-exercise/monthly-status";



  ///=============================== users-profile show Api=============================
  static const String userProfile = "/users/profile";


  ///=============================== users-profile Update Api=============================
  static const String userProfileUpdate = "/users/update-user-profile";


  ///=============================== chat/messages Api=============================
  static const String chatMessage = "/chat/messages";

  ///=============================== show WorkOutList Api=============================
  static const String getHomeWorkOutList = "/programme";


  ///=============================== show WorkOutList Api=============================

  static  String getWorkOutListSearch({required String title}) => "/programme?searchTerm=$title";


  ///=============================== subscribe package show Api =============================
  static const String package = "/package";

   ///=============================== subscribe create Api=============================
   static const String subscribeCreate = "/subscribe/create";

   ///=============================== my-subscription Api=============================
   ///
   static const String mySubscribe = "/subscribe/my-subscription";


   ///===============================   getWorkOutListVidoe show By Id Api=============================
  static  getHomeWorkOutListVideo({required String id}) => "/programme/$id";


   ///=============================== qoute  Api =============================
  static String getQoute= "/qoute";

  ///===============================   getWorkOutListVidoeAdd By Id Api=============================
  static String createWorkOutVideo = "/user-workout/create/";


  ///===============================   get Workout Custom Plan By data Api=============================
  static String customPlanWorkOut({required List<String>data, required String weeek_status}) =>"/custom-workout/user?searchTerm=$weeek_status&fitness_goal=$data";


  ///===============================   get Recipe Nutrition breakfast Show Api=============================
  static String getNutritionBreakfastRecipes="/nutrition-plan?searchTerm=breakfast";

  ///===============================   get Recipe Nutrition Lunch Show Api=============================
  static String getNutritionLunchRecipes="/nutrition-plan?searchTerm=lunch";

  ///===============================   get Recipe Nutrition Lunch Show Api=============================
  static String getNutritionDinnerRecipes="/nutrition-plan?searchTerm=dinner";


  ///================= customize-nutrition-plan/user-customize ====================
  static String getNutritionCustomizePlanDay({required String day}) => "/customize-nutrition-plan/user-customize/$day";


  ///===============================  customize-nutrition-plan create  Api=============================
  static String nutritionMealPlanWorkOut="/customize-nutrition-plan/create";

  ///===============================  customize-nutrition-plan create  Api=============================
  static String getSingeNutritionMealPlan({required String day}) =>"/customize-nutrition-plan/user-customize-single/$day";


  ///===============================  customize-nutrition-plan create  Api=============================
  static String getSingeNutritionMealPlanUpdate({required String id}) =>"/customize-nutrition-plan/$id";


  ///===============================   getArticleList  Api=============================
  static String getArticleList = "/article";

  ///===============================   getArticleList  Api search =============================
  static String getArticleListSearch ({required String topic}) => "/article?searchTerm=$topic";

  ///===============================  insert Favorite ArticleList  Api=============================
  static String favoriteArticleInsert = "/article/favorite";


  ///===============================  insert Favorite workoutList  Api=============================
  static String favoriteWorkOutInsert = "/workout/favorite";

  ///===============================  insert Favorite workoutList  Api=============================
  static String getFavoriteWorkOutList = "/workout/favorite";


  ///===============================  insert Favorite Article  Api=============================
  static String getFavoriteArticleList = "/article/favorite";


  ///===============================   favorite Article Delete  By Id Api=============================

  static   favoriteArticleDelete({required String id}) => "/article/favorite/$id";


  ///===============================  favorite WorkOut Delete By Id Api=============================
  static   favoriteWorkOutDelete({required String id}) => "/workout/favorite/$id";

  ///===============================  notification user type reminders  Api=============================
  static  String remindersNotificationList ="/notification/user?type=reminders";


  ///===============================  notification system type Api=============================
  static  String systemNotificationList ="/notification/user?type=system";


  ///=============================== Community post create api =============================
  static String createPostApi="/post/create";

  ///=============================== Community comment create api =============================
  static String createCommentApi({required String id}) =>"/post/$id/comments";


  ///=============================== Community post Show All api =============================
   static String postShowApi ="/post";

  /// static String postShowApi ="/post?type=others";

  /// static String postShowApi="/post?type=me";

  ///=============================== Community post Like Insert api =============================
  static String postLikeInsert ({required String id}) =>"/post/$id/like";


  ///=============================== Community post UnLike Insert api =============================
  static String unLike({required String id}) =>"/post/$id/like";


  ///=============================== Community post UnLike api =============================
  static String postUnLike ({required String id}) =>"/post/$id/like";


  ///=============================== Community post show By id api =============================
  static String postLikeShowById ({required String id}) =>"/post/$id/likes";
}
