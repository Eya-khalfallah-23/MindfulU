import 'package:flutter/material.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/helpers/helper_function.dart';
import 'package:get/get.dart';

import '../../../../utils/helpers/helper_functions.dart';
import '../../controllers/sign_up/signup_controller.dart';

class MhTermCondCheckBox extends StatelessWidget {
  const MhTermCondCheckBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = MhHelperFunctions.isDarkMode(context);
    final controller = SignupController.instance;

    return Row(
      children: [
        SizedBox(
            width: 24,
            height: 24,
            child: Obx(() => Checkbox(
                value: controller.privacyPolicy.value,
                onChanged: (value) => controller.privacyPolicy.value =
                    !controller.privacyPolicy.value))),
        const SizedBox(height: MhSizes.spaceBetweenItems),
        Text.rich(
          TextSpan(children: [
            TextSpan(
                text: '${MhTexts.iAgreeTo} ',
                style: Theme.of(context).textTheme.bodySmall),
            TextSpan(
                text: '${MhTexts.privacyPolicy} ',
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color: dark
                          ? MhColors.white
                          : const Color.fromARGB(255, 0, 7, 5),
                      decoration: TextDecoration.underline,
                      decorationColor:
                          dark ? MhColors.white : MhColors.blue,
                    )),
            TextSpan(
                text: '${"and "} ',
                style: Theme.of(context).textTheme.bodyMedium),
            TextSpan(
                text: '${MhTexts.termsOfUse} ',
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color: dark ? MhColors.white : MhColors.blue,
                      decoration: TextDecoration.underline,
                      decorationColor:
                          dark ? MhColors.white : MhColors.blue,
                    )),
          ]),
        )
      ],
    );
  }
}