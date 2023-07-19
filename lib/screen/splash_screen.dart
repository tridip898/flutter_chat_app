import 'package:flutter/material.dart';
import 'package:flutter_chat_app/constants/my_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 4000), () {
      Get.toNamed('/login');
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
