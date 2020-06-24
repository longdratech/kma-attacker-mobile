import 'package:equatable/equatable.dart';

abstract class MessageState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitialMessage extends MessageState {}

class LoadedMessage extends MessageState {
  final String address;
  final List<String> text;

  LoadedMessage({this.address, this.text});
}

class ErrorMessage extends MessageState {}