import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wechat/controller/home_controller.dart';
import 'package:wechat/data/data.dart';
import 'package:wechat/widgets.dart/profile_avatar.dart';
import 'package:wechat/widgets.dart/widgets.dart';

class ContactList extends StatelessWidget {
  final HomeController controller;
  const ContactList(this.controller, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      height: MediaQuery.of(context).size.height,
      child: Obx(() {
        print(controller.userList.value.length);
        return ListView.builder(
            itemCount: controller.userList.value.length,
            itemBuilder: (BuildContext context, int index) {
              int i = index <= onlineUsers.length ? index : 1;

              return Container(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ProfileAvatar(imageUrl: onlineUsers[i].imageUrl),
                    const SizedBox(width: 10.0),
                    Flexible(
                      child: InkWell(
                        onTap: () async =>
                            await controller.openChatScreen(controller, index),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.userList.value[index].name,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 15.0,
                              ),
                            ),
                            Text(controller.userList.value[index].email),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                margin: const EdgeInsets.only(bottom: 1.0),
                padding: const EdgeInsets.fromLTRB(0, 10.0, 0.0, 10.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
              );
            });
      }),
    );
  }
}
