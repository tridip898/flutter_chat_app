import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/constants/my_colors.dart';
import 'package:flutter_chat_app/constants/my_style.dart';
import 'package:flutter_chat_app/constants/my_widget.dart';
import 'package:flutter_chat_app/controller/login_controller.dart';
import 'package:flutter_chat_app/widget/my_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../constants/my_constant.dart';
import '../widget/my_edit_text.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      body: Padding(
        padding: mainPaddingAll,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
                    textInputType: TextInputType.number,
                    isPassword: true,
                    focusNode: controller.passwordFocusNode,
                  ),
                  MyWidgets().gapH(Get.height * 0.1),
                  MyButton(
                    btnText: 'Login',
                    onPressed: () {},
                  ),
                  MyWidgets().gapH(Get.height * 0.1),
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
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
