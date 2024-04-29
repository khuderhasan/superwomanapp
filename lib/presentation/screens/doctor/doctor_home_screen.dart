import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../providers/navigation_provider.dart';

import '../../../config/constants.dart';
import '../components/app_logo_image.dart';

class DoctorHomeScreen extends StatelessWidget {
  const DoctorHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const AppLogoImage(headline: 'Welcome Doctor'),
          Row(
            children: [
              const Spacer(),
              Column(
                children: [
                  TextButton(
                      onPressed: () async {
                        context.read<NavProvider>().currentIndex = 1;
                      },
                      child: const Text(
                        'Press Here',
                        style: headLines2TextStyle,
                      )),
                  const Text(
                    'To Check Messages Box',
                    style: headLines1TextStyle,
                  )
                ],
              ),
              const Spacer(),
            ],
          )
        ],
      ),
    );
  }
}
