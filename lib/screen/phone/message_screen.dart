import 'package:attacker_kma_app/common_widgets/content_message.dart';
import 'package:flutter/material.dart';
import 'package:sms/sms.dart';

import '../../common_widgets/content_message.dart';

class MessageScreen extends StatelessWidget {
  List<SmsThread> threads;

  SmsQuery query = SmsQuery();

  getContactSMS() async => threads = await query.getAllThreads;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getContactSMS(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: threads.length,
            itemBuilder: (context, index) {
              return MessageWidget(
                profilePics: "https://bit.ly/3d3hq8j",
                title: threads[index].contact.address,
                content: threads[index].messages.length.toString(),
              );
            },
          );
        }
      },
    );
  }
}
