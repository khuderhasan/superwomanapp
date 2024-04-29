import 'package:flutter/material.dart';

import '../../../../config/constants.dart';
import '../../components/app_logo_image.dart';
import '../../content/content_home_sceen.dart';
import '../all_users/all_users_screen.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AppLogoImage(headline: "Welocme Admin"),
            const Padding(
              padding: EdgeInsets.all(defaultPadding),
              child: Text(
                'Choose Task',
                style: headLines1TextStyle,
              ),
            ),
            Row(
              children: [
                const Spacer(),
                Expanded(
                  flex: 10,
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
                                  .pushNamed(AllUsersScreen.routeName);
                            },
                            child: const Text("Show All Users")),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(ConetentHomeScreen.routeName);
                        },
                        child: const Text("Manage Content"),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
              ],
            ),
            const SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}
