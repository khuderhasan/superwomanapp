import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:super_woman/presentation/providers/user_type_provider.dart';

import '../../../../data/datasourse/chat_datasource.dart';
import 'message_bubble.dart';

class MessagesList extends StatelessWidget {
  const MessagesList({super.key, required this.otherUserid});
  final String otherUserid;
  @override
  Widget build(BuildContext context) {
    final userId = Provider.of<UserType>(context, listen: false).userId;
    return StreamBuilder(
      stream: ChatDataSource()
          .getMessages(otherUserid: otherUserid, currentUserId: userId),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        final chatDocuments = snapshot.data!.docs;

        return ListView.builder(
          reverse: true,
          itemCount: chatDocuments.length,
          itemBuilder: (ctx, index) {
            return MessageBubble(
              message: chatDocuments[index]["message"],
              isMe: chatDocuments[index]["senderId"] == userId,
              userName: chatDocuments[index]["senderName"],
            );
          },
        );
      },
    );
  }
}
