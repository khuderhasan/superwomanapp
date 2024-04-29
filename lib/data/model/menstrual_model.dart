class MenstrualModel {
  final int? cycleLength;
  final DateTime? menstrualDate;

  MenstrualModel({required this.cycleLength, required this.menstrualDate});
  factory MenstrualModel.fromMap(Map<String, dynamic> json) {
    return MenstrualModel(
        cycleLength: json['cycleLength'],
        menstrualDate: (json['menstrualDate'] == null)
            ? null
            : DateTime.parse(json['menstrualDate']));
  }

  Map<String, dynamic> toMap() => {
        'cycleLength': cycleLength,
        'menstrualDate': menstrualDate,
      };
}
