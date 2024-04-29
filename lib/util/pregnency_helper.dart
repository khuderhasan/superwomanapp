class PregnencyHelper {
  static int calculatePregnancyMonthIndex(DateTime startDate) {
    DateTime currentDate = DateTime.now();
    int months = currentDate.month -
        startDate.month +
        12 * (currentDate.year - startDate.year);

    // Adjust if the current day of the month is before the start day
    if (currentDate.day < startDate.day) {
      months--;
    }

    return months;
  }

  static DateTime calculateDueDate(DateTime pregnancyStartDate) {
    return pregnancyStartDate.add(const Duration(days: 280));
  }
}
