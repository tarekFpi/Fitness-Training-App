class ApiUrl {
  static const String baseUrl = "http://192.168.12.31:5003/api/v1";
  static const String imageUrl = "http://192.168.12.31:5003";
  static const String vidoeUrl = "http://192.168.12.31:5003/";
  // server url : http://115.127.156.14:5002/api/v1
  // local url : http://192.168.12.31:5003/api/v1
//========================= Authentication =========================

  static const String login = "/auth/user-login";
  static const String signUp = "/auth/user-signup";
  static const String signUpverifyOTP = "/auth/user-verify";
  static const String forgotPasswordVerify = "/auth/user-forget-verify";
  static const String forgotPassword = "/auth/user-forget-password";
  static const String forgotCreateNewPassword = "/auth/user-reset-password"; 
 // static const String resendOtp = ""; 


  //=============================== Home =============================
   static const String getHomeRecepiProgram = "/recipe-programme"; // get recipe programme

  //=============================== show WorkOutLatest Api=============================
  static const String getHomeWorkOutLatest = "/programme/latest";

  //=============================== show WorkOutList Api=============================

  static const String getHomeWorkOutList = "/programme";

  //===============================   getWorkOutListVidoe show By Id Api=============================
  static  getHomeWorkOutListVideo({required String id}) => "/programme/$id";

  //===============================   getWorkOutListVidoeAdd By Id Api=============================
  static String createWorkOutVideo = "/user-workout/create/";

}
