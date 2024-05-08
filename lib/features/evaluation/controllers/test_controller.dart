import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mentalhealth_app/data/repositories/auth/tests/test_repository.dart';
import 'package:uuid/uuid.dart';

import '../models/test_model.dart';

class TestController extends GetxController {
  
  RxList<TestModel> testResults = <TestModel>[].obs;
  final testRepository = Get.put(TestRepository());

   @override
  void onInit() {
    super.onInit();
    // Fetch test data when the controller is initialized
    fetchTestData();
  }

  // Method to fetch test data
  Future<void> fetchTestData() async {
    try {
      // Call the fetchTestData method from the TestRepository
      List<TestModel> fetchedData = await testRepository.fetchTestData();

       fetchedData.sort((a, b) => b.date.compareTo(a.date));
      
      // Update the testResults list with the fetched data
      testResults.assignAll(fetchedData);
    } catch (e) {
      // Handle any errors that occur during fetching
      print("Error fetching test data: $e");
    }
  }

  /* // Method to add a new test result
  Future<void> addTestResult(TestModel testModel) async {
    try {
      // Add the new test result to the testResults list
      testResults.add(testModel);

      // Save the test record to Firestore
      await testRepository.saveTestRecord(testModel);
    } catch (e) {
      // Handle any errors that occur during adding
      print("Error adding test result: $e");
    }
  } */

  Future<void> addTestResult(TestModel testModel) async {
    try {
      final newTest = TestModel(
        id: testModel.id,
        testResult: testModel.testResult,
        testName: testModel.testName,
        score: testModel.score,
        mood: testModel.mood,
        date: testModel.date,
        nbsug: testModel.nbsug,
        color: testModel.color,
      );
      
       
      await testRepository.saveTestRecord(newTest);
      testResults.insert(0, testModel);

    } catch (e) {}
  }

  

  // Other methods for update and delete
}
