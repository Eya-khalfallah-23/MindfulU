import 'package:flutter/material.dart';


import '../../../../../common/widgets/widgets_login_signup/green_section.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class MhLoginHeader extends StatelessWidget {
  const MhLoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
                children: [
                  const MhGreenSection(),
                  const SizedBox(height: MhSizes.spaceBetweenSections),
                  Text(MhTexts.loginTitle,
                      style: Theme.of(context).textTheme.headlineMedium),
                  const SizedBox(height: MhSizes.sm),
                  Text(MhTexts.loginSubtitle,
                      style: Theme.of(context).textTheme.bodyMedium),
                ],
              );
  }
}

