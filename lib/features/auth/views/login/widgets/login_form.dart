import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mentalhealth_app/navigation_menu.dart';
import 'package:mentalhealth_app/utils/validators/validation.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../controllers/login/login_controller.dart';

class MhLoginForm extends StatelessWidget {
  const MhLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Form(
      //key: controller.loginFormKey,
        child: Padding(
      padding: const EdgeInsets.symmetric(
          vertical: MhSizes.spaceBetweenSections,
          horizontal: MhSizes.spaceBtwInputFields),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Email
          Text(MhTexts.emailAdress,
              style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: MhSizes.sm),
          SizedBox(
            height: 55,
            child: TextFormField(
              controller: controller.email,
              validator: (value) => MhValidator.validateEmail(value),
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: MhTexts.email),
            ),
          ),
          const SizedBox(height: MhSizes.spaceBtwInputFields * 1.5),

          /// Password
          Text(MhTexts.password, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: MhSizes.sm),
          SizedBox(
            height: 55,
            child: Obx(
              () => TextFormField(
                controller: controller.password,
                validator: (value) => MhValidator.validateEmptyText(MhTexts.password, value),
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Iconsax.password_check),
                  labelText: MhTexts.passwordHint,
                  suffixIcon: IconButton(
                    onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                    icon:Icon( controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: MhSizes.spaceBtwInputFields),

          /// Remember Me
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            /// Remember Me
            Row(children: [
              SizedBox(
                  width: 24,
                  height: 24,
                  child: Obx(() => Checkbox(value: controller.rememberMe.value, onChanged: (value) => controller.rememberMe.value = !controller.rememberMe.value))),
              const Text(MhTexts.rememberMe),
            ]),
          ]),
          const SizedBox(height: MhSizes.spaceBetweenItems),

          /// Sign In Button
          Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(20, 0, 0, 0),
                    spreadRadius: 0,
                    blurRadius: 16,
                    offset: Offset(0, 8), // changes position of shadow
                  ),
                ],
              ),
              child: ElevatedButton(
                  onPressed: () => controller.emailAndPasswordSignIn(),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(MhTexts.signIn),
                      SizedBox(width: MhSizes.xs),
                      Icon(Icons.arrow_right_alt_rounded)
                    ],
                  )))
        ],
      ),
    ));
  }
}
