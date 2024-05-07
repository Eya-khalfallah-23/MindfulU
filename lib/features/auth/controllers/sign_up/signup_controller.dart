import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/repositories/auth/auth_repository.dart';
import '../../../../data/repositories/auth/user/user_repository.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/helpers/loaders.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../models/user_model.dart';
import '../../views/signup/verify_email.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

   /// Variables
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final userName = TextEditingController();
  final password = TextEditingController();
  final school = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  /// --- SIGN UP
  void signup() async {
    try {
      // start loading
      MhFullScreenLoader.openLoadingDialog(
          'We are processing your information...', MhImages.loadingScreen);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        MhFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!signupFormKey.currentState!.validate()) {
        MhFullScreenLoader.stopLoading();
        return;
      }

      // Privacy Policy Check
      if (!privacyPolicy.value) {
        MhFullScreenLoader.stopLoading();
        MhLoaders.warningSnackBar(
            title: 'Accept Privacy Policy',
            message:
                " In order to create account, you must have to read and accept the Privacy Policy & Terms of Use of MindfulU");
      }

      // Register user in the firebase authentication & save user data in the firebase
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      // Save authenticated user data in the Firebase Firestore
      final newUser = UserModel(
          id: userCredential.user!.uid,
          userName: userName.text.trim(),
          email: email.text.trim(),
          school: school.text.trim(),
          profilePicture: '');

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      // Remove Loader
      MhFullScreenLoader.stopLoading();

      // Show Success Message
      MhLoaders.successSnackBar(
          title: 'Congratulations',
          message: 'Your account has been created! Verify Email to continue.');

       // Move to Verify Email Screen
      Get.to(() => VerifyEmailScreen(
           email: email.text.trim(),
          )); 
    } catch (e) {
      // Remove Loader
      MhFullScreenLoader.stopLoading();

      // Show some generic error to the user
      MhLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
