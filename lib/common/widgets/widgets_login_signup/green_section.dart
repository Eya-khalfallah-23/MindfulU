import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../custom_shapes/containers/circle_container.dart';


class MhGreenSection extends StatelessWidget {
  const MhGreenSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      
      padding: const EdgeInsets.all(0),
      child: SizedBox(
        height: 150,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            const Positioned(
                top: -400,
                child: MhCircleContainer(
                    width: 550,
                    height: 550,
                    radius: 550,
                    backgroundColor: MhColors.green)),
            Positioned(top: 50,child: Image.asset(MhImages.appLogo , width: 110))
            //MhCircleContainer(backgroundColor: MhColors.light.withOpacity(0.1) ),
          ],
        ),
      ),
    );
  }
}