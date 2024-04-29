import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/constants.dart';
import '../../../cubits/woman/woman_cubit.dart';
import 'components/ovulation_days.dart';
import 'components/set_menstrual_info.dart';

class MenstrualCylceScreen extends StatelessWidget {
  const MenstrualCylceScreen({super.key});
  static const routeName = '/menstrual_cycle_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Follow Menstrual Cycle',
          style: TextStyle(
            color: headLines1Color,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<WomanCubit, WomanState>(
        bloc: context.read<WomanCubit>()..getMenstrualInfo(),
        builder: (context, state) {
          if (state is LoadedMenstrualInfoState) {
            final menstrulaInfo = state.data;
            if (menstrulaInfo.menstrualDate == null) {
              return const SetMenstrualInfo();
            }
            return OvulationDays(
                lastStartDate: menstrulaInfo.menstrualDate!,
                cycleLength: menstrulaInfo.cycleLength!);
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
