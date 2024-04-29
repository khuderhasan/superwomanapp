import 'package:flutter/material.dart';
import 'package:super_woman/presentation/screens/woman/chat_bot/chat_bot_screen.dart';

import '../../../../../config/constants.dart';
import '../../home/woman_doctors_screen.dart';

class NoMessages extends StatelessWidget {
  const NoMessages({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "No Messages Yet..",
          style: headLines1TextStyle,
        ),
        const SizedBox(
          height: 50,
        ),
        TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WomanDoctorsScreen(),
                  ));
            },
            child: const Text(
              "Press Here",
              style: headLines2TextStyle,
            )),
        const Text(
          'to Search for a Doctor',
          style: headLines1TextStyle,
        ),
        const SizedBox(
          height: 15,
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(ChatBotScreen.routeName);
                },
                child: Image.asset('assets/icons/bot_icon.png')),
          ),
        )
      ],
    );
  }
}
