import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/constants/my_colors.dart';
import 'package:flutter_chat_app/constants/my_style.dart';
import 'package:flutter_chat_app/constants/my_widget.dart';
import 'package:flutter_chat_app/controller/auth_controller.dart';
import 'package:flutter_chat_app/screen/login_screen/login_controller.dart';
import 'package:flutter_chat_app/widget/my_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../constants/my_constant.dart';
import '../../widget/my_edit_text.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: mainPaddingAll,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyWidgets().gapH(Get.height*0.15),
              Icon(
                Icons.chat_outlined,
                size: 100.h,
                color: MyColors.primary,
              ),
              Form(
                child: Column(
                  children: [
                    MyEditText(
                      controller: controller.emailController,
                      title: "Email",
                      focusNode: controller.emailFocusNode,
                    ),
                    MyWidgets().gapH12(),
                    MyEditText(
                      controller: controller.passwordController,
                      title: "Password",
                      textInputType: TextInputType.text,
                      isPassword: true,
                      focusNode: controller.passwordFocusNode,
                    ),
                    MyWidgets().gapH(Get.height * 0.1),
                    MyButton(
                      btnText: 'Login',
                      onPressed: () {
                        AuthController.instance.signInUser(controller.emailController.text, controller.passwordController.text);
                      },
                    ),
                    MyWidgets().gapH(Get.height * 0.03),
                    RichText(
                      text: TextSpan(
                        text: "Don't have an account? ",
                        style: textRegularStyle(),
                        children: [
                          TextSpan(
                            text: "Register",
                            style: textRegularStyle(
                              fontSize: 15,
                              color: MyColors.primary,
                            ),
                            recognizer: TapGestureRecognizer()..onTap=(){
                              Get.toNamed('/register');
                            }
                          )
                        ],
                      ),
                    ),
                    MyWidgets().gapH(Get.height * 0.03),
                    Text("Or",style: textRegularStyle(fontSize: 20),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                            onTap: () {
                              AuthController.instance.signInWithGoogle();
                            },
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: MyColors.grey.withOpacity(0.2),
                                  border: Border.all(
                                      color: MyColors.white, width: 1),
                                  borderRadius: borderCircular,),
                              child: Row(
                                children: [
                                  Image.asset(
                                    "assets/png/google.png",
                                    height: 30.h,
                                  ),
                                  MyWidgets().gapW16(),
                                  Text(
                                    "Sign in with Google",
                                    style: textRegularStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: MyColors.primary,),
                                  ),
                                ],
                              ),
                            )),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
