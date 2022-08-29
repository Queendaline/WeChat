import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wechat/screen/home_screen.dart';
import 'package:wechat/utils/shared_preferences.dart';

import '../models.dart/user.dart';

class UserController extends GetxController {
  var fbInstance = FirebaseAuth.instance;
  var userRef = FirebaseDatabase.instance.ref('Users');

  var nameController = TextEditingController(text: '').obs;
  var emailController = TextEditingController(text: '').obs;
  var passwordController = TextEditingController(text: '').obs;

  Future register() async {
    try {
      //Create a variable to hold the values that has been entered in our input fields
      String name = nameController.value.text;
      String email = emailController.value.text;
      String password = passwordController.value.text;

      //Sign in the user with just the email and password
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      //Check if the registration was successful
      if (userCredential.user != null) {
        //Collect the userId for the created user
        String userId = userCredential.user!.uid;

        //Create a chatUser object with the values
        var userObj =
            ChatUser(id: userId, name: name, email: email, online: false);

        //Convert the object to a map
        var userMap = userObj.toJson();

        //Add the user to the realtime database
        userRef.child(userId).set(userMap).whenComplete(() {
          SharedPref.putString('userId', userId);
          SharedPref.putString('name', name);
          SharedPref.putString('email', email);
          Get.to(HomeScreen());
        });
        //
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void onInit() {}

  @override
  void dispose() {}

  Future login() async {
    String email = emailController.value.text;
    String password = passwordController.value.text;

    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);

    if (userCredential.user != null) {
      String userId = userCredential.user!.uid;

      DatabaseEvent dbUser = await userRef.child(userId).once();

      var user = dbUser.snapshot.value;

      var chatUser = ChatUser.fromJson(user);
      if (user != null) {
        SharedPref.putString('userId', userId);
        SharedPref.putString('name', chatUser.name!);
        SharedPref.putString('email', chatUser.email!);
        Get.to(HomeScreen());
      }
    }
  }
}
