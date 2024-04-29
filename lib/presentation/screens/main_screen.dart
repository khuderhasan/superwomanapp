import 'package:flutter/material.dart';

import '../../data/model/user_model.dart';
import '../../util/prefrences_helper.dart';
import 'doctor/doctor_main_screen.dart';
import 'woman/woman_main_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserModel>(
      future: PrefHelper.getSavedInfo(),
      builder: (context, AsyncSnapshot<UserModel> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasData) {
          if (snapshot.data!.accountType == 'user') {
            return const WomanMainScreen();
          } else if (snapshot.data!.accountType == 'doctor') {
            return const DoctorMainScreen();
          }
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
