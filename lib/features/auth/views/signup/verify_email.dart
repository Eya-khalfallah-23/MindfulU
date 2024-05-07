import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:mentalhealth_app/data/repositories/auth/auth_repository.dart';
import 'package:mentalhealth_app/features/auth/controllers/sign_up/verify_email_controller.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/helpers/helper_function.dart';
import '../login/login.dart';
import '../../../../common/widgets/success_screen/success_screen.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => AuthenticationRepository.instance.logout(),
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
                image: const AssetImage(MhImages.deliveredEmail),
                width: MhHelperFunction.screenWidth() * 0.6,
              ),

              const SizedBox(
                height: MhSizes.spaceBetweenSections,
              ),

              ///Title&Subtitle

              Text(MhTexts.confirmEmail,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: MhSizes.spaceBetweenItems),
              Text(email ?? '',
                  style: Theme.of(context).textTheme.labelLarge,
                  textAlign: TextAlign.center),
              const SizedBox(height: MhSizes.spaceBetweenItems),
              Text(MhTexts.confirmEmailSubtitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: MhSizes.spaceBetweenSections),

              ///Buttons
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () => controller.checkEmailVerificationStatus(),
                      child: const Text(MhTexts.tContinue))),
              const SizedBox(height: MhSizes.spaceBetweenItems),
              SizedBox(
                  width: double.infinity,
                  child: TextButton(
                      onPressed: () => controller.sendEmailVerification() ,
                      child: const Text(MhTexts.resendEmail))),
            ],
          ),
        ),
      ),
    );
  }
}
