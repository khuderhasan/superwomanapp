import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../config/constants.dart';
import '../../../../cubits/woman/woman_cubit.dart';

class SetPregnancyDate extends StatefulWidget {
  const SetPregnancyDate({super.key});

  @override
  State<SetPregnancyDate> createState() => _SetPregnancyDateState();
}

class _SetPregnancyDateState extends State<SetPregnancyDate> {
  DateTime? _selectedDate;
  void presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.utc(2023, 4, 1),
            lastDate: DateTime.utc(2030, 1, 1))
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: defaultPadding * 3,
        ),
        const Text(
          'Choose Pregnancy Start Date : ',
          style: TextStyle(
              color: headLines1Color,
              fontWeight: FontWeight.bold,
              fontSize: 20),
          textAlign: TextAlign.start,
        ),
        GestureDetector(
          onTap: presentDatePicker,
          child: Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Container(
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ListTile(
                leading: Text(
                  _selectedDate == null
                      ? 'Press to select'
                      : DateFormat.yMd().format(_selectedDate!),
                  style: const TextStyle(color: headLines2Color, fontSize: 17),
                ),
                trailing: const Icon(
                  Icons.calendar_month,
                  size: 26,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(
            defaultPadding * 5,
          ),
          child: ElevatedButton(
            onPressed: () async {
              await context
                  .read<WomanCubit>()
                  .setPregnencyStartDate(pregnancyStartDate: _selectedDate);
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(headLines1Color),
            ),
            child: const Text('Save Info'),
          ),
        )
      ],
    );
  }
}
