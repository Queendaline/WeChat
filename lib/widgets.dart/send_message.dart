import 'package:flutter/material.dart';
import 'package:wechat/widgets.dart/icon_buttons.dart';

class SendMessage extends StatelessWidget {
  const SendMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFFFCDD2),
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(30),
            topLeft: Radius.circular(30),
            bottomLeft: Radius.circular(30)),
      ),
      margin: EdgeInsets.fromLTRB(5.0, 40.0, 5.0, 0.0),
      child: Row(
        children: [
          IconButtons(
            icon: Icons.photo,
            iconSize: 25.0,
            color: Colors.red[900],
            onPressed: () {},
          ),
          const Expanded(
            child: TextField(
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration.collapsed(
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
            onPressed: () => print('Message Sent'),
          ),
        ],
      ),
    );
  }
}
