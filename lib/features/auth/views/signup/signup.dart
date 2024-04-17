import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mentalhealth_app/features/auth/views/login/login.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import 'widgets/signup_form.dart';
import 'widgets/signup_header.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// Header
              const SignupHeader(),

              /// Form
              const SignupForm(),

              /// Sign In
              Row(
                mainAxisAlignment: MainAxisAlignment.center, 
              children: [
                // Don't have an account
                Text( "Already Have an account?",
                    style: Theme.of(context).textTheme.bodyLarge),
                const SizedBox(width: MhSizes.xs),

                // Sign In
                GestureDetector(
                  onTap: () => Get.to(()=> const LoginScreen()) ,
                  child: const Text(
                    MhTexts.signIn,
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                      decorationColor: MhColors.green,
                      color: MhColors.green,
                    ),
                  ),
                ),
              ])
            ],
          ),
        ),
      ),
    );
  }
}


