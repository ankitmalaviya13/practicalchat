import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../util/common_widgets.dart';
import '../../../../util/constant.dart';
import '../../../../util/constants/assets.dart';
import '../../../../util/constants/colors.dart';
import '../controllers/login_signup_controller.dart';

class LoginView extends GetView<LoginSignupController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      assignId: true,
      init: LoginSignupController(),
      builder: (logic) {
        return GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
            body: Obx(() {
              return IgnorePointer(
                ignoring: controller.isLoginLoading.value,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: hw.height * 0.09),


                                SizedBox(height: hw.height * 0.03),
                                Center(
                                  child: allWidgets.boldText(
                                    text: 'Log in to Continue',
                                    fontSize: 14.0,
                                  ),
                                ),
                                SizedBox(height: hw.height * 0.05),
                                allWidgets.textField(
                                  obscureText: false,
                                  hintText: 'enter email',
                                  labelText: 'Email',
                                  controller: controller.emailController,
                                  keyBoardType: TextInputType.emailAddress,
                                  suffixIcon: SizedBox(),
                                ),
                                SizedBox(height: hw.height * 0.03),
                                Obx(
                                      () {
                                    return allWidgets.textField(
                                      obscureText: controller.isObSecure.value,
                                      hintText: '* * * * *',
                                      labelText: 'Password',
                                      controller: controller.passwordController,
                                      keyBoardType: TextInputType.visiblePassword,
                                      suffixIcon: GestureDetector(
                                        onTap: () {
                                          controller.isObSecure.value = !controller.isObSecure.value;
                                          //loginController.update();
                                        },
                                        child: controller.isObSecure.value ? Icon(Icons.visibility, color: colors.black8) : Icon(Icons.visibility_off, color: colors.black8),
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(height: hw.height * 0.2),



                              ],
                            ),


                            Center(
                              child: allWidgets.commonButton(
                                text: 'Log In',
                                onPressed: controller.loginOnTap,
                              ),
                            ),


                            SizedBox(height: 50,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                allWidgets.regularText(
                                  text: "If you have an account?",
                                  fontSize: 14.0,
                                ),
                                SizedBox(width: hw.width * 0.002),
                                GestureDetector(
                                  onTap: controller.loginNavigateRegister,
                                  child: allWidgets.boldGradientText(text: 'Sign In', fontSize: 14.0),
                                ),
                              ],
                            ),

                            SizedBox(height: hw.height * 0.013),
                          ],
                        ),
                      ),
                    ),
                    Obx(() => controller.isLoginLoading.value ? customIndicator : Container()),

                  ],
                ),
              );
            }),
          ),
        );
      },
    );
  }
}
