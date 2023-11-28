import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class MessagesController extends GetxController {
  List<types.Message> _messages = [];
  final _user = const types.User(id: '1', firstName: 'John', lastName: 'Doe');
  final _user2 =
      const types.User(id: '2', firstName: 'Regina', lastName: 'Jones');
  @override
  void onInit() {
    //TODO: getUserMessages();
    _messages = [
      types.TextMessage(author: _user, id: '13', text: '_user'),
      types.TextMessage(author: _user2, id: '124124', text: '_user2'),
    ];
    super.onInit();
  }
  get messages => _messages;
  get user => _user;

}
