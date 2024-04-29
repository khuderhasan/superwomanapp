import 'package:flutter/material.dart';

import '../../../../data/datasourse/chat_bot_api.dart';
import 'components/bot_bubble.dart';

class ChatBotScreen extends StatefulWidget {
  const ChatBotScreen({super.key});
  static const routeName = "/bot_screen";
  @override
  State<ChatBotScreen> createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();
  final List<String> _data = [];
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Bot '),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 10,
              child: AnimatedList(
                key: _listKey,
                reverse: false,
                initialItemCount: _data.length,
                controller: _scrollController,
                itemBuilder: (context, index, animation) {
                  return botBubble(
                      item: _data[index], animation: animation, index: index);
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    minLines: 1,
                    maxLines: 2,
                    textInputAction: TextInputAction.done,
                    onSubmitted: (value) async {
                      await getResponse();
                    },
                    decoration: InputDecoration(
                      hintText: "Type Here ...",
                      prefixIcon: const Icon(
                        Icons.play_arrow,
                        color: Colors.green,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }

  Future<void> getResponse() async {
    if (_messageController.text.isNotEmpty) {
      insertSingleItem(_messageController.text, false);
      String response = await ChatApi().chat(message: _messageController.text);
      _messageController.clear();

      await insertSingleItem(response, true);
    }
  }

  Future<void> insertSingleItem(String message, bool response) async {
    _data.add(message);
    _listKey.currentState!.insertItem(_data.length - 1);
    if (response) {
      await _scrollController.animateTo(
        _scrollController.position.maxScrollExtent + 100,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOut,
      );
    }
  }
}
