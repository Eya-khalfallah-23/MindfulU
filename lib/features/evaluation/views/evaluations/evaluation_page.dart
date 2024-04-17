import 'package:flutter/material.dart';
import 'package:mentalhealth_app/utils/constants/sizes.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/constants/colors.dart';
import '../result/evaluation_result.dart';

class EvaluationPage extends StatefulWidget {
  const EvaluationPage({super.key});

  @override
  _EvaluationPageState createState() => _EvaluationPageState();
}

class _EvaluationPageState extends State<EvaluationPage> {
  int _currentQuestionIndex = 0;
  List<String?> _selectedResponses = [];
  List<Map<String, List<String>>> questions = [
    {
      'Feeling nervous, anxious or on edge?': [
        'Not at all',
        'Several days',
        'More than half of the days',
        'Nearly every day'
      ]
    },
    {
      'Question 2': [
        'Not at all',
        'Several days',
        'More than half of the days',
        'Nearly every day'
      ]
    },
    {
      'Question 3': [
        'Not at all',
        'Several days',
        'More than half of the days',
        'Nearly every day'
      ]
    },
  ];

  final Map<String, int> responseScores = {
    'Not at all': 0,
    'Several days': 1,
    'More than half of the days': 2,
    'Nearly every day': 3,
  };

  void _nextQuestion() {
    setState(() {
      if (_currentQuestionIndex < questions.length - 1) {
        _currentQuestionIndex++;
      } else {
        // Calculate total score and navigate to result page
        int totalScore = _selectedResponses.fold<int>(
            0,
            (previousValue, response) =>
                previousValue + (responseScores[response] ?? 0));

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultPage(totalScore: totalScore),
          ),
        );
      }
    });
  }

  void _selectResponse(String? response) {
    setState(() {
      _selectedResponses[_currentQuestionIndex] =
          response; // Update selected response
    });
  }

  @override
  void initState() {
    super.initState();
    _selectedResponses = List.generate(questions.length, (_) => null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MhAppBar(
        color: MhColors.blue,
        title: Text(
          "Questionnaire",
          style: TextStyle(
            color: MhColors.blue, // Set text color to MhColors.blue
            // Add more text style properties as needed
          ),
        ),
        totalQuestions: questions.length,
        currentQuestionIndex: _currentQuestionIndex,
      ),
      body: Padding(
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
                                offset:
                                    Offset(0, 0), // changes position of shadow
                              ),
                            ]
                          : [
                              BoxShadow(
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
                          padding: EdgeInsets.symmetric(
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
                    ? _nextQuestion
                    : null,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _currentQuestionIndex < questions.length - 1
                          ? 'Next'
                          : 'Finish',
                      style: TextStyle(color: MhColors.white),
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
    );
  }
}
