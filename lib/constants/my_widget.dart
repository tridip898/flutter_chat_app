import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../constants/my_colors.dart';
import 'my_constant.dart';

class MyWidgets {
  Widget gapH(double height) {
    return SizedBox(
      height: height.h,
    );
  }

  Widget gapW(double width) {
    return SizedBox(
      width: width.w,
    );
  }

  Widget gapW8() {
    return SizedBox(
      width: 8.w,
    );
  }

  Widget gapH8() {
    return SizedBox(
      height: 8.h,
    );
  }

  Widget gapH16() {
    return SizedBox(
      height: 16.h,
    );
  }

  Widget gapW16() {
    return SizedBox(
      width: 16.w,
    );
  }

  Widget gapW12() {
    return SizedBox(
      width: 12.w,
    );
  }

  Widget gapH12() {
    return SizedBox(
      height: 12.h,
    );
  }

  Widget gapW24() {
    return SizedBox(
      width: 24.w,
    );
  }

  Widget gapH24() {
    return SizedBox(
      height: 24.h,
    );
  }

  SnackbarController getSnackBar(
      {title = "Title",
        message = " Some message",
        int waitingTime = 2,
        int animationDuration = 500,
        snackPosition = SnackPosition.TOP,
        Color backgroundColor = MyColors.primary,
        double backgroundColorOpacity = .7,
        colorText = MyColors.white}) {
    return Get.snackbar(title, message,
        snackPosition: snackPosition,
        duration: Duration(seconds: waitingTime),
        animationDuration: Duration(milliseconds: animationDuration),
        backgroundColor: backgroundColor.withOpacity(backgroundColorOpacity),
        colorText: colorText);
  }

  RoundedRectangleBorder myButtonMaterialStateShape(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius));
    }
    return RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius));
  }

  double myButtonMaterialStateElevation(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return 3;
    }
    return 3;
  }

  double myButtonMaterialStateElevationForTransparent(
      Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return 3;
    }
    return 0;
  }

  Color myButtonMaterialStateBlueColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return MyColors.textColorBlue.withOpacity(.6);
    }
    return MyColors.textColorBlue;
  }

  Color myButtonMaterialStateColorTransparent(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return MyColors.primary.withOpacity(0.7);
    }
    return MyColors.primary.withOpacity(0.7);
  }

  Color myButtonMaterialStateColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return MyColors.primary;
    }
    return MyColors.primary;
  }

  // showSimpleDialog(
  //     String title,
  //     String body,
  //     retryClick, {
  //       buttonText = "Try Again",
  //       barrierDismissible = true,
  //     }) {
  //   if (Get.context == null) {
  //     return null;
  //   }
  //   /*return Get.defaultDialog(
  //     title: title,
  //     middleText: body,
  //     backgroundColor: Colors.white,
  //     titleStyle: textAppBarStyle(),
  //     middleTextStyle: textRegularStyle(),
  //     radius: borderRadius,
  //   );*/
  //   return showDialog(
  //     context: Get.context!,
  //     barrierDismissible: barrierDismissible,
  //     builder: (context) => AlertDialog(
  //       title: Text(
  //         title,
  //         // style: textAppBarStyle(),
  //       ),
  //       content: Text(
  //         body,
  //         // style: textRegularStyle(),
  //       ),
  //       /*insetPadding: EdgeInsets.zero,
  //       titlePadding: EdgeInsets.only(
  //         left: mainPaddingW,
  //         right: mainPaddingW,
  //         top: mainPaddingH,
  //       ),
  //       contentPadding: EdgeInsets.only(
  //         left: mainPaddingW,
  //         right: mainPaddingW,
  //       ),*/
  //       actions: <Widget>[
  //         TextButton(
  //             child: Text(buttonText),
  //             onPressed: () {
  //               Navigator.pop(context);
  //               if (buttonText != "Ok") {
  //                 try {
  //                   retryClick();
  //                   MyHelper().showLoader();
  //                 } catch (e) {
  //                   MyHelper().hideLoader();
  //                 }
  //               }
  //             })
  //       ],
  //     ),
  //   );
  // }

  // showSimpleToast(
  //     String? message, {
  //       String? title,
  //       bool isShort = false,
  //       bool isSuccess = false,
  //       bool isInfo = false,
  //       bool isError = true,
  //     }) {
  //   logger.d('showSimpleToast:  ${title}');
  //   Get.snackbar(
  //     title ??
  //         (isSuccess
  //             ? "Success"
  //             : isInfo
  //             ? "Info"
  //             : "Error"),
  //     message ?? "",
  //     icon: Icon(
  //       (isSuccess
  //           ? Icons.check_circle
  //           : isInfo
  //           ? Icons.info
  //           : Icons.error),
  //       color: MyColors.white,
  //     ),
  //     shouldIconPulse: true,
  //     barBlur: 20,
  //     overlayBlur: 1,
  //     isDismissible: true,
  //     snackPosition: SnackPosition.TOP,
  //     backgroundColor: (isSuccess
  //         ? MyColors.successColor.withOpacity(.8)
  //         : isInfo
  //         ? MyColors.infoColor.withOpacity(.8)
  //         : MyColors.errorColor.withOpacity(.8)),
  //     margin: EdgeInsets.only(
  //       top: mainPaddingH,
  //       left: mainPaddingW,
  //       right: mainPaddingW,
  //     ),
  //     colorText: MyColors.white,
  //     duration: const Duration(seconds: 3),
  //   );
  //   /*showTopSnackBar(
  //       Overlay.of(Get.context ?? context),
  //       isSuccess
  //           ? CustomSnackBar.success(message: msg!)
  //           : isInfo
  //           ? CustomSnackBar.info(message: msg!)
  //           : isError
  //           ? CustomSnackBar.error(message: msg!)
  //           : CustomSnackBar.error(message: msg!),
  //       displayDuration: Duration(seconds: isShort ? 1 : 2));*/
  // }

  // Widget noData({msg = "No data found", color = Colors.redAccent}) {
  //   return Center(
  //     child: Padding(
  //       padding: EdgeInsets.symmetric(
  //         vertical: mainPaddingH,
  //         horizontal: mainPaddingW,
  //       ),
  //       child: Text(
  //         msg,
  //         style: textAppBarStyle(color: color, fontSize: 25),
  //         textAlign: TextAlign.center,
  //       ),
  //     ),
  //   );
  // }
}
