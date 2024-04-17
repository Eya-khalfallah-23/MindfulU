import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final int totalScore;

  const ResultPage({super.key, required this.totalScore});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Your total score is: $totalScore',
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}