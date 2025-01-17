class SignUpModel {
  String username;
  String email;
  String password;
  String rePassword;

  SignUpModel({
    required this.username,
    required this.email,
    required this.password,
    required this.rePassword,
  });

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'email': email,
      'password': password,
      'rePassword': rePassword,
    };
  }

  bool isValid() {
    return email.isNotEmpty &&
        password.isNotEmpty &&
        username.isEmpty &&
        rePassword.isEmpty;
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'password': password,
      'rePassword': rePassword,
    };
  }
}
