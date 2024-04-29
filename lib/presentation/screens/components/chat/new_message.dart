import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/constants.dart';
import '../../../cubits/chat/chat_cubit.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({super.key, required this.recieverId});
  final String recieverId;
  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  String _enteredMessage = '';
  final TextEditingController _messageController = TextEditingController();
  void _sendMessage() async {
    context
        .read<ChatCubit>()
        .sendMessage(recieverId: widget.recieverId, message: _enteredMessage);

    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      child: Row(children: [
        Expanded(
          child: TextFormField(
            controller: _messageController,
            decoration:
                const InputDecoration(label: Text("Send a Message ...")),
            onChanged: (value) {
              setState(() {
                _enteredMessage = value;
              });
            },
          ),
        ),
        IconButton(
          onPressed: _enteredMessage.trim().isEmpty ? null : _sendMessage,
          icon: const Icon(
            Icons.send,
            color: kPrimaryColor,
          ),
        )
      ]),
    );
  }
}
