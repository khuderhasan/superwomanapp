class DoctorModel {
  final String id;
  final String firstName;
  final String lastName;
  final String email;

  DoctorModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
  });
  factory DoctorModel.fromMap(Map<String, dynamic> json) => DoctorModel(
        id: json['id'],
        firstName: json['firstName'],
        email: json['email'],
        lastName: json['lastName'],
      );
  Map<String, dynamic> toMap() => {
        "id": id,
        "firstName": firstName,
        "email": email,
        "lastName": lastName,
      };
}
