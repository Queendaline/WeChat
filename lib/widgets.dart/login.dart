import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wechat/controller/user_controller.dart';
import 'package:wechat/widgets.dart/widgets.dart';

class Login extends GetView<UserController> {
  UserController controller = UserController();

  Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[900],
      appBar: AppBar(
        title: const Text('Sign In'),
        backgroundColor: Colors.red[900],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
        ),
        child: Column(
          children: [
            Container(
              height: 46,
              margin: const EdgeInsets.fromLTRB(15.0, 120.0, 15.0, 0.0),
              padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
              decoration: BoxDecoration(
                color: Color(0xFFFFCDD2),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  IconButtons(
                    icon: Icons.mail,
                    iconSize: 22.0,
                    color: Colors.red[900],
                    onPressed: () {},
                  ),
                  Expanded(
                    child: TextField(
                      controller: controller.emailController.value,
                      textCapitalization: TextCapitalization.sentences,
                      decoration: const InputDecoration.collapsed(
                        hoverColor: Color(0xFFB71C1C),
                        hintText: 'Email Address...',
                        hintStyle: TextStyle(
                          color: Color(0xFFB71C1C),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 46,
              margin: const EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 15.0),
              padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
              decoration: const BoxDecoration(
                color: Color(0xFFFFCDD2),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Row(
                children: [
                  IconButtons(
                    icon: Icons.lock,
                    iconSize: 22.0,
                    color: Colors.red[900],
                    onPressed: () {},
                  ),
                  Expanded(
                    child: TextField(
                      controller: controller.passwordController.value,
                      textCapitalization: TextCapitalization.sentences,
                      decoration: const InputDecoration.collapsed(
                        hoverColor: Color(0xFFB71C1C),
                        hintText: 'Password...',
                        hintStyle: TextStyle(
                          color: Color(0xFFB71C1C),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                controller.login();
              },
              child: const Text('Sign In'),
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    // side: BorderSide(color: Colors.black),
                  ),
                ),
                padding: MaterialStateProperty.all(
                  const EdgeInsets.fromLTRB(140, 0, 140, 0),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(
                  const Color(0xFFB71C1C),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 20.0),
              child: Text(
                "Don't have an account, Click below",
                style: TextStyle(
                  color: Colors.red[900],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Register(),
                  ),
                );
              },
              child: const Text('Sign Up'),
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    // side: BorderSide(color: Colors.black),
                  ),
                ),
                padding: MaterialStateProperty.all(
                  const EdgeInsets.fromLTRB(140, 0, 140, 0),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(
                  const Color(0xFFB71C1C),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
