String? emailValidator(String? value) {
  if (value!.isEmpty || !value.contains('@')) {
    return "Invalid Email Format!!";
  }
  return null;
}

String? nameValidator(String? value) {
  if (value!.isEmpty || value.length < 4) {
    return "Please enter at least 4 charactares";
  }
  return null;
}

String? genderValidator(String? value) {
  if (value!.isEmpty) {
    return 'Please Choose Your Gender';
  }
  return null;
}

String? passwordValidator(String? value) {
  if (value!.isEmpty || value.length < 6) {
    return "Please enter at least 6 charactares";
  }
  return null;
}

String? confirmPasswordValidator(String? value, String? password) {
  if (value! != password) {
    return "Passwords does not match!";
  }
  return null;
}

String? accountTypeValidator(String? value) {
  if (value!.isEmpty) {
    return 'Please Choose Your Gender';
  }
  return null;
}

String getMonth(int month) {
  switch (month) {
    case 1:
      return "First";
    case 2:
      return "Second";
    case 3:
      return "Third";
    case 4:
      return "Forth";
    case 5:
      return "Fifith";
    case 6:
      return "Sixth";
    case 7:
      return "Seventh";
    case 8:
      return "Eighth";
    case 9:
      return "Ninth";
    default:
      return "First";
  }
}
