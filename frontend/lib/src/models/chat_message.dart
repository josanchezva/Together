// To parse this JSON data, do
//
//     final chatMessage = chatMessageFromJson(jsonString);

import 'dart:convert';

import 'package:flutter_chat_types/flutter_chat_types.dart';

ChatMessage chatMessageFromJson(String str) => ChatMessage.fromJson(json.decode(str));

String chatMessageToJson(ChatMessage data) => json.encode(data.toJson());

class ChatMessage {
    final String id;
    final String text;
    final User author;

    ChatMessage({
        required this.id,
        required this.text,
        required this.author,
    });

    factory ChatMessage.fromJson(Map<String, dynamic> json) => ChatMessage(
        id: json["_id"],
        text: json["text"],
        author: json["author"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "text": text,
        "author": author,
    };
}
