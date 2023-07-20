import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_chat_app/constants/my_colors.dart';
import 'package:flutter_chat_app/screen/login_screen.dart';
import 'package:flutter_chat_app/screen/register_screen.dart';
import 'package:flutter_chat_app/screen/splash_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'constants/my_constant.dart';
import 'controller/auth_controller.dart';
import 'firebase_options.dart';

void main() async{
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: MyColors.transparent,
    statusBarIconBrightness: Brightness.light,
    statusBarBrightness: Brightness.dark,
  ));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) => Get.put(AuthController()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      // designSize: const Size(360, 690),
      useInheritedMediaQuery: true,
      builder: (context, child) {
        return GetMaterialApp(
          initialRoute: '/splash',
          defaultTransition: transition,
          transitionDuration: const Duration(milliseconds: 500),
          getPages: [
            GetPage(
              name: '/splash',
              page: () => SplashScreen(),
            ),
            GetPage(
              name: '/login',
              page: () => LoginScreen(),
            ),
            GetPage(
              name: '/register',
              page: () => RegisterScreen(),
            ),
          ],
          title: "Chat App",
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: MyColors.colorPrimarySwatch,
          ),
        );
      },
    );
  }
}
