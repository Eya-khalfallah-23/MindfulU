import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mentalhealth_app/common/widgets/custom_shapes/curved_edges/curved_edges.dart';
import 'package:mentalhealth_app/utils/constants/image_strings.dart';

import '../../../../common/widgets/custom_shapes/containers/circle_container.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../controllers/test_controller.dart';
import '../mood_tracker/mood.dart';
import 'widgets/card_histo.dart';

class EvaluationMain extends StatelessWidget {
  EvaluationMain({super.key});
  

  Color hexToColor(String hexColor) {
  // Remove the leading '#' character if present
  if (hexColor.startsWith('#')) {
    hexColor = hexColor.substring(1);
  }

  // Parse the hexadecimal color code and return a Color object
  return Color(int.parse(hexColor, radix: 16) + 0xFF000000);
}

final Map<String, IconData> moodDictionary = {
    'Happy': FontAwesomeIcons.solidSmile,
    'Excited': FontAwesomeIcons.solidLaughSquint,
    'Sad': FontAwesomeIcons.solidFrownOpen,
    'Calm': FontAwesomeIcons.solidSmileBeam,
    'Angry': FontAwesomeIcons.solidAngry
  };

  @override
  Widget build(BuildContext context) {
    final testcontroller = Get.put(TestController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(alignment: Alignment.topCenter, children: [
              ClipPath(
                clipper: ArcClipper(),
                child: Container(
                  color: MhColors.purple,
                  padding: const EdgeInsets.all(0),
                  child: SizedBox(
                    height: 350,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        /// Logo
                        Positioned(
                            top: 30,
                            child: Image.asset(
                              MhImages.appLogo,
                              width: 110,
                            )),

                        /// Title
                        Positioned(
                            top: 140,
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.85,
                              child: const Text(
                                  "I hope everything is alright let's take a test!",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.w600,
                                    color: MhColors.light,
                                  )),
                            )),

                        /// White circles
                        Positioned(
                            top: -80,
                            right: -150,
                            child: MhCircleContainer(
                                backgroundColor:
                                    MhColors.light.withOpacity(0.1))),
                        Positioned(
                            top: 80,
                            right: -200,
                            child: MhCircleContainer(
                                backgroundColor:
                                    MhColors.light.withOpacity(0.1))),
                        //MhCircleContainer(backgroundColor: MhColors.light.withOpacity(0.1) ),
                      ],
                    ),
                  ),
                ),
              ),

              /// Button
              Positioned(
                top: 270,
                child: GestureDetector(
                  onTap: () => Get.to(() => const MoodSelectionScreen()),
                  child: Container(
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(20, 75, 52, 37),
                          spreadRadius: 0,
                          blurRadius: 16,
                          offset: Offset(0, 8), // changes position of shadow
                        ),
                      ],
                    ),
                    child: const MhCircleContainer(
                      width: 60,
                      height: 60,
                      radius: 60,
                      backgroundColor: MhColors.blue,
                      child: Icon(
                        FontAwesomeIcons.plus,                       color: MhColors.white,
                        size: 35,
                        weight: 100,
                      ),
                    ),
                  ),
                ),
              ),
            ]),

            const SizedBox(height: MhSizes.spaceBtwInputFields),
            Container(
              width: MediaQuery.of(context).size.width * 0.85,
              child: Row(
                children: [
                  Text('Recents',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: MhColors.blue,
                                ), textAlign: TextAlign.left,),
                ],
              ),
            ),
            const SizedBox(height: MhSizes.spaceBetweenItems),
            /// Cards
            Obx(
              () => Column(
                children: testcontroller.testResults.map((test) {
                  return MhCardHisto(
                    date: test.date,
                    hstate: test.testResult,
                    percentage: test.score,
                    testName: test.testName,
                    nbsugg: test.nbsug,
                    color: hexToColor(test.color),
                    icon: moodDictionary[test.mood],
                    mood: test.mood,
                  );
                }).toList(),

              ),
            ),],
        ),
      ),
    );
  }
}
