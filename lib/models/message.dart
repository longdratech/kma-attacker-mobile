import 'package:sms/sms.dart';

class MessageModel {
  String address;
  List<String> content;

  MessageModel({this.address, this.content});

  MessageModel.fromJson(Map<String, dynamic> json)
      : address = json['address'],
        content = json['text'];

  Map<String, dynamic> toJson() => {
        'address': address,
        'text': content,
      };
}

class Mess {
  List<MessageModel> listMessage;

  Mess({this.listMessage});
}
