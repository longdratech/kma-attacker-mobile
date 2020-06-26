import 'package:attacker_kma_app/models/message.dart';
import 'package:attacker_kma_app/models/sms_message.dart';
import 'package:flutter/material.dart';
import 'package:sms/sms.dart';

class MessageDetail extends StatelessWidget {
  final String address;
  final List<SmsMessage> content;

  MessageDetail({this.address, this.content});

  @override
  Widget build(BuildContext context) {
    MessageModel messageModel = MessageModel();
    print("long ${messageModel.address}");
    return Scaffold(
      appBar: AppBar(
        title: Text(address),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Text(content[index].body);
        },
      ),
    );
  }
}