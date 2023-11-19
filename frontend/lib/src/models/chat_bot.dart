// To parse this JSON data, do
//
//     final chatBot = chatBotFromJson(jsonString);

import 'dart:convert';

ChatBot chatBotFromJson(String str) => ChatBot.fromJson(json.decode(str));

String chatBotToJson(ChatBot data) => json.encode(data.toJson());

class ChatBot {
    final String id;

    ChatBot({
        required this.id,
    });

    factory ChatBot.fromJson(Map<String, dynamic> json) => ChatBot(
        id: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
    };
}
