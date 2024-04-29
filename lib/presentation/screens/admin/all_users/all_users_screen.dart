import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/constants.dart';
import '../../../cubits/admin/admin_cubit.dart';
import 'components/user_card.dart';
import '../../components/app_logo_image.dart';

class AllUsersScreen extends StatelessWidget {
  const AllUsersScreen({super.key});
  static const routeName = '/all_users_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AppLogoImage(headline: 'All Users'),
            Flexible(
              flex: 10,
              child: BlocBuilder<AdminCubit, AdminState>(
                bloc: context.read<AdminCubit>()..fetchUsers(),
                builder: (context, state) {
                  if (state is LoadedUsersState) {
                    final users = state.data;
                    final acceptedUsers = users
                        .where((element) => element.accountStatus == 'accepted')
                        .toList();
                    if (users.isNotEmpty) {
                      return ListView.builder(
                        itemBuilder: (context, index) =>
                            UserCard(user: acceptedUsers[index]),
                        itemCount: acceptedUsers.length,
                      );
                    }
                    return const Center(
                      child: Text('No Users Yet !'),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: defaultPadding),
              child: Text(
                'Join Requests',
                style: headLines1TextStyle,
              ),
            ),
            Flexible(
              flex: 10,
              child: BlocBuilder<AdminCubit, AdminState>(
                bloc: context.read<AdminCubit>()..fetchUsers(),
                builder: (context, state) {
                  if (state is LoadedUsersState) {
                    final users = state.data;
                    final newUsers = users
                        .where((element) => element.accountStatus == 'pending')
                        .toList();
                    if (users.isNotEmpty) {
                      return ListView.builder(
                        itemBuilder: (context, index) =>
                            UserCard(user: newUsers[index]),
                        itemCount: newUsers.length,
                      );
                    }
                    return const Center(
                      child: Text('No Users Yet '),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
