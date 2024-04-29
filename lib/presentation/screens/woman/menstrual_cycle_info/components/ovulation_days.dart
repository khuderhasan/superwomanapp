import 'package:flutter/material.dart';
import '../../../../../config/constants.dart';
import '../../../../../util/ovulation_calculator.dart';
import 'package:table_calendar/table_calendar.dart';

class OvulationDays extends StatelessWidget {
  const OvulationDays(
      {super.key, required this.lastStartDate, required this.cycleLength});
  final DateTime lastStartDate;
  final int cycleLength;
  @override
  Widget build(BuildContext context) {
    final ovulationData = OvulationCalculator().calculateOvulationDays(
        startDate: lastStartDate, cycleLength: cycleLength);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const Center(
            child: Text(
              "Ovulation Days :",
              style: TextStyle(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 23),
            ),
          ),
          TableCalendar(
              rangeStartDay: ovulationData['firstOvulationDay'],
              rangeEndDay: ovulationData['lastOvulationDay'],
              calendarStyle: const CalendarStyle(
                  rangeStartDecoration: BoxDecoration(
                      color: kPrimaryColor, shape: BoxShape.circle),
                  rangeEndDecoration: BoxDecoration(
                      color: kPrimaryColor, shape: BoxShape.circle),
                  rangeHighlightColor: kPrimaryColor),
              focusedDay: DateTime.now(),
              headerStyle: const HeaderStyle(
                  formatButtonVisible: false, titleCentered: true),
              firstDay: DateTime.utc(2024, 1, 1),
              lastDay: DateTime.utc(2030, 1, 1)),
        ],
      ),
    );
  }
}
