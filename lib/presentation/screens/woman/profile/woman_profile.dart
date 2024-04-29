import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../cubits/auth/auth_cubit.dart';
import '../../../providers/navigation_provider.dart';
import '../../register/signup/account_type_screen.dart';

class WomanProfileScreen extends StatelessWidget {
  const WomanProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, RegisterState>(
      listener: (context, state) {
        if (state is SuccessSignOutRegisterState) {
          Navigator.of(context)
              .pushReplacementNamed(AccountTypeScreen.routeName);
        }
      },
      child: Center(
        child: ElevatedButton(
          child: const Text('sign out'),
          onPressed: () async {
            await context.read<AuthCubit>().signOut().then((_) {
              Provider.of<NavProvider>(context, listen: false).currentIndex = 0;
            });
          },
        ),
      ),
    );
  }
}
