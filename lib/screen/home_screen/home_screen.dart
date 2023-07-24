import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/constants/my_colors.dart';
import 'package:flutter_chat_app/constants/my_constant.dart';
import 'package:flutter_chat_app/constants/my_style.dart';
import 'package:flutter_chat_app/controller/auth_controller.dart';
import 'package:flutter_chat_app/screen/home_screen/home_controller.dart';
import 'package:flutter_chat_app/routes/app_pages.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  String? email;

  HomeScreen({super.key, this.email});

  final homeController = Get.put(HomeController());
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    logger.i("${homeController.userDataList.length}");
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: MyColors.primary,
              ), //BoxDecoration
              child: UserAccountsDrawerHeader(
                accountName: const Text(
                  "Tridip Bhowmik",
                  style: TextStyle(fontSize: 18),
                ),
                accountEmail: Text(email!),
                currentAccountPictureSize: const Size.square(50),
                currentAccountPicture: const CircleAvatar(
                  backgroundColor: MyColors.red,
                  child: Text(
                    "T",
                    style: TextStyle(fontSize: 30.0, color: MyColors.white),
                  ), //Text
                ), //circleAvatar
              ), //UserAccountDrawerHeader
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Get.back();
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout_rounded),
              title: const Text('Logout'),
              onTap: () {
                AuthController.instance.signOut();
                Get.offAllNamed(Routes.LOGIN);
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: mainPaddingAll,
        child: Obx(() {
          return Column(
            children: [
              homeController.isLoading.value
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return ListTile(
                          title:
                              Text(homeController.userDataList[index].fullName),
                          subtitle: const Text("You: Hi"),
                          subtitleTextStyle: textRegularStyle(),
                          leading: const CircleAvatar(
                            backgroundColor: MyColors.primary,
                            child: Icon(
                              Icons.person,
                              color: MyColors.white,
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Divider(
                          color: MyColors.primary,
                          height: 5,
                        );
                      },
                      itemCount: homeController.userDataList.length,
                    ),
            ],
          );
        }),
      ),
    );
  }
}
