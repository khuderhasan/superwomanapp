import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';

Widget botBubble(
    {required String item,
    required Animation<double> animation,
    required int index}) {
  bool mine = !item.endsWith('<bot>');
  return SizeTransition(
    sizeFactor: animation,
    key: UniqueKey(),
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: Stack(
              children: [
                Align(
                  alignment:
                      mine ? Alignment.bottomLeft : Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 48),
                    child: Bubble(
                      radius: const Radius.circular(30),
                      color: Colors.white,
                      nip: mine ? BubbleNip.leftTop : BubbleNip.rightTop,
                      nipHeight: 15,
                      nipOffset: 20,
                      nipWidth: 10,
                      padding: const BubbleEdges.all(16),
                      child: Text(
                        item.replaceAll('<bot>', ''),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 15),
                      ),
                    ),
                  ),
                ),
                !mine
                    ? Align(
                        alignment: Alignment.topRight,
                        child: Image.asset(
                          'assets/icons/bot_icon.png',
                          scale: 1.5,
                        ),
                      )
                    : Container(),
                mine
                    ? Align(
                        alignment: Alignment.topLeft,
                        child: Image.asset(
                          'assets/icons/me_icon.png',
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
