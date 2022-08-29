import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:wechat/models.dart/user.dart';
import 'package:wechat/utils/shared_preferences.dart';

import '../screen/chat_screen.dart';

class HomeController extends GetxController {
  var userRef = FirebaseDatabase.instance.ref('Users');
  var chatRef = FirebaseDatabase.instance.ref('Chats');
  var userList = [].obs;
  var messageList = [].obs;
  var chatUser = ''.obs;
  var chatUserId = ''.obs;
  var currentUserId = ''.obs;
  // var currentUser
  var messageController = TextEditingController(text: '').obs;

  HomeController() {
    userRef.keepSynced(true);
    chatRef.keepSynced(true);
    fetchChatUsers();
  }
  Future fetchChatUsers() async {
    DatabaseEvent result = await userRef.once();

    if (result.snapshot.value != null) {
      var dbList = result.snapshot.value as Map;

      userList.value = dbList.entries.map((value) {
        return ChatUser.fromJson(value.value);
      }).toList();
      userList.refresh();
      print(userList);
    }
  }

  Future fetchChatMessages() async {
    messageList.value = [];
    var currentUserChatRef =
        chatRef.child(currentUserId.value).child(chatUserId.value);
    currentUserChatRef.onValue.listen((event) {
      var dbList = event.snapshot.value as Map;

      messageList.value = dbList.entries.map((value) {
        return ChatUser.fromMessageJson(value.value);
      }).toList();
      messageList.refresh();

      print('+++++++++++++++++++++++++++++++++++==');
      print(messageList);
    });
    print(await SharedPref.getString('email') +
        '+++++++++++++++++++++++++++++++++++==');
  }

  @override
  void onInit() async {
    super.onInit();
  }

  sentMessage() {
    var currentUserChatRef =
        chatRef.child(currentUserId.value).child(chatUserId.value);
    var chatUserChatRef =
        chatRef.child(chatUserId.value).child(currentUserId.value);

    var messageMap = ChatUser.toChatMap(
        sender: currentUserId.value,
        receiver: chatUserId.value,
        message: messageController.value.text);

    currentUserChatRef.push().set(messageMap);
    chatUserChatRef.push().set(messageMap);

    messageController.value.text = '';
  }

  openChatScreen(HomeController controller, int index) async {
    currentUserId.value = await SharedPref.getString('userId');
    controller.chatUser.value = controller.userList.value[index].name;
    controller.chatUserId.value = controller.userList.value[index].id;
    await fetchChatMessages();
    Get.to(ChatScreen(controller));
  }

// DatabaseEvent event = await userRef.once();
  // //  var user = dbUser.snapshot.key.toString();
  // var user = event.snapshot.key.toString();

}
