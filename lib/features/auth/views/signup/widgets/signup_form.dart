import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mentalhealth_app/features/auth/views/signup/verify_email.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Padding(
      padding: const EdgeInsets.symmetric(
          vertical: MhSizes.spaceBetweenSections,
          horizontal: MhSizes.spaceBtwInputFields),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           /// Username
           Text(MhTexts.username,
              style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: MhSizes.sm),
          SizedBox(
            height: 55,
            child: TextFormField(
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.user_edit),
                  labelText: MhTexts.usernameHint),
            ),
          ),
          const SizedBox(height: MhSizes.spaceBtwInputFields * 1.5), 
    
          /// Email
          Text(MhTexts.emailAdress,
              style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: MhSizes.sm),
          SizedBox(
            height: 55,
            child: TextFormField(
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct),
                  labelText: MhTexts.email),
            ),
          ),
          const SizedBox(height: MhSizes.spaceBtwInputFields * 1.5),
    
          /// School
          Text(MhTexts.school,
              style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: MhSizes.sm),
          SizedBox(
            height: 55,
            child: TextFormField(
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.school_rounded),
                  labelText: MhTexts.schoolHint),
            ),
          ),
          const SizedBox(height: MhSizes.spaceBtwInputFields * 1.5),
    
          /// Password
          Text(MhTexts.password,
              style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: MhSizes.sm),
          SizedBox(
            height: 55,
            child: TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                labelText: MhTexts.passwordHint,
                suffixIcon: Icon(Iconsax.eye_slash),
              ),
            ),
          ),
          //const SizedBox(height: MhSizes.spaceBtwInputFields * 1.5),
    
          /// Password Confirmation
          // Text(MhTexts.passwordConfirm,
          //     style: Theme.of(context).textTheme.titleLarge),
          // const SizedBox(height: MhSizes.sm),
          // SizedBox(
          //   height: 55,
          //   child: TextFormField(
          //     decoration: const InputDecoration(
          //       prefixIcon: Icon(Iconsax.password_check),
          //       labelText: MhTexts.passwordConfiHint,
          //       suffixIcon: Icon(Iconsax.eye_slash),
          //     ),
          //   ),
          // ),
          
    
          
          const SizedBox(height: MhSizes.spaceBetweenSections),
    
          /// Sign Up Button
          Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                 boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(20, 0, 0, 0),
                    spreadRadius:0,
                    blurRadius: 16,
                    offset: Offset(0, 8), // changes position of shadow
                  ),
                ]
              ),
              child: ElevatedButton(
                  onPressed: () => Get.to(() => const VerifyEmailScreen()),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Create Account"),
                      SizedBox(width: MhSizes.xs),
                      Icon(Icons.done)
                    ],
                  )))
        ],
          ),
    ),
    );
  }
}