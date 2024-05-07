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
import '../../../features/auth/views/signup/verify_email.dart';
import '../../../navigation_menu.dart';

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
 /// Function to show relevant screen
  screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      // if user is logged in
      if (user.emailVerified) {
        // if user email is verified, navigate to the navigation menu
        Get.offAll(() => const NavigationMenu());
      } else {
        // if the user's mail is not verified, navigate to verify email screen
        Get.offAll(() => VerifyEmailScreen(
              email: _auth.currentUser?.email,
            ));
      }
    } else {
      // Local Storage
      deviceStorage.writeIfNull('isFirstTime', true);

      // check if it's the first time launching the app
      deviceStorage.read('isFirstTime') != true
          ? Get.offAll(() => const LoginScreen())
          : Get.offAll(const IntroductionAnimationScreen());
    }
  }

//: Get.offAll(const IntroductionAnimationScreen());
  /* --------------------------- Email & Password sign-in --------------------------- */

  /* --------- Email & Password sign-in --------- */

  /// [EmailAuthentication] - LogIn
  Future<UserCredential> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
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

  /// [EmailAuthentication] - Mail Verification
  Future<void> sendEmailVerification() async {
    try {
       await _auth.currentUser?.sendEmailVerification();
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

  /* --------- ./end Federated identity & social sign in --------- */

  /// [LogoutUser] - Valid for any authentication
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
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
