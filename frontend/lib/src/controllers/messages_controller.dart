import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:frontend/src/models/chat_bot.dart';
import 'package:frontend/src/models/user.dart';
import 'package:frontend/utils.dart';
import 'package:get/get.dart';

import '../services/message_service.dart';

class MessagesController extends GetxController {
  MessageService messagesService = MessageService();
  final isControllerReady = false.obs;
  List<types.Message> _messages = [];
  late User globalUser;
  late types.User _user;

  @override
  onInit() {
    loadUsers();
    super.onInit();
  }

  loadUsers() async {
    globalUser = await loadUserDataFromSharedPreferences();
    _user = types.User(id: globalUser.userId, firstName: globalUser.firstName);
    ChatBot bot = ChatBot(id: 'botID');
    
    
    _messages = await messagesService.getUserMessages(globalUser, bot);
    //await reloadMessages();
    isControllerReady.value = true;
    update();
  }

  sendPrompt(String prompt) async {
    String response = await messagesService.createMessage(prompt);
    ChatBot chatBot = ChatBot(id: 'botID');
    types.User bot = types.User(id: chatBot.id);
    randomId() {
      return DateTime.now().millisecondsSinceEpoch.toString();
    }
    _messages.insert(
        0, types.TextMessage(author: bot, id: randomId(), text: response));
    saveMessagesInSharedPreferences(_messages);
    update();
  }

  get messages => _messages;
  get user => _user;
}
