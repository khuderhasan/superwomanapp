import 'package:flutter/material.dart';

import 'components/chat/messages_list.dart';
import 'components/chat/new_message.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({
    super.key,
    required this.recieverName,
    required this.reciverId,
  });
  final String recieverName;
  final String reciverId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recieverName),
      ),
      body: Column(
        children: [
          Expanded(
            child: MessagesList(otherUserid: reciverId),
          ),
          NewMessage(
            recieverId: reciverId,
          )
        ],
      ),
    );
  }
}
