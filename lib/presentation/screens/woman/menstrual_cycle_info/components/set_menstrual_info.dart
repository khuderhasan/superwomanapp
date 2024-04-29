import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../config/constants.dart';
import '../../../../cubits/woman/woman_cubit.dart';

class SetMenstrualInfo extends StatefulWidget {
  const SetMenstrualInfo({super.key});

  @override
  State<SetMenstrualInfo> createState() => _SetMenstrualInfoState();
}

class _SetMenstrualInfoState extends State<SetMenstrualInfo> {
  DateTime? _selectedDate;
  int _selectedLength = 25;
  void presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.utc(2024, 1, 1),
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
    return Column(children: [
      const SizedBox(
        height: defaultPadding * 3,
      ),
      const Text(
        'Last period Start Date :',
        style: TextStyle(
            color: headLines1Color, fontWeight: FontWeight.bold, fontSize: 20),
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
                    ? "Press to select"
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
      const Text(
        'Menstrual cycle Length : ',
        textAlign: TextAlign.start,
        style: TextStyle(
            color: headLines1Color, fontWeight: FontWeight.bold, fontSize: 20),
      ),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            IconButton(
              onPressed: () {
                setState(() {
                  _selectedLength++;
                });
              },
              icon: const Icon(
                Icons.add,
                size: 26,
                color: kPrimaryLightColor,
              ),
            ),
            Text(_selectedLength.toString(),
                style: const TextStyle(color: Colors.white, fontSize: 17)),
            IconButton(
                onPressed: () {
                  setState(() {
                    _selectedLength--;
                  });
                },
                icon: const Icon(
                  Icons.remove,
                  size: 26,
                  color: kPrimaryLightColor,
                ))
          ]),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(
          defaultPadding * 5,
        ),
        child: ElevatedButton(
          onPressed: () async {
            await context.read<WomanCubit>().setMenstrualInfo(
                menstrualDate: _selectedDate, cycleLength: _selectedLength);
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(headLines1Color),
          ),
          child: const Text("Save Info"),
        ),
      )
    ]);
  }
}
