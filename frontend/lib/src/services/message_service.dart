import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:frontend/utils.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:frontend/src/models/chat_bot.dart';

import '../models/user.dart';

var headers = {'Content-Type': 'application/json'};

class MessageService {
  MessageService();

  getUserMessages(User globalUser, ChatBot chatBot) async {
    types.User bot = types.User(id: chatBot.id);

    var load = await loadMessagesFromSharedPreferences();
    randomNumber() {
      return DateTime.now().millisecondsSinceEpoch.toString();
    }

    if (load.isEmpty) {
      return [
        types.TextMessage(
            author: bot,
            id: randomNumber(),
            text: 'Hi ${globalUser.firstName}! I am your personal assistant. How can I help you?')
      ];
    }else{
      return loadMessagesFromSharedPreferences();
    }}

    Future<String> createMessage(String message) async {
      final url =
          Uri.parse('${dotenv.env['BACKEND_URL']}/gpt/chat?prompt=$message');
      var res = await http.get(url, headers: headers);
      if (res.statusCode == 200) {
        return res.body;
      } else {
        return 'Error';
      }
    }

    deleteMessage() {}
    updateMessage() {}
  }

