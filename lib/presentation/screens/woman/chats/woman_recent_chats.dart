import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/constants.dart';
import '../../../cubits/chat/chat_cubit.dart';
import '../../components/app_logo_image.dart';
import '../components/contact_card.dart';
import 'components/woman_no_messeges.dart';

class RecentChatsScreen extends StatelessWidget {
  const RecentChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: RefreshIndicator(
      onRefresh: () => context.read<ChatCubit>().getRecentContacts(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const AppLogoImage(headline: 'Messages'),
          Expanded(
            child: Row(
              children: [
                const Spacer(),
                Expanded(
                  flex: 11,
                  child: BlocBuilder<ChatCubit, ChatState>(
                    bloc: context.read<ChatCubit>()..getRecentContacts(),
                    builder: (context, state) {
                      if (state is LoadedContactsState) {
                        final contacts = state.data;
                        if (contacts.isNotEmpty) {
                          return ListView.builder(
                            padding: const EdgeInsets.symmetric(
                                vertical: defaultPadding / 2),
                            itemBuilder: (context, index) => ContactCard(
                                contactName:
                                    '${contacts[index].firstName} ${contacts[index].lastName}',
                                contactEmail: contacts[index].email,
                                contactId: contacts[index].id),
                            itemCount: contacts.length,
                          );
                        }
                        return const NoMessages();
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ),
                const Spacer()
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
