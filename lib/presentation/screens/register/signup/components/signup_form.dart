import 'package:provider/provider.dart';
import '../../../../providers/user_type_provider.dart';

import '../../../admin/admin_main_screen.dart';

import '../../../doctor/doctor_main_screen.dart';
import '../../../woman/woman_main_screen.dart';

import '../../../../../config/constants.dart';
import '../../../../../config/validators.dart';
import '../../../../cubits/auth/auth_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    required this.accountType,
    super.key,
  });
  final String accountType;
  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formkey = GlobalKey<FormState>();
  String _firstName = '';
  String _email = '';
  String _password = '';
  String _lastName = '';
  bool _showPass = true;
  // ignore: unused_field
  String _confirmPassword = '';
  Future<void> _trySubmit(BuildContext context) async {
    final isValid = _formkey.currentState!.validate();
    if (isValid) {
      _formkey.currentState!.save();
      await context.read<AuthCubit>().signUp(
          firstName: _firstName.trim(),
          email: _email.trim(),
          password: _password.trim(),
          lastName: _lastName.trim(),
          accountType: widget.accountType.trim());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, RegisterState>(
      listener: (context, state) {
        if (state is SuccessRegisterState) {
          Provider.of<UserType>(context, listen: false).userType =
              widget.accountType;
          Provider.of<UserType>(context, listen: false).userId = state.data.id;
          if (widget.accountType == 'user') {
            Navigator.pushReplacementNamed(context, WomanMainScreen.routeName);
          } else if (widget.accountType == 'doctor') {
            Navigator.pushReplacementNamed(context, DoctorMainScreen.routeName);
          } else if (state.data.accountType == 'admin') {
            Navigator.pushReplacementNamed(context, AdminMainScreen.routeName);
          }
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar(reason: SnackBarClosedReason.hide)
            ..showSnackBar(const SnackBar(
              content: Text("Account Created Succefully"),
              backgroundColor: Colors.green,
            ));
        } else if (state is ErrorRegisterState) {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: const Text(
                      'Error',
                      style: TextStyle(color: Colors.red),
                    ),
                    content: Text(state.error.message),
                  ));
        }
      },
      child: Form(
        key: _formkey,
        child: Column(
          children: [
            //* FirstName TextField
            TextFormField(
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              cursorColor: kPrimaryColor,
              onSaved: (name) {
                _firstName = name!;
              },
              validator: nameValidator,
              decoration: InputDecoration(
                hintText: "First Name",
                focusedBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Image.asset('assets/icons/name_icon.png'),
                ),
              ),
            ),
            //* lastName TextField
            Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPadding),
              child: TextFormField(
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                cursorColor: kPrimaryColor,
                onSaved: (name) {
                  _lastName = name!;
                },
                validator: nameValidator,
                decoration: InputDecoration(
                  hintText: "Last Name",
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(defaultPadding),
                    child: Image.asset('assets/icons/name_icon.png'),
                  ),
                ),
              ),
            ),
            //* Email TextField
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              cursorColor: kPrimaryColor,
              validator: emailValidator,
              onSaved: (email) {
                _email = email!;
              },
              decoration: InputDecoration(
                hintText: "Email",
                focusedBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Image.asset('assets/icons/email_icon.png'),
                ),
              ),
            ),
            //* Password TextField
            Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPadding),
              child: TextFormField(
                textInputAction: TextInputAction.done,
                validator: passwordValidator,
                onSaved: (password) {
                  _password = password!;
                },
                obscureText: _showPass,
                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  hintText: "Password",
                  suffixIcon: IconButton(
                    alignment: Alignment.center,
                    icon: Icon(
                        (_showPass) ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _showPass = !_showPass;
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
            //* Confirm Password TextField
            TextFormField(
              textInputAction: TextInputAction.next,
              validator: (value) {
                confirmPasswordValidator(value, _password);
                return;
              },
              onSaved: (confirmed) {
                _confirmPassword = confirmed!;
              },
              obscureText: _showPass,
              cursorColor: kPrimaryColor,
              decoration: InputDecoration(
                hintText: "Confirm Password",
                suffixIcon: IconButton(
                  alignment: Alignment.center,
                  icon: Icon(
                      (_showPass) ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      _showPass = !_showPass;
                    });
                  },
                ),
                focusedBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Image.asset('assets/icons/pass_icon.png'),
                ),
              ),
            ),

            const SizedBox(height: defaultPadding),
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
                  return const Text('Create Account');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
