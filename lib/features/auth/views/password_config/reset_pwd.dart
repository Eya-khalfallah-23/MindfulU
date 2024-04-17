import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/helpers/helper_function.dart';
import '../login/login.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(CupertinoIcons.clear))
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(MhSizes.defaultSpace),
            child: Column(
              children: [
                ///Image
                Image(
                  image:
                      const AssetImage(MhImages.deliveredEmail),
                  width: MhHelperFunction.screenWidth() * 0.6,
                ),

                const SizedBox(
                  height: MhSizes.spaceBetweenSections,
                ),

                ///Title&Subtitle
                Text(MhTexts.changePasswordTitle,
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center),
                const SizedBox(height: MhSizes.spaceBetweenItems),
                Text(MhTexts.changePasswordSubtitle,
                    style: Theme.of(context).textTheme.labelMedium,
                    textAlign: TextAlign.center),
                const SizedBox(height: MhSizes.spaceBetweenSections),

                ///Buttons
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () => Get.off(() => const LoginScreen()),
                        child: const Text(MhTexts.done))),
                const SizedBox(height: MhSizes.spaceBetweenItems),
                SizedBox(
                    width: double.infinity,
                    child: TextButton(
                        onPressed: () {},
                        child: const Text(MhTexts.resendEmail))),
              ],
            ),
          ),
        ));
  }
}