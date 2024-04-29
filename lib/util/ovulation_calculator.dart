class OvulationCalculator {
  Map<String, DateTime> calculateOvulationDays(
      {required DateTime startDate, required int cycleLength}) {
    // Assuming a 14-day luteal phase
    int lutealPhaseLength = 14;

    // Calculate the ovulation day
    DateTime ovulationDay =
        startDate.add(Duration(days: cycleLength - lutealPhaseLength + 1));

    // Calculate the last ovulation day (optional, based on a 5-day fertile window)
    DateTime lastOvulationDay = ovulationDay.add(const Duration(days: 4));

    return {
      'firstOvulationDay': ovulationDay,
      'lastOvulationDay': lastOvulationDay,
    };
  }
}
