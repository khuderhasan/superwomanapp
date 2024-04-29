import 'package:flutter/material.dart';

import '../../components/app_logo_image.dart';
import 'components/signup_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key, required this.accountType});
  final String accountType;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AppLogoImage(headline: 'Create Account'),
            Row(
              children: [
                const Spacer(),
                Expanded(flex: 8, child: SignUpForm(accountType: accountType)),
                const Spacer()
              ],
            )
          ],
        )),
      ),
    );
  }
}
