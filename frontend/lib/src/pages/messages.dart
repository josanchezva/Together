import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:frontend/src/controllers/messages_controller.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:frontend/utils.dart';
import 'package:get/get.dart';

class Messages extends StatefulWidget {
  const Messages({Key? key}) : super(key: key);
  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  final MessagesController messagesController = Get.put(MessagesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: appBar(), body: messagesBody());
  }

  AppBar appBar() {
    return AppBar(
      toolbarHeight: 100,
      elevation: 1,
      centerTitle: true,
      title: const Text('Messages',
          style: TextStyle(color: Colors.black, fontSize: 46)),
      actions: [
        filterMessagesButton(),
      ],
    );
  }

  TextButton filterMessagesButton() {
    return TextButton(
      onPressed: () {
        filterMessages();
      },
      child: const Text('Filter'),
    );
  }

Widget messagesBody() {
  return Obx(() {
    if (!messagesController.isControllerReady.value) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return Chat(
        onSendPressed: _handleSendPressed,
        messages: messagesController.messages,
        user: messagesController.user,
        theme: const DefaultChatTheme(
          inputBorderRadius: BorderRadius.all(Radius.circular(30)),
          inputBackgroundColor: Colors.grey,
          inputTextColor: Colors.white,
          primaryColor: Colors.green,
          secondaryColor: Colors.grey,
        ),
      );
    }
  });
}

  void _addMessage(types.Message message,text) async{
    messagesController.messages.insert(0, message);
    saveMessagesInSharedPreferences(messagesController.messages);
    await messagesController.sendPrompt(text);
    setState(() {
      
    });
  }

  String randomString() {
    final random = Random.secure();
    final values = List<int>.generate(16, (i) => random.nextInt(255));
    return base64UrlEncode(values);
  }

  void _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: messagesController.user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: randomString(),
      text: message.text,
    );

    _addMessage(textMessage,message.text);
  }

  void filterMessages() {}
}
