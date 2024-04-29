import 'package:intl/intl.dart';

class UserModel {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String accountType;
  final String accountStatus;
  final DateTime? pregnencyStartDate;

  UserModel({
    required this.id,
    required this.firstName,
    required this.email,
    required this.lastName,
    required this.accountType,
    required this.accountStatus,
    this.pregnencyStartDate,
  });

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
      id: json['id'],
      firstName: json['firstName'],
      email: json['email'],
      lastName: json['lastName'],
      accountType: json['accountType'],
      accountStatus: json['accountStatus'],
      pregnencyStartDate: (json['pregnencyStartDate'] == null)
          ? null
          : DateTime.parse(json['pregnencyStartDate']));
  Map<String, dynamic> toMap() => {
        "id": id,
        "firstName": firstName,
        "email": email,
        "lastName": lastName,
        "accountType": accountType,
        "accountStatus": accountStatus,
        "pregnencyStartDate": (pregnencyStartDate != null)
            ? DateFormat('yyyy-MM-dd').format(pregnencyStartDate!)
            : null,
      };
}
