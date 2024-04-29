import 'package:flutter/material.dart';

import '../../../../../config/constants.dart';

class DoctorNoMessages extends StatelessWidget {
  const DoctorNoMessages({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          "No Messages Yet ..",
          style: headLines1TextStyle,
        ),
        SizedBox(
          height: 50,
        ),
      ],
    );
  }
}
