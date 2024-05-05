import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mentalhealth_app/common/widgets/custom_shapes/curved_edges/curved_edges.dart';
import 'package:mentalhealth_app/utils/constants/image_strings.dart';

import '../../../../common/widgets/custom_shapes/containers/circle_container.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../mood_tracker/mood.dart';
import 'widgets/card_histo.dart';

class EvaluationMain extends StatelessWidget {
  const EvaluationMain({super.key});


  @override
  Widget build(BuildContext context) {
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
                        Iconsax.add,
                        color: MhColors.white,
                        size: 60,
                        weight: 100,
                      ),
                    ),
                  ),
                ),
              ),
            ]),

            const SizedBox(height: MhSizes.spaceBetweenSections),

            /// Cards
            MhCardHisto(date: DateTime.utc(2024, 3, 23),hstate: 'Healthy',percentage: 80,nbsugg: 3,color: MhColors.green,icon: Icons.emoji_emotions_rounded,mood: 'Overjoyed'),

            const SizedBox(height: MhSizes.spaceBetweenItems),

            MhCardHisto(date: DateTime.utc(2024, 3, 20),hstate: 'Mild Anxiety',percentage: 41,nbsugg: 10,color: MhColors.orange,icon: Iconsax.emoji_sad5,mood: 'Sad'),

            const SizedBox(height: MhSizes.spaceBetweenItems),

            MhCardHisto(date: DateTime.utc(2024, 3, 23),hstate: 'Depressed',percentage: 16,nbsugg: 3,color: const Color(0xFFB8C1EC),icon: Iconsax.emoji_sad5,mood: 'Depressed'),
          ],
        ),
      ),
    );
  }
}
