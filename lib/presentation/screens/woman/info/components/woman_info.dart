import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:super_woman/presentation/screens/woman/chat_bot/chat_bot_screen.dart';
import '../../../content/fetus_changes/fetus_changes_month.dart';
import '../../../../../config/constants.dart';
import '../../../../../config/validators.dart';
import '../../../../../util/pregnency_helper.dart';

class WomanInfo extends StatelessWidget {
  const WomanInfo({super.key, required this.pregnancyStartDate});
  final DateTime pregnancyStartDate;

  @override
  Widget build(BuildContext context) {
    final int monthIndex =
        PregnencyHelper.calculatePregnancyMonthIndex(pregnancyStartDate);
    final dueDate = PregnencyHelper.calculateDueDate(pregnancyStartDate);
    final String month = getMonth(monthIndex);
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(defaultPadding),
          decoration: BoxDecoration(
              color: kPrimaryColor, borderRadius: BorderRadius.circular(20)),
          child: Text(
            "You are in the $month Month now ",
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          padding: const EdgeInsets.all(defaultPadding),
          decoration: BoxDecoration(
              color: kPrimaryColor, borderRadius: BorderRadius.circular(20)),
          child: Text(
            "Expected Date of Birth: ${DateFormat.yMd().format(dueDate)}",
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        const SizedBox(
          height: defaultPadding,
        ),
        TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FetusMonth(monthIndex: monthIndex),
                  ));
            },
            child: const Text(
              'Press Here',
              style: headLines2TextStyle,
            )),
        Text(
          'For more info about the $month month',
          style: headLines1TextStyle,
        ),
        const SizedBox(
          height: 90,
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
