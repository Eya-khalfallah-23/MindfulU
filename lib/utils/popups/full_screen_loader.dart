import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/widgets/loaders/animation_loader.dart';
import '../constants/colors.dart';
import '../helpers/helper_functions.dart';

/// A utility class for managing a full-screen loading dialog
class MhFullScreenLoader {
  /// Open a full-screen loading dialog with a given text and animation
  /// This method doesn't return anything
  ///
  /// Parameters:
  ///  - text: The text to be displayed in the loading dialog
  ///  - animation: The lottie animation to be shown
static void openLoadingDialog(String text, String animation) {
  showDialog(
    context: Get.overlayContext!,
    barrierDismissible: false,
    builder: (_) => PopScope(
      canPop: false,
      child: Container(
        color: MhHelperFunctions.isDarkMode(Get.context!)
            ? MhColors.dark
            : MhColors.white,
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView( // Wrap the Column with SingleChildScrollView
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 250),
              MhAnimationLoaderWidget(text: text, animation: animation),
            ],
          ),
        ),
      ),
    ),
  );
}


  /// Stop The currently open loading dialog
  /// This method doesn't return anything
  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop(); // close dialog using the navigator
  }
}