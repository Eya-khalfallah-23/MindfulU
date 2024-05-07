import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../exceptions/firebase_auth_exceptions.dart';
import '../../../../exceptions/firebase_exceptions.dart';
import '../../../../exceptions/format_exceptions.dart';
import '../../../../exceptions/platform_exceptions.dart';
import '../../../../features/auth/models/user_model.dart';

/// repository class for user-related operations
class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Function to save user data to Firestore
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } on FirebaseAuthException catch (e) {
      throw MhFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw MhFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const MhFormatException();
    } on PlatformException catch (e) {
      throw MhPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again!';
    }
  }

  /// Function to fetch user details based on user ID
  /// Function to update User data in Firestore
  /// Update any field in specific users Collections
}