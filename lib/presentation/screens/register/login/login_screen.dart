import 'package:flutter/material.dart';

import '../../components/app_logo_image.dart';
import 'components/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  static const routeName = '/login_screen';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppLogoImage(headline: "Login"),
            Row(
              children: [
                Spacer(),
                Expanded(
                  flex: 10,
                  child: LoginForm(),
                ),
                Spacer()
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
