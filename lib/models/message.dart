import 'package:json_annotation/json_annotation.dart';

part 'message.g.dart';

@JsonSerializable()
class Message {
  @JsonKey(name: 'address')
  String address;
  @JsonKey(name: 'text')
  List<String> texts;

  set setAddress(String address) => this.address = address;
  String get getAddress => this.address;

  set setTexts(List<String> texts) => this.texts = texts;
  List<String> get getTexts => this.texts;

  Message({this.address, this.texts});

  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);

  Map<String, dynamic> toJson() => _$MessageToJson(this);
}

@JsonSerializable()
class MessageModel {
  @JsonKey(name: 'message')
  List<Message> listMessage;

  set setMessages(List<Message> messages) => this.listMessage = messages;

  get getMessages => this.listMessage;

  MessageModel({this.listMessage});

  factory MessageModel.fromJson(Map<String, dynamic> json) => _$MessageModelFromJson(json);

  Map<String, dynamic> toJson() => _$MessageModelToJson(this);
}