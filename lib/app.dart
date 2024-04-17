import 'package:flutter/material.dart';
import 'package:mentalhealth_app/features/auth/views/login/login.dart';
import 'package:mentalhealth_app/utils/theme/theme.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MentalHealth',
      themeMode: ThemeMode.system,
      theme: MentalHAppTheme.lightTheme,
      darkTheme: MentalHAppTheme.darkTheme,
      home: const LoginScreen(),
    );
  }
}
