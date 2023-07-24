import 'package:flutter_chat_app/screen/chat_screen/chat_screen_binding.dart';
import 'package:flutter_chat_app/screen/home_screen/home_screen.dart';
import 'package:flutter_chat_app/screen/home_screen/home_screen_binding.dart';
import 'package:flutter_chat_app/screen/login_screen/login_screen.dart';
import 'package:flutter_chat_app/screen/registration_screen/register_screen.dart';
import 'package:flutter_chat_app/screen/splash_screen/splash_screen.dart';
import 'package:get/get.dart';
import '../screen/chat_screen/chat_screen.dart';
import '../screen/login_screen/login_binding.dart';
import '../screen/registration_screen/registration_binding.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeScreen(),
      binding: HomeScreenBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: _Paths.REGISTRATION,
      page: () => RegisterScreen(),
      binding: RegistrationBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.CHAT,
      page: () => const ChatScreen(),
      binding: ChatScreenBinding(),
    ),
  ];
}
