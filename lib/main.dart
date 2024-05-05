import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mentalhealth_app/firebase_options.dart';
import 'app.dart';
import 'data/repositories/auth/auth_repository.dart';

/// -- Entry point of Flutter App
Future<void> main() async {
  // Add Widgets Binding
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  // -- GetX Local Storage
  await GetStorage.init();

  // -- Await Native Splash until other items load
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // -- Initialize FireBase & Authentication Repository
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    ).then((FirebaseApp value) => Get.put(AuthenticationRepository()));
  } catch (e) {
    print('Failed to initialize Firebase: $e');
    // Handle initialization error gracefully (e.g., show error message, exit app)
    return;
  }

  // Load all the Material Design / Themes / Localization / Bindings
  runApp(const App());
}
