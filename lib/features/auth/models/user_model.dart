import 'package:cloud_firestore/cloud_firestore.dart';

/// Model class representing user data
class UserModel {
  final String id;
  String userName;
  final String email;
  String school;
  String profilePicture;

  UserModel({
    required this.id,
    required this.userName,
    required this.email,
    required this.school,
    required this.profilePicture,
  });

  /// Static function to create an empty user model
  static UserModel empty() => UserModel(
      id: '', userName: '', email: '', school: '', profilePicture: '');

  /// Convert model to JSON structure for storing data in Firebase
  Map<String, dynamic> toJson() {
    return {
      'Username': userName,
      'Email': email,
      'School': school,
      'ProfilePicture': profilePicture
    };
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
          id: document.id,
          userName: data['Username'] ?? '',
          email: data['Email'] ?? '',
          school: data['School'] ?? '',
          profilePicture: data['ProfilePicture'] ?? '');
    } else {
      return UserModel.empty();
    }
  }
}
