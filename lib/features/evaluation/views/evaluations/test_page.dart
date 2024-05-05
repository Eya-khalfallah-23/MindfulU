import 'package:flutter/material.dart';
import 'package:mentalhealth_app/utils/constants/sizes.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/constants/colors.dart';
import '../result/evaluation_result.dart';

class TestPage extends StatefulWidget {
  final String userMood;
  final String pageTitle;
  final String testName;
  final List<Map<String, List<String>>> questions;
  final List<List<Map<String, int>>> responseScores;

  const TestPage({
    Key? key,
    required this.pageTitle,
    required this.questions,
    required this.responseScores,
    required this.userMood, required this.testName,
  }) : super(key: key);

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  int _currentQuestionIndex = 0;
  List<String?> _selectedResponses = [];

  @override
  void initState() {
    super.initState();
    _selectedResponses = List.generate(widget.questions.length, (_) => null);
  }

  void _nextQuestion(BuildContext context) {
  setState(() {
    if (_currentQuestionIndex < widget.questions.length - 1) {
      _currentQuestionIndex++;
    } else {
      // Calculate total score and navigate to result page
      int totalScore = 0;
      for (int i = 0; i < _selectedResponses.length; i++) {
        String? selectedResponse = _selectedResponses[i];
        if (selectedResponse != null) {
          // Access the response scores for the current question
          Map<String, int> responseScores = widget.responseScores[i][0];

          // Find the score for the selected response and accumulate
          totalScore += responseScores[selectedResponse] ?? 0;
        }
      }

      String userMood = widget.userMood;

      String testName = widget.testName;
      
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              ResultPage(testName: testName, totalScore: totalScore, userMood: userMood),
        ),
      );
    }
  });
}


  void _selectResponse(String? response) {
    setState(() {
      _selectedResponses[_currentQuestionIndex] = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    var questions = widget.questions;
    return Scaffold(
      appBar: MhAppBar(
        color: MhColors.blue,
        title: const Text(
          "Questionnaire",
          style: TextStyle(
            color: MhColors.blue, // Set text color to MhColors.blue
            // Add more text style properties as needed
          ),
        ),
        totalQuestions: questions.length,
        currentQuestionIndex: _currentQuestionIndex,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: MhSizes.spaceBetweenSections,
              horizontal: MhSizes.spaceBtwInputFields),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                questions[_currentQuestionIndex].keys.first,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: MhSizes.spaceBetweenSections),
              Column(
                children:
                    questions[_currentQuestionIndex].values.first.map((response) {
                  return GestureDetector(
                    onTap: () => _selectResponse(response),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      decoration: BoxDecoration(
                        color:
                            _selectedResponses[_currentQuestionIndex] == response
                                ? MhColors.orange // Color for selected choice
                                : MhColors.white,
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: _selectedResponses[_currentQuestionIndex] ==
                                response
                            ? [
                                BoxShadow(
                                  color: MhColors.orange.withOpacity(0.5),
                                  spreadRadius: 4,
                                  blurRadius: 8,
                                  offset: const Offset(
                                      0, 0), // changes position of shadow
                                ),
                              ]
                            : [
                                const BoxShadow(
                                  color: Color.fromARGB(20, 75, 52, 37),
                                  spreadRadius: 0,
                                  blurRadius: 16,
                                  offset:
                                      Offset(0, 8), // changes position of shadow
                                ),
                              ],
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8), // Adjust padding here
                            child: Icon(
                              Icons.check_circle_outline,
                              color: _selectedResponses[_currentQuestionIndex] ==
                                      response
                                  ? MhColors
                                      .white // Icon color for selected choice
                                  : Colors.grey[300],
                            ), // Add icon before text
                          ),
                          Expanded(
                            child: Text(
                              response,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: _selectedResponses[
                                            _currentQuestionIndex] ==
                                        response
                                    ? Colors
                                        .white // Text color for selected choice
                                    : MhColors.blue,
                              ),
                            ),
                          ),
                          Theme(
                            data: Theme.of(context).copyWith(
                              unselectedWidgetColor: _selectedResponses[
                                          _currentQuestionIndex] ==
                                      response
                                  ? MhColors
                                      .white // Radio color for selected choice
                                  : MhColors
                                      .blue, // Radio color for unselected choices
                            ),
                            child: Radio<String>(
                              value: response,
                              groupValue:
                                  _selectedResponses[_currentQuestionIndex],
                              onChanged: _selectResponse,
                              activeColor: MhColors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: MhSizes.spaceBetweenSections),
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(20, 0, 0, 0),
                      spreadRadius: 0,
                      blurRadius: 16,
                      offset: Offset(0, 8), // changes position of shadow
                    ),
                  ],
                ),
                child: ElevatedButton(
                  onPressed: _selectedResponses[_currentQuestionIndex] != null
                      ? () => _nextQuestion(context)
                      : null,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _currentQuestionIndex < questions.length - 1
                            ? 'Next'
                            : 'Finish',
                        style: const TextStyle(color: MhColors.white),
                      ),
                      const SizedBox(width: MhSizes.xs),
                      Icon(
                        _currentQuestionIndex < questions.length - 1
                            ? Icons.arrow_right_alt_rounded
                            : Icons.done,
                        color: MhColors.white,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
