import 'package:flutter/material.dart';
import 'package:mentalhealth_app/utils/constants/colors.dart';
import 'package:mentalhealth_app/utils/theme/theme.dart';
import 'package:get/get.dart';

import 'features/auth/views/onboarding/onboarding.dart';

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
      home: const IntroductionAnimationScreen(),
      //home: const Scaffold(backgroundColor: MhColors.green, body: Center(child: CircularProgressIndicator(color: MhColors.white,),),),
    );
  }
}
