import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String email;
  final String password;
  final String Name;
  final String phoneno;

  const UserModel({
    this.id,
    required this.email,
    required this.password,
    required this.phoneno,
    required this.Name,
  });

  toJason() {
    return {
      "Name": Name,
      "Email": email,
      "Phone": phoneno,
      "Password": password
    };
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
        id: document.id,
        email: data["Email"],
        password: data["Password"],
        phoneno: data["MobileNo"],
        Name: data["Name"]);
  }
}
