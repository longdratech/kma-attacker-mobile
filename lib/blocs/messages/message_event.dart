import 'package:attacker_kma_app/models/message.dart';
import 'package:equatable/equatable.dart';

abstract class MessageEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SendMessage extends MessageEvent {
  final List<Message> messages;

  SendMessage({this.messages});
}