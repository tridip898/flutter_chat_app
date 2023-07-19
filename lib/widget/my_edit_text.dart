import 'package:flutter/material.dart';
import 'package:flutter_chat_app/constants/my_colors.dart';
import 'package:flutter_chat_app/constants/my_style.dart';
import 'package:flutter_chat_app/constants/my_widget.dart';

import '../constants/my_constant.dart';

class MyEditText extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final bool isPassword, showPassword;
  final FocusNode? focusNode, nextFocus;
  final TextInputType textInputType;

  const MyEditText(
      {super.key,
      required this.title,
      this.isPassword = false,
      this.showPassword = false,
      this.focusNode,
      this.textInputType = TextInputType.text,
      this.nextFocus,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: textRegularStyle(fontSize: 17, fontWeight: FontWeight.w500),
        ),
        MyWidgets().gapH(4),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: borderCircular,
                borderSide:
                    const BorderSide(color: MyColors.primary, width: 1)),
            enabledBorder: OutlineInputBorder(
                borderRadius: borderCircular,
                borderSide:
                    const BorderSide(color: MyColors.primary, width: 1)),
            focusedBorder: OutlineInputBorder(
                borderRadius: borderCircular,
                borderSide:
                    const BorderSide(color: MyColors.primary, width: 1)),
            errorBorder: OutlineInputBorder(
                borderRadius: borderCircular,
                borderSide:
                    const BorderSide(color: MyColors.primary, width: 1)),
            hintText: "Enter your ${title.toLowerCase()}",
          ),
          keyboardType: textInputType,
          obscureText: isPassword ? true : false,
          focusNode: focusNode,
        )
      ],
    );
  }
}
