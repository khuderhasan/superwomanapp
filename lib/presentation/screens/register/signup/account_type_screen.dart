import 'package:flutter/material.dart';

import '../../../../config/constants.dart';
import '../../components/all_ready_have_an_account_chech.dart';
import '../../components/app_logo_image.dart';
import '../login/login_screen.dart';
import 'signup_screen.dart';

class AccountTypeScreen extends StatelessWidget {
  const AccountTypeScreen({super.key});
  static const routeName = '/account_type_screen';
  @override
  Widget build(BuildContext context) {
    void goToSignupPage(String accountType) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return SignUpScreen(
              accountType: accountType,
            );
          },
        ),
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const AppLogoImage(headline: "Choose User Type"),
              Row(
                children: [
                  const Spacer(),
                  Expanded(
                    flex: 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: defaultPadding),
                          child: ElevatedButton(
                              onPressed: () {
                                goToSignupPage('user');
                              },
                              child: const Text("User")),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            goToSignupPage('doctor');
                          },
                          child: const Text('Doctor'),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: defaultPadding),
                          child: ElevatedButton(
                              onPressed: () {
                                goToSignupPage('admin');
                              },
                              child: const Text('Admin')),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                ],
              ),
              const SizedBox(height: defaultPadding),
              AlreadyHaveAnAccountCheck(
                login: false,
                press: () {
                  Navigator.pushReplacementNamed(
                      context, LoginScreen.routeName);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
