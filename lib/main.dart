import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wechat/controller/user_controller.dart';
import 'package:wechat/screen/home_screen.dart';
import 'package:wechat/utils/shared_preferences.dart';
import 'package:wechat/widgets.dart/login.dart';

import 'controller/home_controller.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  Get.put(UserController());
  Get.put(HomeController());

  runApp(await checkUserState());
}

Future checkUserState() async {
  FirebaseDatabase.instance.setPersistenceEnabled(true);
  String userId = await SharedPref.getString('userId');
  if (userId == '') {
    return const GoToLogin();
  }
  return const Home();
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'WeChat',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[300],
      ),
      home: HomeScreen(),
    );
  }
}

class GoToLogin extends StatelessWidget {
  const GoToLogin({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'WeChat',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[300],
      ),
      home: Login(),
    );
  }
}
