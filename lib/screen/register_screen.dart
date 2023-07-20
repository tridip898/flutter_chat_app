import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/constants/my_colors.dart';
import 'package:flutter_chat_app/constants/my_style.dart';
import 'package:flutter_chat_app/constants/my_widget.dart';
import 'package:flutter_chat_app/controller/auth_controller.dart';
import 'package:flutter_chat_app/controller/login_controller.dart';
import 'package:flutter_chat_app/controller/register_controller.dart';
import 'package:flutter_chat_app/widget/my_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../constants/my_constant.dart';
import '../widget/my_edit_text.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final controller = Get.put(RegistrationController());

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
              MyWidgets().gapH(Get.height*0.1),
              Icon(
                Icons.chat_outlined,
                size: 100.h,
                color: MyColors.primary,
              ),
              Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    MyEditText(
                      controller: controller.fullNameController,
                      title: "Full Name",
                      focusNode: controller.fullNameFocusNode,
                      nextFocus: controller.phoneFocusNode,
                    ),
                    MyEditText(
                      controller: controller.phoneController,
                      title: "Phone",
                      focusNode: controller.phoneFocusNode,
                      nextFocus: controller.emailFocusNode,
                    ),
                    MyEditText(
                      controller: controller.emailController,
                      title: "Email",
                      focusNode: controller.emailFocusNode,
                      nextFocus: controller.passwordFocusNode,
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
                      btnText: 'Registration',
                      onPressed: () {
                        AuthController.instance.registerUser(controller.emailController.text, controller.passwordController.text);
                      },
                    ),
                    MyWidgets().gapH(Get.height * 0.05),
                    RichText(
                      text: TextSpan(
                        text: "Already have an account? ",
                        style: textRegularStyle(),
                        children: [
                          TextSpan(
                              text: "Login",
                              style: textRegularStyle(
                                fontSize: 15,
                                color: MyColors.primary,
                              ),
                              recognizer: TapGestureRecognizer()..onTap=(){
                                Get.toNamed('/login');
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
      ),
    );
  }
}
