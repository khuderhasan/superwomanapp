import 'package:flutter/material.dart';
import 'package:super_woman/presentation/screens/woman/chat_bot/chat_bot_screen.dart';

import '../../../../config/constants.dart';
import '../../components/app_logo_image.dart';
import '../../content/content_home_sceen.dart';
import '../menstrual_cycle_info/menstrual_cycle_screen.dart';
import 'woman_doctors_screen.dart';

class WomanHomeScreen extends StatelessWidget {
  const WomanHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AppLogoImage(headline: 'Choose Task'),
            Row(
              children: [
                const Spacer(),
                Expanded(
                  flex: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: defaultPadding),
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(MenstrualCylceScreen.routeName);
                            },
                            child: const Text("Follow Menstrual Cycle")),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(ConetentHomeScreen.routeName);
                        },
                        child: const Text("Follow Pregnancy Period"),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: defaultPadding),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const WomanDoctorsScreen(),
                                ));
                          },
                          child: const Text("Search For Doctor"),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
              ],
            ),
            const SizedBox(
              height: 100,
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
        ),
      ),
    );
  }
}
