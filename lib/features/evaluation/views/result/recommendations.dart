import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:mentalhealth_app/features/evaluation/views/evaluation_main/main_page.dart';
import 'package:mentalhealth_app/utils/constants/colors.dart';

class RecommendationPage extends StatelessWidget {
  const RecommendationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: MhColors.blue),
          onPressed: () => Get.to(() => EvaluationMain()),
        ),
        title: const Text(
          'Recommendations',
          style: TextStyle(
            color: MhColors.blue,
            fontWeight: FontWeight.w700,
            fontSize: 22,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'We recommend the following items:',
              style: TextStyle(
                color: MhColors.blue,
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 21),
            Expanded(
              child: ListView(
                children: [
                  _buildRecommendationItem(
                    'Book: "The Gifts of Imperfection" by Brené Brown',
                    'This book encourages self-acceptance and vulnerability, key elements for emotional well-being.',
                  ),
                  _buildRecommendationItem(
                    'Book: "Atomic Habits" by James Clear',
                    'This book provides strategies for developing positive and sustainable habits, essential for maintaining good mental health.',
                  ),
                  _buildRecommendationItem(
                    'Video: "The Power of Vulnerability" by Brené Brown ',
                    'An inspiring discussion on the importance of vulnerability and human connection.',
                  ),
                  _buildRecommendationItem(
                    'Podcast: "The Happiness Lab" with Dr. Laurie Santos',
                    'Explores scientific discoveries about happiness and how to apply them in daily life.',
                  ),
                  _buildRecommendationItem(
                    'Wellness App: Calm',
                    'An app offering guided meditations, sleep stories, and breathing programs.',
                  ),
                  _buildRecommendationItem(
                    'Wellness App: Moodpath',
                    'An app that helps track mood and provides tools to improve mental health.',
                  ),
                  _buildRecommendationItem(
                    'Stress Management Technique: Regular Exercise',
                    'Physical activity is a great way to manage stress and improve mood.',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecommendationItem(String title, String description) {
    return Card(
      color: MhColors.green,
      elevation: 3.5, // Adding shadow
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25), // Increasing the radius
      ),
      margin: EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(17.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: MhColors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 11),
            Text(
              description,
              style: TextStyle(
                color: MhColors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


