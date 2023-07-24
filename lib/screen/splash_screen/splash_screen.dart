import 'package:flutter/material.dart';
import 'package:flutter_chat_app/constants/my_colors.dart';
import 'package:flutter_chat_app/routes/app_pages.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controller/auth_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 4000), () {
      if (mounted) {
        setState(() {
          if (AuthController.instance.auth.currentUser != null) {
            Get.offNamed(Routes.HOME);
          } else {
            Get.offNamed(Routes.LOGIN);
          }
        });
      }
    });
    return Scaffold(
      body: Center(
        child: Icon(
          Icons.chat_outlined,
          size: 100.h,
          color: MyColors.primary,
        ),
      ),
    );
  }
}
