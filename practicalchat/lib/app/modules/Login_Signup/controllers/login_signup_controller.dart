

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../util/common_widgets.dart';
import '../../../../util/constant.dart';
import '../../../../util/preferences.dart';
import '../../../data/network/apis/login signup apis.dart';
import '../../home/views/home_view.dart';
import '../views/login_view.dart';
import '../views/signup_view.dart';

class LoginSignupController extends GetxController {
  var fullNameController = TextEditingController();


  var emailController = TextEditingController();

  var passwordController = TextEditingController();
  var newPasswordController = TextEditingController();


  //login screen variable
  var isObSecure = true.obs;
  var isLoginLoading = false.obs;
  var rememberMe = false.obs;
  String? gName;
  String? gEmail;
  String? image;
  //signup screen variable
  var isObSecureSignup = true.obs;
  var isSignupLoading = false.obs;

  //forget screen variable
  var isObSecureForget = false.obs;
  var isForgetLoading = false.obs;

  //verification screen variable
  var isVerificationLoading = false.obs;

  //resetPassword screen variable
  var isObSecureNewPassword = true.obs;
  var isObSecureConfirmPassword = true.obs;
  var isResetLoading = false.obs;

  LoginSignupApi loginSignupApi = LoginSignupApi();

  var screen = "login";







  @override
  void onInit() async {
    getData();

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  registerNavigateLogin() {
    FocusScope.of(Get.context!).unfocus();
    fullNameController.clear();
    emailController.clear();
    passwordController.clear();
    screen = "login";
    // Get.back();
    Get.off(LoginView());
  }


  loginNavigateRegister() {
    FocusScope.of(Get.context!).unfocus();
    emailController.clear();
    passwordController.clear();
    screen = "signup";
    // Get.off(() => SignupView());
    Get.to(() => SignupView());
  }



  loginOnTap() {
    if (loginValidate()) {
      FocusScope.of(Get.context!).unfocus();
   loginApi();
    }
  }




  loginApi() async {
    isLoginLoading.value = true;
    final response = await loginSignupApi.login(
      data: {
        'email': emailController.text,
        'password': passwordController.text,
      },
    );
    print(response.data);
    print("response.data");
    if (response.statusCode == 200) {
      if(response.data["Status"] == 1){
        print(response.data["UserToken"]);
        print(response.data["info"]["_id"]);
      await  storedata(response.data["info"]["_id"],response.data["UserToken"]);
        Toasty.showtoast(response.data["Message"].toString());
        isLoginLoading.value = true;
Get.to(()=> HomeView());

      }else{
        isLoginLoading.value = false;
        Toasty.showtoast(response.data["Message"].toString());
      }

    } else {
      isLoginLoading.value = false;
      Toasty.showtoast(response.data["Message"].toString());
    }
  }
  signUpOnTap() {
    if (signupValidate()) {
      FocusScope.of(Get.context!).unfocus();
      signupApi();
    }
  }

  signupApi() async {
    isSignupLoading.value = true;

    final response = await loginSignupApi.signUp(
      data: {
        'email': emailController.text,
        'password': passwordController.text,
        'name': fullNameController.text,
      },
    );
    print(response.data);
    print("response.data");
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(response.data["Status"]);
      if(response.data["Status"] == 1){
        print(response.data["UserToken"]);
        print(response.data["user"]["_id"]);
        // storedata(response.data["user"]["_id"],response.data["UserToken"]);
        Toasty.showtoast(response.data["Message"].toString());
        isSignupLoading.value = true;
        registerNavigateLogin();

      }else{
        isSignupLoading.value = false;
        Toasty.showtoast(response.data["Message"].toString());
      }



    } else {
      isSignupLoading.value = false;
      Toasty.showtoast(response.data["Message"].toString());
    }
  }
storedata(id,token) async {
    print("fjsdfgsdkhjgksdjfkj");
    print(id);
    print(token);

  await box.write(PrefsKey.userid, id);
  await box.write("usertoken", token);
  await box.write(PrefsKey.userToken,token );
  print("fdklsfhjlksjlksfdlk");
  print(box.read(PrefsKey.userToken));
}










  getData() async {


  }







  bool loginValidate() {
    if (emailController.text.isEmpty) {
      Toasty.showtoast('Please Enter Your Email');
      return false;
    } else if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(emailController.text)  &&
        !RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[\w]{2,}$').hasMatch(emailController.text)) {
      Toasty.showtoast('Please Enter Valid Email');
      return false;
    } else if (passwordController.text.isEmpty) {
      Toasty.showtoast('Please Enter Your Password');
      return false;
    } else if (passwordController.text.length < 6) {
      Toasty.showtoast(
        'Please Enter min 6 Character Password',
      );
      return false;
    } else {
      return true;
    }
  }




  bool signupValidate() {
    print(RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[\w]{2,}$').hasMatch(emailController.text).toString());
    print(RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(emailController.text).toString());
    print("sdfkjfhgjkdfhkjdsfkj");
    if (fullNameController.text.isEmpty) {
      Toasty.showtoast('Please Enter Your First Name');
      return false;
    }

 else if (emailController.text.isEmpty) {
      Toasty.showtoast('Please Enter Your Email');
      return false;
    } else if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(emailController.text)  &&
        !RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[\w]{2,}$').hasMatch(emailController.text)) {
      Toasty.showtoast('Please Enter Valid Email');
      return false;
    } else if (passwordController.text.isEmpty) {
      Toasty.showtoast('Please Enter Your Password');
      return false;
    } else if (passwordController.text.length < 6) {
      Toasty.showtoast(
        'Please Enter min 6 Character Password',
      );
      return false;
    } else {
      return true;
    }
  }


  bool emailValidate() {
    if (emailController.text.isEmpty) {
      Toasty.showtoast('Please Enter Your Email');
      return false;
    } else if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(emailController.text)  &&
        !RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[\w]{2,}$').hasMatch(emailController.text)) {
      Toasty.showtoast('Please Enter Valid Email');
      return false;
    } else {
      return true;
    }
  }
















}
