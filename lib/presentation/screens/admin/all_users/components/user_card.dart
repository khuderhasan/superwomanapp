import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../config/constants.dart';
import '../../../../../data/model/user_model.dart';
import '../../../../cubits/admin/admin_cubit.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key, required this.user});
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset('assets/icons/profile_icon.png'),
          Text('${user.firstName} ${user.lastName}'),
          if (user.accountStatus == 'pending')
            Container(
              decoration: BoxDecoration(
                  color: headLines2Color,
                  borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () async {
                  await context.read<AdminCubit>().acceptUser(userId: user.id);
                },
                child: const Text(
                  'accept',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          Container(
            decoration: BoxDecoration(
                color: kPrimaryColor, borderRadius: BorderRadius.circular(20)),
            child: TextButton(
              onPressed: () async {
                await context.read<AdminCubit>().deleteUser(userId: user.id);
              },
              child: (user.accountStatus == 'pending')
                  ? const Text(
                      'reject',
                      style: TextStyle(color: Colors.white),
                    )
                  : const Text(
                      'delete',
                      style: TextStyle(color: Colors.white),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
