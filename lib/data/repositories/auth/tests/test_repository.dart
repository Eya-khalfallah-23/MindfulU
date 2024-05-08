import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mentalhealth_app/features/evaluation/models/test_model.dart';
import 'package:uuid/uuid.dart';

import '../../../../exceptions/firebase_auth_exceptions.dart';
import '../../../../exceptions/firebase_exceptions.dart';
import '../../../../exceptions/format_exceptions.dart';
import '../../../../exceptions/platform_exceptions.dart';
import '../auth_repository.dart';

class TestRepository extends GetxController {
  static TestRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Function to save user data to Firestore
  Future<bool> saveTestRecord(TestModel test) async {
    try {
      await _db
          .collection("Users")
          .doc(AuthenticationRepository.instance.authUser!.uid)
          .collection("Tests")
          .doc(test.id)
          .set(test.toJson());
      return true;
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

 // Fetch test data from Firestore
  Future<List<TestModel>> fetchTestData() async {
    try {
      // Perform a query to get test data from Firestore
      QuerySnapshot<Map<String, dynamic>> querySnapshot = await _db
          .collection("Users")
          .doc(AuthenticationRepository.instance.authUser!.uid)
          .collection("Tests")
          .get();

      // Map each document snapshot to a TestModel object
      List<TestModel> testList = querySnapshot.docs.map((doc) {
        return TestModel.fromSnapshot(doc);
      }).toList();

      return testList;
    } catch (e) {
      // Handle any errors that occur during fetching
      print("Error fetching test data: $e");
      return [];
    }
  }
}
