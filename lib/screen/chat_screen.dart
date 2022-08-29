import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wechat/controller/home_controller.dart';

import '../widgets.dart/widgets.dart';

class ChatScreen extends GetView<HomeController> {
  @override
  final HomeController controller;

  const ChatScreen(this.controller, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.red[900],
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        title: Center(
          child: Text(controller.chatUser.value),
        ),
        elevation: 0.0,
        actions: [
          // IconButtons(
          //   icon: Icons.call,
          //   iconSize: 25.0,
          //   onPressed: () => print('Search'),
          // ),
          // IconButtons(
          //   icon: Icons.video_call,
          //   iconSize: 25.0,
          //   onPressed: () => print('Search'),
          // ),
          IconButtons(
            icon: Icons.more_horiz,
            iconSize: 25.0,
            onPressed: () {
              print('Search');
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Login()),
              );
            },
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          color: Colors.white,
          // borderRadius: BorderRadius.only(
          //   topRight: Radius.circular(30),
          //   topLeft: Radius.circular(30),
          // ),
        ),
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 56),
              child: Obx(() {
                return ListView.builder(
                    itemCount: controller.messageList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return controller.currentUserId ==
                              controller.messageList.value[index].receiver
                          ? SizedBox(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        color: Color(0xFFFFCDD2),
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(15),
                                          bottomRight: Radius.circular(15),
                                          topLeft: Radius.circular(30),
                                        ),
                                      ),
                                      margin: const EdgeInsets.fromLTRB(
                                          10.0, 10.0, 0.0, 0.0),
                                      padding: const EdgeInsets.all(15.0),
                                      child: Stack(
                                        children: [
                                          Text(
                                            controller.messageList.value[index]
                                                .message,
                                          ),
                                          const SizedBox(
                                            height: 50.0,
                                          ),
                                          Positioned(
                                            bottom: 0.0,
                                            right: 0.0,
                                            child: Text(
                                              controller.messageList
                                                  .value[index].time,
                                              style: const TextStyle(
                                                color: Color(0xFF78909C),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : SizedBox(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    child: Container(
                                      // constraints: BoxConstraints(
                                      //    maxHeight: double.infinity,
                                      //  maxWidth: screenWidth / 1.4,
                                      // ),
                                      decoration: const BoxDecoration(
                                        color: Color(0xFFF48FB1),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(15),
                                          bottomLeft: Radius.circular(15),
                                          topRight: Radius.circular(30),
                                        ),
                                      ),
                                      margin: const EdgeInsets.fromLTRB(
                                          0.0, 10.0, 0.0, 10.0),
                                      padding: const EdgeInsets.all(15.0),
                                      child: Stack(
                                        children: [
                                          Text(
                                            controller.messageList.value[index]
                                                .message,
                                          ),
                                          const SizedBox(
                                            height: 50.0,
                                          ),
                                          Positioned(
                                            bottom: 0.0,
                                            right: 0.0,
                                            child: Text(
                                              controller.messageList
                                                  .value[index].time,
                                              style: const TextStyle(
                                                color: Color(0xFF78909C),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                    });
              }),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                color: Colors.greenAccent,
                child: Container(
                  height: 48,
                  width: MediaQuery.of(context).size.width - 16,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFFCDD2),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                        topLeft: Radius.circular(30),
                        bottomLeft: Radius.circular(30)),
                  ),
                  child: Row(
                    children: [
                      IconButtons(
                        icon: Icons.photo,
                        iconSize: 25.0,
                        color: Colors.red[900],
                        onPressed: () {},
                      ),
                      Expanded(
                        child: TextField(
                          // onEditingComplete: () => controller.sentMessage(),
                          controller: controller.messageController.value,
                          textCapitalization: TextCapitalization.sentences,
                          decoration: const InputDecoration.collapsed(
                            hoverColor: Color(0xFFB71C1C),
                            hintText: 'Send a message...',
                            hintStyle: TextStyle(
                              color: Color(0xFFF48FB1),
                            ),
                          ),
                        ),
                      ),
                      IconButtons(
                        icon: Icons.send,
                        iconSize: 25.0,
                        color: Colors.red[900],
                        onPressed: () => controller.sentMessage(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
