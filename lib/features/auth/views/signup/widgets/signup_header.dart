
import 'package:flutter/material.dart';


import '../../../../../common/widgets/widgets_login_signup/green_section.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class SignupHeader extends StatelessWidget {
  const SignupHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Green section
        const MhGreenSection(),
    
        const SizedBox(height: MhSizes.spaceBetweenItems),
    
        Text(MhTexts.signupTitle,
            style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: MhSizes.sm),
        
      ],
    );
  }
}
