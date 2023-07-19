import 'package:flutter/material.dart';
import 'package:flutter_chat_app/constants/my_constant.dart';
import 'package:flutter_chat_app/constants/my_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyButton extends StatelessWidget {
  final String btnText;
  void Function()? onPressed;
  MyButton({super.key, required this.btnText,this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(Get.width * 0.8, 55.h),
        shape: RoundedRectangleBorder(borderRadius: borderCircular)
      ),
      child: Text(
        btnText,
        style: textButtonStyle(),
      ),
    );
  }
}
