import 'package:cloud_firestore/cloud_firestore.dart';

/// Model class representing user data
class TestModel {
  final String id;
  final String testResult;
  final String testName;
  final int score;
  final String mood;
  final DateTime date;
  final int nbsug;
  final String color;

  TestModel(
      {required this.id,
      required this.testResult,
      required this.testName,
      required this.score,
      required this.mood,
      required this.date,
      required this.nbsug,
      required this.color});

  /// Static function to create an empty user model
  static TestModel empty() => TestModel(
      id: '',
      testResult: '',
      testName: '',
      score: 0,
      mood: '',
      date: DateTime.now(),
      nbsug: 0,
      color: '');

  /// Convert model to JSON structure for storing data in Firebase
  Map<String, dynamic> toJson() {
    return {
      'ID': id,
      'TestResult': testResult,
      'TestName': testName,
      'Score': score,
      'Mood': mood,
      'Date': date.toIso8601String(),
      'Nbsug': nbsug,
      'Color': color,
    };
  }

  factory TestModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return TestModel(
        id: data['ID'] ?? '',
        testResult: data['TestResult'] ?? '',
        testName: data['TestName'] ?? '',
        score: data['Score'] ?? 0,
        mood: data['Mood'] ?? '',
        date: DateTime.parse(data['Date'] ?? ''),
        nbsug: data['Nbsug'] ?? 0,
        color: data['Color'] ?? '',
      );
    } else {
      return TestModel.empty();
    }
  }
}
