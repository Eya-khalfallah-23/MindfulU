import 'package:flutter/foundation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mentalhealth_app/features/auth/views/login/login.dart';

import '../../../features/auth/views/onboarding/onboarding.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// Variables
  final deviceStorage = GetStorage();

  /// Called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  /// Function to Show Relevent Screen
  screenRedirect() async {
    // Local Storage
    if (kDebugMode) {
      print('============= GET STORAGE =============');
      print(deviceStorage.read('isFirstTime2'));
    }

    deviceStorage.writeIfNull('isFirstTime3', true);
    /* deviceStorage.read('isFirstTime2') != true
        ? Get.offAll(() => const LoginScreen())
        : Get.offAll(const IntroductionAnimationScreen()); */
  }

  /* --------------------------- Email & Password sign-in --------------------------- */
}
