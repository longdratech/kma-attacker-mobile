import 'package:attacker_kma_app/blocs/messages/message_event.dart';
import 'package:attacker_kma_app/blocs/messages/message_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  @override
  MessageState get initialState => InitialMessage();

  @override
  Stream<MessageState> mapEventToState(MessageEvent event) async* {
    if(event is SendMessage) {
      try {
        LoadedMessage()
      } catch (_) {
        print('Loi message');
      }
    }
  }

}