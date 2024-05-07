import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mentalhealth_app/features/auth/views/login/login.dart';

import '../../../exceptions/firebase_auth_exceptions.dart';
import '../../../exceptions/firebase_exceptions.dart';
import '../../../exceptions/format_exceptions.dart';
import '../../../exceptions/platform_exceptions.dart';
import '../../../features/auth/views/onboarding/onboarding.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;


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

    deviceStorage.writeIfNull('isFirstTime4', true);
    deviceStorage.read('isFirstTime4') != true
        ? Get.offAll(() => const LoginScreen())
        : Get.offAll(const IntroductionAnimationScreen()); 
  }

  /* --------------------------- Email & Password sign-in --------------------------- */

  /// [EmailAuthentication] - Register
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
     } on FirebaseAuthException catch (e) {
       throw MhFirebaseAuthException(e.code).message;
     } on FirebaseException catch (e) {
       throw MhFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const MhFormatException();
    } on PlatformException catch (e) {
      throw MhPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again!';
    }
  }
}
