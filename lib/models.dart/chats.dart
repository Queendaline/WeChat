class User {
  String? sender;
  String? receiver;
  String? message;
  String? type;
  String? time;
  bool? seen;
  bool? delivered;

  User(
      {this.sender,
      this.receiver,
      this.message,
      this.type,
      this.time,
      this.seen,
      this.delivered});

  User.fromJson(Map<String, dynamic> json) {
    sender = json['sender'];
    receiver = json['receiver'];
    message = json['message'];
    type = json['type'];
    time = json['time'];
    seen = json['seen'];
    delivered = json['delivered'];
  }

  Map<String, dynamic> toJson() {
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
