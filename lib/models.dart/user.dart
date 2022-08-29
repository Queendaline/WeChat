import 'package:firebase_database/firebase_database.dart';

class ChatUser {
  String? id;
  String? name;
  String? email;
  bool? online;
  String? dateJoined;
  String? message;
  String? sender;
  String? receiver;
  String? time;

  ChatUser({this.id, this.name, this.email, this.online, this.dateJoined});

  ChatUser.fromJson(json) {
    if (json != null) {
      id = json['id'];
      name = json['name'];
      email = json['email'];
      online = json['online'];
      // dateJoined = json['date_joined'];
    }
  }

  ChatUser.fromMessageJson(json) {
    if (json != null) {
      message = json['message'];
      sender = json['sender'];
      receiver = json['receiver'];
      time = json['time'].toString();
      // dateJoined = json['date_joined'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['online'] = online;
    data['date_joined'] =
        dateJoined == null ? ServerValue.timestamp : dateJoined;
    return data;
  }

  static Map<String, dynamic> toChatMap(
      {required sender,
      required receiver,
      required message,
      type = 'text',
      time = ServerValue.timestamp,
      seen = false,
      delivered = false}) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sender'] = sender;
    data['receiver'] = receiver;
    data['message'] = message;
    data['type'] = type;
    data['time'] = time;
    data['seen'] = seen;
    data['delivered'] = delivered;
    return data;
  }
}
