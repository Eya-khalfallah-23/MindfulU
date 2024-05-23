import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:mentalhealth_app/features/evaluation/views/result/recommendations.dart';
import 'package:mentalhealth_app/utils/constants/image_strings.dart';
import 'package:mentalhealth_app/utils/constants/sizes.dart';
import 'package:uuid/uuid.dart';
import '../../../../common/widgets/custom_shapes/containers/circle_container.dart';
import '../../../../data/repositories/auth/auth_repository.dart';
import '../../../../utils/constants/colors.dart';
import '../../controllers/test_controller.dart';
import '../../models/test_model.dart';
import '../evaluations/widgets/results.dart';

class ResultPage extends StatefulWidget {
  final String testName;
  final int totalScore;
  final String userMood;
  const ResultPage(
      {super.key,
      required this.testName,
      required this.totalScore,
      required this.userMood});

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  var testController = Get.put(TestController());

  @override
  void initState() {
    super.initState();
    // Initialize the test controller using GetX's Get.find() method
    testController = Get.find<TestController>();
    // Save the test result automatically when the page is first displayed
    _saveTestResult();
  }
  
  final Map<String, IconData> moodDictionary = {
    'Happy': FontAwesomeIcons.solidSmile,
    'Excited': FontAwesomeIcons.solidLaughSquint,
    'Sad': FontAwesomeIcons.solidFrownOpen,
    'Calm': FontAwesomeIcons.solidSmileBeam,
    'Angry': FontAwesomeIcons.solidAngry
  };

  Widget build(BuildContext context) {
    Color bgColor = getBackgroundColor(widget.testName, widget.totalScore);
    String desc = getTextResult(widget.testName, widget.totalScore);
    Object nbrsugg = getNbrSugg(widget.testName, widget.totalScore);

    return Scaffold(
      body: Container(
        width: double.infinity,
        color: bgColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Your Score',
              style: TextStyle(
                  fontSize: 35,
                  color: MhColors.white,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: MhSizes.spaceBetweenItems),
            SizedBox(
              height: 270,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  MhCircleContainer(
                      width: 250,
                      height: 250,
                      backgroundColor: MhColors.white.withOpacity(0.3)),
                  MhCircleContainer(
                      width: 230,
                      height: 230,
                      backgroundColor: MhColors.white.withOpacity(0.3)),
                  const MhCircleContainer(
                      width: 205, height: 205, backgroundColor: MhColors.white),
                  Text(
                    '${widget.totalScore}',
                    style: TextStyle(
                        fontSize: 90,
                        color: bgColor,
                        fontWeight: FontWeight.w700),
                  ),
                  Positioned(
                    top: 210,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(20, 75, 52, 37),
                                spreadRadius: 0,
                                blurRadius: 16,
                                offset:
                                    Offset(0, 8), // changes position of shadow
                              ),
                            ],
                          ),
                          child: const MhCircleContainer(
                              width: 55,
                              height: 55,
                              backgroundColor: MhColors.white),
                        ),
                        MhCircleContainer(
                          width: 42,
                          height: 42,
                          backgroundColor: bgColor,
                          child: const Image(
                            image: AssetImage(MhImages.iconVal),
                            height: 7,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: MhSizes.spaceBetweenSections),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Text(
                desc,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 30,
                  color: MhColors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: MhSizes.spaceBetweenSections),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    const Icon(
                      FontAwesomeIcons.solidLightbulb,
                      color: MhColors.white,
                      size: 15,
                    ),
                    const SizedBox(width: 1),
                    Text(
                      '$nbrsugg' '  Suggestions',
                      style: const TextStyle(
                        color: MhColors.white,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
                const SizedBox(width: MhSizes.spaceBetweenSections),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(width: MhSizes.spaceBetweenItems / 8),
                    Icon(
                      moodDictionary[widget.userMood],
                      color: MhColors.white,
                      size: 15,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      widget.userMood,
                      style: const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                        color: MhColors.white,
                      ),
                    ),
                    const SizedBox(width: MhSizes.spaceBetweenItems / 4),
                  ],
                ),
              ],
            ),
            const SizedBox(height: MhSizes.spaceBetweenSections),
            Container(
                width: MediaQuery.of(context).size.width * 0.75,
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(5, 75, 52, 37),
                      spreadRadius: 0,
                      blurRadius: 16,
                      offset: Offset(0, 4), // changes position of shadow
                    ),
                  ],
                ),
                child: ElevatedButton(
                    onPressed:  () => Get.to(() =>  RecommendationPage()),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(MhColors.white),
                      surfaceTintColor:
                          MaterialStateProperty.all<Color>(Colors.transparent),
                      shadowColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(45, 75, 52, 37),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("See My Result", style: TextStyle(color: bgColor)),
                        const SizedBox(width: MhSizes.xs),
                        Icon(
                          Icons.arrow_right_alt_rounded,
                          color: bgColor,
                        ),
                      ],
                    )))
          ],
        ),
      ),
    );
  }
  void _saveTestResult() {
    // Create a TestModel instance with the test data
    var uuid = const Uuid().v4();
    TestModel testModel = TestModel(
      id: uuid,
      testResult: getTextResult(widget.testName, widget.totalScore),
      testName: widget.testName,
      score: widget.totalScore,
      mood: widget.userMood,
      date: DateTime.now(),
      nbsug: getNbrSugg(widget.testName, widget.totalScore),
      color: '#${getBackgroundColor(widget.testName, widget.totalScore).value.toRadixString(16).substring(2)}',
    );

    // Call the addTestResult method of the test controller to save the test result
    testController.addTestResult(testModel);
  }
}
