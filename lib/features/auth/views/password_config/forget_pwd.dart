import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import 'reset_pwd.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(MhSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Heading
            Text(MhTexts.forgotPassword,
                style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: MhSizes.spaceBetweenItems),
            Text(MhTexts.forgotPasswordSubtitle,
                style: Theme.of(context).textTheme.labelMedium),
            const SizedBox(height: MhSizes.spaceBetweenSections * 2),

            //Text field
            TextFormField(
              decoration: const InputDecoration(
                  labelText: MhTexts.email,
                  prefixIcon: Icon(Iconsax.direct_right)),
            ),
            const SizedBox(
              height: MhSizes.spaceBetweenItems,
            ),

            //Submit Button

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => Get.off(() => const ResetPassword()),
                  child: const Text(MhTexts.submit)),
            )
          ],
        ),
      ),
    );
  }
}