import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_chat_app/constants/my_colors.dart';
import 'package:flutter_chat_app/screen/login_screen/login_screen.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../constants/my_constant.dart';
import '../constants/my_style.dart';
import '../screen/home_screen/home_screen.dart';

class AuthController extends GetxController {
  //AuthController instance
  static AuthController instance = Get.find();

  //email,password,name
  late Rx<User?> user;

  FirebaseAuth auth = FirebaseAuth.instance;

  //instance of firestore
  final FirebaseFirestore firebaseFirestore=FirebaseFirestore.instance;

  var googleSignIn = GoogleSignIn();
  var googleAcc = Rx<GoogleSignInAccount?>(null);
  RxBool isSignedIn = false.obs;

  @override
  void onReady() {
    super.onReady();
    user = Rx<User?>(auth.currentUser);
    //our user will be notified
    user.bindStream(auth.userChanges());
    ever(user, _initialScreen);
  }

  _initialScreen(User? user) {
    if (user == null) {
      logger.i("Go to login page");
      Get.offAll(() => LoginScreen());
    } else {
      logger.i("Go to home screen");
      Get.offAll(() => HomeScreen(
        email: user.email,
      ));
    }
  }

  void registerUser(String email, String password,String fullName,String phone) async {
    try {
      final UserCredential userCredential= await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      //after creating the user, creating a document for the user in the user collection
      firebaseFirestore.collection('users').doc(userCredential.user?.uid).set(
          {
            'userid':userCredential.user?.uid,
            'email':email,
            'full_name': fullName,
            'phone':phone
          });
    } catch (e) {
      Get.snackbar("About User", "User message",
          backgroundColor: MyColors.red,
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text(
            "Account creation failed",
            style: textRegularStyle(fontSize: 24, color: MyColors.white),
          ),
          messageText: Text(
            e.toString(),
            style: textRegularStyle(fontSize: 24, color: MyColors.white),
          ));
    }
  }

  void signInUser(String email, String password) async {
    try {
      final UserCredential userCredential=await auth.signInWithEmailAndPassword(email: email, password: password);

      //after creating the user, creating a document for the user in the user collection
      // firebaseFirestore.collection('users').doc(userCredential.user?.uid).set(
      //     {
      //       'userid':userCredential.user?.uid,
      //       'email':email,
      //       'full_name': fullName,
      //       'phone':phone
      //     });
      //Get.offAll(() => HomeScreen());
    } catch (e) {
      Get.snackbar("About login", "Login message",
          backgroundColor: MyColors.red,
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text(
            "Wrong information",
            style: textRegularStyle(fontSize: 24, color: MyColors.white),
          ),
          messageText: Text(
            e.toString(),
            style: textRegularStyle(fontSize: 24, color: MyColors.white),
          ));
    }
  }

  signInWithGoogle() async {
    try {
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? gAuth = await gUser?.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: gAuth?.accessToken, idToken: gAuth?.idToken);

      return await auth.signInWithCredential(credential).then((value) {
        Get.offAll(() => HomeScreen());
      });
    } catch (e) {
      Get.snackbar("About Google Sign In", "Google Sign In message",
          backgroundColor: MyColors.red,
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text(
            "Google Sign In Wrong",
            style: textRegularStyle(fontSize: 24, color: MyColors.white),
          ),
          messageText: Text(
            e.toString(),
            style: textRegularStyle(fontSize: 24, color: MyColors.white),
          ));
    }
  }
  // Future<UserCredential> signInWithGoogle() async {
  //   // Trigger the authentication flow
  //   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  //
  //   // Obtain the auth details from the request
  //   final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
  //
  //   // Create a new credential
  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth?.accessToken,
  //     idToken: googleAuth?.idToken,
  //   );
  //
  //   // Once signed in, return the UserCredential
  //   return await FirebaseAuth.instance.signInWithCredential(credential);
  // }

  void signOut() async {
    await auth.signOut();
    await googleSignIn.signOut();
    isSignedIn.value = false;
  }
}
