import 'package:attacker_kma_app/common_widgets/content_message.dart';
import 'package:attacker_kma_app/common_widgets/story.dart';
import 'package:flutter/material.dart';
import 'package:sms/sms.dart';

import '../../common_widgets/content_message.dart';

class MessageScreen extends StatelessWidget {
  List<SmsMessage> messages;

  List<String> profilePics = [
    "https://bit.ly/3d3hq8j",
    "https://bit.ly/3d3hq8j",
    "https://bit.ly/3d3hq8j",
    "https://bit.ly/3d3hq8j",
    "https://bit.ly/3d3hq8j",
    "https://bit.ly/3d3hq8j",
    "https://bit.ly/3d3hq8j",
    "https://bit.ly/3d3hq8j",
    "https://bit.ly/3d3hq8j",
    "https://bit.ly/3d3hq8j",
  ];

  getSMS() async {
    SmsQuery query = new SmsQuery();
    messages = await query.getAllSms;
    return messages;
  }

  @override
  Widget build(BuildContext context) {
    // print("Long==== ${messages}");
    return FutureBuilder(
      future: getSMS(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: messages.length,
            itemBuilder: (context, index) {
              return MessageWidget(
                profilePics: "https://bit.ly/3d3hq8j",
                title: messages[index].address,
                content: messages[index].body,
              );
            },
          );
        }
      },
    );
  }
}
