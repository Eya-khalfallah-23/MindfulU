import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mentalhealth_app/features/evaluation/views/evaluation_main/main_page.dart';
import 'package:mentalhealth_app/features/personalization/views/profile/profile.dart';
import 'package:mentalhealth_app/utils/constants/colors.dart';
import 'package:mentalhealth_app/utils/helpers/helper_functions.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = MhHelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          backgroundColor: darkMode ? MhColors.dark : MhColors.white,
          indicatorColor: darkMode
              ? MhColors.light.withOpacity(0.1)
              : MhColors.dark.withOpacity(0.1),
          destinations: const [
            NavigationDestination(
                icon: Icon(Icons.contacts_outlined, color: MhColors.green),
                label: 'Contact'),
            NavigationDestination(
              icon: Icon(Iconsax.activity, color: MhColors.green),
              label: 'Evaluation',
            ),
            NavigationDestination(
                icon: Icon(Iconsax.message, color: MhColors.green),
                label: 'Chatbot'),
            NavigationDestination(
                icon: Icon(
                  Iconsax.user,
                  color: MhColors.green,
                ),
                label: 'Profile'),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    Container(color: Colors.purple),
    const EvaluationMain(),
    Container(color: Colors.yellow),
    const UserProfile(),
  ];
}
