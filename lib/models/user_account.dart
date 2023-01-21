class UserAccount {
  final String firstName;
  final String lastName;
  final String phone;
  final String email;
  final String password;

  UserAccount(
      {required this.firstName,
      required this.lastName,
      required this.phone,
      required this.email,
      required this.password});

  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'phone': phone,
        'email': email,
        'password': password
      };

  static UserAccount fromJson(Map<String, dynamic> json) => UserAccount(
      firstName: json['firstName'],
      lastName: json['lastName'],
      phone: json['phone'],
      email: json['email'],
      password: json['password']);
}
