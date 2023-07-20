import 'package:flutter/material.dart';
import 'package:flutter_chat_app/constants/my_colors.dart';
import 'package:flutter_chat_app/controller/auth_controller.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  String? email;

  HomeScreen({super.key,this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: MyColors.primary,
              ), //BoxDecoration
              child: UserAccountsDrawerHeader(
                accountName: Text(
                  "Tridip Bhowmik",
                  style: TextStyle(fontSize: 18),
                ),
                accountEmail: Text("tridip@gmail.com"),
                currentAccountPictureSize: Size.square(50),
                currentAccountPicture: CircleAvatar(
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
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout_rounded),
              title: const Text('Logout'),
              onTap: () {
                AuthController.instance.signOut();
                Get.offAllNamed('/login');
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Text("Home Screen")
        ],
      ),
    );
  }
}
