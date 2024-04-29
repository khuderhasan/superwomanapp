import 'package:flutter/material.dart';

class UserType with ChangeNotifier {
  String? _userType;
  String? _userId;
  String? get userType => _userType;
  String? get userId => _userId;
  set userType(String? userType) {
    _userType = userType;
    notifyListeners();
  }

  set userId(String? userId) {
    _userId = userId;
    notifyListeners();
  }
}
