import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:frontend/src/controllers/messages_controller.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:get/get.dart';

class Messages extends StatefulWidget {
  const Messages({Key? key}) : super(key: key);
  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  final MessagesController _messagesController = Get.put(MessagesController());
  final _user = const types.User(id: '1', firstName: 'John', lastName: 'Doe');
  final _user2 = const types.User(id: '2', firstName: 'Regina', lastName: 'Jones');
  late  List<types.Message> _messages = [
      types.TextMessage(author: _user, id: '13', text: '_user'),
      types.TextMessage(author: _user2, id: '124124', text: '_user2'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: messagesBody(),
    );
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
    return Chat(
        onSendPressed: _handleSendPressed,
        messages: _messages,
        user: _user,
        theme: const DefaultChatTheme(
          inputBorderRadius: BorderRadius.all(Radius.circular(30)),
          inputBackgroundColor: Colors.grey,
          inputTextColor: Colors.white,
          primaryColor: Colors.green,
          secondaryColor: Colors.grey,
          backgroundColor: Colors.white,
          sendButtonIcon: Icon(
            Icons.arrow_circle_up_sharp,
            color: Colors.white,
          ),
          inputMargin: EdgeInsets.all(10),
          inputTextStyle: TextStyle(color: Colors.black),
        ));
  }

  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }

  String randomString() {
    final random = Random.secure();
    final values = List<int>.generate(16, (i) => random.nextInt(255));
    return base64UrlEncode(values);
  }

  void _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: randomString(),
      text: message.text,
    );

    _addMessage(textMessage);
  }

  void filterMessages() {}

}
