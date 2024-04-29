import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cubits/woman/woman_cubit.dart';
import '../../components/app_logo_image.dart';
import 'components/set_pregnancy_date.dart';
import 'components/woman_info.dart';

class WomanInfoScreen extends StatelessWidget {
  const WomanInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const AppLogoImage(headline: 'Your Info'),
          Row(
            children: [
              const Spacer(),
              Expanded(
                  flex: 13,
                  child: BlocBuilder<WomanCubit, WomanState>(
                    bloc: context.read<WomanCubit>()..getPregnancyStartDate(),
                    builder: (context, state) {
                      if (state is LoadedPregnancyDate) {
                        return WomanInfo(pregnancyStartDate: state.data);
                      } else if (state is EmptyPregnancyDate) {
                        return const SetPregnancyDate();
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  )),
              const Spacer(),
            ],
          )
        ],
      ),
    ));

    // FutureBuilder(
    //   future: PrefHelper.getSavedInfo(),
    //   builder: (context, snapshot) {
    //     if (snapshot.hasData) {

    //     }
    //     return const Center(
    //       child: CircularProgressIndicator(),
    //     );
    //   },
    // );
  }
}
