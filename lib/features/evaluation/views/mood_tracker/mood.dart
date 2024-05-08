import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mentalhealth_app/common/widgets/appbar/custom_appbar.dart';
import 'package:mentalhealth_app/utils/constants/image_strings.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../evaluations/tests.dart';

class MoodSelectionScreen extends StatefulWidget {
  const MoodSelectionScreen({super.key});

  @override
  _MoodSelectionScreenState createState() => _MoodSelectionScreenState();
}

class _MoodSelectionScreenState extends State<MoodSelectionScreen> {
  String? selectedMood;

  final List<Map<String, String>> moodOptions = [
    {'name': 'Happy', 'image': MhImages.happy},
    {'name': 'Sad', 'image': MhImages.sad},
    {'name': 'Excited', 'image': MhImages.excited},
    {'name': 'Angry', 'image': MhImages.angry},
    {'name': 'Calm', 'image': MhImages.calm},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:CustomAppBar(
        title: const Text('Select Your Mood', style: TextStyle(color: MhColors.blue),),
        
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'How are feeling today !',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: MhSizes.spaceBetweenSections * 2),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 16.0,
              runSpacing: 16.0,
              children: moodOptions
                  .map(
                    (mood) => MoodButton(
                      mood: mood,
                      isSelected: selectedMood == mood['name'],
                      onPressed: () {
                        setState(() {
                          selectedMood = mood['name'];
                        });
                      },
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 24.0),
            const SizedBox(height: MhSizes.spaceBetweenItems),
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              child: ElevatedButton(
                onPressed: selectedMood != null
                    ? () => _startQuestionnaire(context)
                    : null,
                child: const Text('Start Questionnaire'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to navigate to EvaluationPage with selected mood
  void _startQuestionnaire(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: MhColors.white,
          title: Text('Choose a Test', style: TextStyle(color: MhColors.blue),),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _buildTestOption(context, 'Generalized Anxiety Disorder 7-item Scale(GAD-7)', selectedMood!),
                _buildTestOption(context, 'Patient Health Questionnaire-9(PHQ-9)', selectedMood!),
                _buildTestOption(context, 'Perceived Stress Scale (PSS)', selectedMood!),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTestOption(BuildContext context, String text, String userMood) {
    return ListTile(
      title: Text(text, style: TextStyle(color: MhColors.darkerGrey),),
      onTap: () {
        Navigator.of(context).pop();
        if (text == 'GAD-7') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => TestAPage(userMood: userMood),
            ),
          );
        } else if (text == 'PHQ-9') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => TestBPage(userMood: userMood),
            ),
          );
        } else if (text == 'Perceived Stress Scale (PSS)') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => TestCPage(userMood: userMood),
            ),
          );
        }
      },
    );
  }
}

class MoodButton extends StatelessWidget {
  final Map<String, String> mood;
  final bool isSelected;
  final VoidCallback onPressed;
  final double imageSize;

  const MoodButton({
    super.key,
    required this.mood,
    required this.isSelected,
    required this.onPressed,
    this.imageSize = 70.0,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: isSelected ? MhColors.orange : Colors.grey[200],
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          children: [
            SizedBox(
              width: imageSize,
              height: imageSize,
              child: Image.asset(
                mood['image']!,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              mood['name']!,
              style: TextStyle(
                fontSize: 18.0,
                color: isSelected ? Colors.white : MhColors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
