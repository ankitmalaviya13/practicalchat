import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../util/common_widgets.dart';
import '../../../../util/constant.dart';
import '../../../../util/constants/assets.dart';
import '../../../../util/constants/colors.dart';
import '../controllers/login_signup_controller.dart';

class SignupView extends GetView<LoginSignupController> {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Obx(() {
          return IgnorePointer(
            ignoring: controller.isSignupLoading.value,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: hw.height * 0.09),

                        SizedBox(height: hw.height * 0.02),
                        Center(
                          child: allWidgets.boldText(
                            text: 'Create a new account',
                            fontSize: 14.0,
                          ),
                        ),
                        SizedBox(height: hw.height * 0.04),
                        allWidgets.textField(
                          obscureText: false,
                          hintText: 'Enter name',
                          labelText: 'Name',
                          controller: controller.fullNameController,
                          keyBoardType: TextInputType.name,
                          suffixIcon: SizedBox(),
                        ),



                        SizedBox(height: hw.height * 0.03),
                        allWidgets.textField(
                          obscureText: false,
                          hintText: 'Enter email',
                          labelText: 'Email',
                          controller: controller.emailController,
                          keyBoardType: TextInputType.emailAddress,
                          suffixIcon: SizedBox(),
                        ),
                        SizedBox(height: hw.height * 0.03),
                        Obx(
                          () {
                            return allWidgets.textField(
                              obscureText: controller.isObSecureSignup.value,
                              hintText: '* * * * *',
                              labelText: 'Password',
                              controller: controller.passwordController,
                              keyBoardType: TextInputType.visiblePassword,
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  controller.isObSecureSignup.value = !controller.isObSecureSignup.value;
                                  //loginController.update();
                                },
                                child: controller.isObSecureSignup.value
                                    ? Icon(Icons.visibility, color: colors.black8)
                                    : Icon(
                                        Icons.visibility_off,
                                        color: colors.black8,
                                      ),
                              ),
                            );
                          },
                        ),
                        SizedBox(height: hw.height * 0.05),
                        Center(
                          child: allWidgets.commonButton(
                            text: 'Sign Up',
                            onPressed: controller.signUpOnTap,
                          ),
                        ),
                        SizedBox(height: 20,),

                        SizedBox(height: 20,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            allWidgets.regularText(
                              text: "If you have an account?",
                              fontSize: 14.0,
                            ),
                            SizedBox(width: hw.width * 0.002),
                            GestureDetector(
                              onTap: controller.registerNavigateLogin,
                              child: allWidgets.boldGradientText(text: 'Log In', fontSize: 14.0),
                            ),
                          ],
                        ),
                        SizedBox(height: hw.height * 0.013),
                      ],
                    ),
                  ),
                ),
                Obx(() => controller.isSignupLoading.value ? customIndicator : Container()),
                // Obx(() => noInternetConnection.value
                //     ? noInternetConnectionPopUp()
                //     : Container()),
              ],
            ),
          );
        }),
      ),
    );
  }
}
