import 'package:flutter/material.dart';

import '../../../../config/constants.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({
    super.key,
    required this.message,
    required this.isMe,
    required this.userName,
  });

  final String message;
  final String userName;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Row(
          mainAxisAlignment:
              isMe ? MainAxisAlignment.start : MainAxisAlignment.end,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: isMe ? kPrimaryColor : Colors.grey[300],
                borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(12),
                    topRight: const Radius.circular(12),
                    bottomLeft: !isMe
                        ? const Radius.circular(12)
                        : const Radius.circular(0),
                    bottomRight: isMe
                        ? const Radius.circular(12)
                        : const Radius.circular(0)),
              ),
              width: 140,
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 16,
              ),
              margin: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 8,
              ),
              child: Column(
                crossAxisAlignment:
                    isMe ? CrossAxisAlignment.start : CrossAxisAlignment.end,
                children: [
                  Text(
                    userName,
                    style: TextStyle(
                        color: isMe
                            ? Theme.of(context).textTheme.titleSmall!.color
                            : Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    message,
                    style: TextStyle(
                      color: isMe
                          ? Theme.of(context).textTheme.titleSmall!.color
                          : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
