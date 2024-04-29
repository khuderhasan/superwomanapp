class JoinRequestModel {
  final String firstName;
  final String lastName;
  final String userId;

  JoinRequestModel(
      {required this.firstName, required this.lastName, required this.userId});
  factory JoinRequestModel.fromMap(Map<String, dynamic> json) =>
      JoinRequestModel(
          firstName: json['firstName'],
          lastName: json['lastName'],
          userId: json['id']);

  Map<String, dynamic> toMap() => {
        "firstName": firstName,
        'lastName': lastName,
        "id": userId,
      };
}
