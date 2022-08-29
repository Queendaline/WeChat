import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wechat/controller/home_controller.dart';

import '../widgets.dart/widgets.dart';

class HomeScreen extends GetView<HomeController> {
  HomeScreen({Key? key}) : super(key: key);

  HomeController controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: Colors.red[900],
            title: const Text(
              'WeChat',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            actions: [
              IconButtons(
                icon: Icons.search,
                iconSize: 25.0,
                onPressed: () => null,
              ),
              IconButtons(
                icon: Icons.more_horiz,
                iconSize: 25.0,
                onPressed: () => print('More'),
              ),
            ],
            bottom: AppBar(
              backgroundColor: Colors.red[900],
              actions: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text(
                        'Chats',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Status',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Calls',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(child: ContactList(controller)),
        ],
      ),
    );
  }
}
