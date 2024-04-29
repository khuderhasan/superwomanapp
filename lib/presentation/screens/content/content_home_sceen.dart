import 'package:flutter/material.dart';
import 'fetus_changes/fetus_changes_home.dart';
import '../../../config/constants.dart';
import '../components/app_logo_image.dart';
import 'health_system_screen.dart';
import 'instructions_screen.dart';

class ConetentHomeScreen extends StatelessWidget {
  const ConetentHomeScreen({super.key});
  static const routeName = "/content_home_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const AppLogoImage(headline: "Follow Pregnancy Period"),
              Row(
                children: [
                  const Spacer(),
                  Expanded(
                    flex: 8,
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
                                    .pushNamed(InstructionsScreen.routeName);
                              },
                              child: const Text("Pregnancy Instructions")),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(FetusChangesHome.routeName);
                          },
                          child: const Text("Mother and Fetus Changes"),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: defaultPadding),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(HealthSystemScreen.routeName);
                            },
                            child: const Text("Health System"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
