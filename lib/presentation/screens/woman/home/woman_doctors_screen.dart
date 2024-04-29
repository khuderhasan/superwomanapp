import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/constants.dart';
import '../../../cubits/doctors/doctors_cubit.dart';
import '../components/contact_card.dart';

class WomanDoctorsScreen extends StatelessWidget {
  const WomanDoctorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Search for Doctor',
          style: TextStyle(color: headLines1Color, fontWeight: FontWeight.bold),
        ),
        leading: const BackButton(),
      ),
      body: BlocBuilder<DoctorsCubit, DoctorsState>(
        bloc: context.read<DoctorsCubit>()..getDoctors(),
        builder: (context, state) {
          if (state is LoadedDoctorsState) {
            final contacts = state.data;
            if (contacts.isNotEmpty) {
              return ListView.builder(
                padding:
                    const EdgeInsets.symmetric(vertical: defaultPadding / 2),
                itemBuilder: (context, index) => ContactCard(
                    contactName:
                        '${contacts[index].firstName} ${contacts[index].lastName}',
                    contactEmail: contacts[index].email,
                    contactId: contacts[index].id),
                itemCount: contacts.length,
              );
            }
            return const Center(
              child: Text("لا يوجد اطباء بعد !"),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
