import 'package:flutter/material.dart';

import '../../../../../config/constants.dart';

class AppLogoImage extends StatelessWidget {
  const AppLogoImage({super.key, required this.headline});
  final String? headline;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: defaultPadding * 3),
        Row(
          children: [
            const Spacer(),
            Image.asset("assets/images/app_logo_1.png"),
            const Spacer(),
          ],
        ),
        Text(headline!,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 23,
                color: headLines1Color)),
        const SizedBox(height: defaultPadding * 2),
      ],
    );
  }
}
