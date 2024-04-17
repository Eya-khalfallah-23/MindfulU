import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mentalhealth_app/features/auth/views/password_config/forget_pwd.dart';
import 'package:mentalhealth_app/features/auth/views/signup/signup.dart';
import 'package:mentalhealth_app/utils/constants/colors.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import 'widgets/login_form.dart';
import 'widgets/login_header.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// logo
              const MhLoginHeader(),

              /// Form
              const MhLoginForm(),

              /// Sign Up
              Row(
                mainAxisAlignment: MainAxisAlignment.center, 
              children: [
                // Don't have an account
                Text(MhTexts.verifAcc,
                    style: Theme.of(context).textTheme.bodyLarge),
                const SizedBox(width: MhSizes.xs),

                // Sign Up
                GestureDetector(
                  onTap: () => Get.to(() => const SignupScreen()) 
                    // Navigate to another screen or perform an action
                  ,
                  child: const Text(
                    MhTexts.signUp,
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                      decorationColor: MhColors.green,
                      color: MhColors.green,
                    ),
                  ),
                ),
              ]),

              const SizedBox(height: MhSizes.sm),

              /// Forgot Password
              GestureDetector(
                onTap: () => Get.to(() => const ForgetPassword()),
                child: const Text(
                  MhTexts.forgotPassword,
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.underline,
                    decorationColor: MhColors.orange,
                    color: MhColors.orange,
                  ),
                ),
              ),

              /// Forgot Password
              ///TextButton(
              /// onPressed: () {}, style: TextButton.styleFrom( padding: const EdgeInsets.all(0)),child: const Text(MhTexts.forgotPassword))
            ],
          ),
        ),
      ),
    );
  }
}

