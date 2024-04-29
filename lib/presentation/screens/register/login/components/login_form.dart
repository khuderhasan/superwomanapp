import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../../../../providers/user_type_provider.dart';
import '../../../admin/admin_main_screen.dart';

import '../../../../../config/constants.dart';
import '../../../../../config/validators.dart';
import '../../../../cubits/auth/auth_cubit.dart';
import '../../../components/all_ready_have_an_account_chech.dart';
import '../../../doctor/doctor_main_screen.dart';
import '../../../woman/woman_main_screen.dart';
import '../../signup/account_type_screen.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formkey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  Future<void> _trySubmit(BuildContext context) async {
    FocusNode().unfocus();
    final isValid = _formkey.currentState!.validate();
    if (isValid) {
      _formkey.currentState!.save();
      await context
          .read<AuthCubit>()
          .signIn(email: _email.trim(), password: _password.trim());
    }
  }

  bool _hidePass = true;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, RegisterState>(
      listener: (context, state) {
        if (state is SuccessRegisterState) {
          Provider.of<UserType>(context, listen: false).userType =
              state.data.accountType;
          Provider.of<UserType>(context, listen: false).userId = state.data.id;
          if (state.data.accountType == 'user') {
            Navigator.pushReplacementNamed(context, WomanMainScreen.routeName);
          } else if (state.data.accountType == 'doctor') {
            Navigator.pushReplacementNamed(context, DoctorMainScreen.routeName);
          } else if (state.data.accountType == 'admin') {
            Navigator.pushReplacementNamed(context, AdminMainScreen.routeName);
          }

          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar(reason: SnackBarClosedReason.hide)
            ..showSnackBar(const SnackBar(
              content: Text("LoggedIn Successfully"),
              backgroundColor: Colors.green,
            ));
        } else if (state is ErrorRegisterState) {
          showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              title: const Text(
                'Error',
                style: TextStyle(color: errorColor),
              ),
              content: Text(
                state.error.message,
                style: const TextStyle(fontSize: defaultPadding),
              ),
            ),
          );
        }
      },
      child: Form(
        key: _formkey,
        child: Column(
          children: [
            //* Email TextField
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              cursorColor: kPrimaryColor,
              validator: emailValidator,
              onSaved: (value) {
                _email = value!;
              },
              decoration: InputDecoration(
                focusedBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                hintText: "Email",
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Image.asset('assets/icons/email_icon.png'),
                ),
              ),
            ),
            //* Password TextField
            Padding(
              padding: const EdgeInsets.only(
                  top: defaultPadding, bottom: defaultPadding / 2),
              child: TextFormField(
                textInputAction: TextInputAction.done,
                obscureText: _hidePass,
                validator: passwordValidator,
                onSaved: (value) {
                  _password = value!;
                },
                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  hintText: "Password",
                  suffixIcon: IconButton(
                    alignment: Alignment.center,
                    icon: Icon(
                        (_hidePass) ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _hidePass = !_hidePass;
                      });
                    },
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(defaultPadding),
                    child: Image.asset('assets/icons/pass_icon.png'),
                  ),
                ),
              ),
            ),
            const SizedBox(height: defaultPadding / 2),
            ElevatedButton(
              onPressed: () {
                FocusScope.of(context).unfocus();
                _trySubmit(context);
              },
              child: BlocBuilder<AuthCubit, RegisterState>(
                bloc: context.read<AuthCubit>(),
                builder: (context, state) {
                  if (state is LoadingRegisterState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is SuccessRegisterState) {
                    return const Center(
                      child: Icon(
                        Icons.done_outline_rounded,
                        color: Colors.green,
                      ),
                    );
                  }
                  return Text(
                    "Login".toUpperCase(),
                  );
                },
              ),
            ),
            const SizedBox(height: defaultPadding),
            AlreadyHaveAnAccountCheck(
              press: () async {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const AccountTypeScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
