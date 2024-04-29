import 'package:flutter/material.dart';

import '../../../config/constants.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function? press;
  const AlreadyHaveAnAccountCheck({
    super.key,
    this.login = true,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          login ? "Don't Have an Account ? " : "Allready Have an Account ? ",
          style: const TextStyle(
              color: headLines1Color,
              fontWeight: FontWeight.bold,
              fontSize: 17),
        ),
        GestureDetector(
          onTap: press as void Function()?,
          child: Text(
            login ? "Create Account" : "Login",
            style: const TextStyle(
                color: headLines2Color,
                fontWeight: FontWeight.bold,
                fontSize: 19),
          ),
        ),
      ],
    );
  }
}
