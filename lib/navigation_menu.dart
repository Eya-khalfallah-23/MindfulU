import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'package:mentalhealth_app/features/chat/views/welcoming/welcome_page/welcome_page.dart';
import 'package:mentalhealth_app/features/evaluation/views/evaluation_main/main_page.dart';
import 'package:mentalhealth_app/features/personalization/views/profile/profile.dart';
import 'package:mentalhealth_app/utils/constants/colors.dart';
import 'package:mentalhealth_app/utils/helpers/helper_functions.dart';

import 'features/chat/views/conversations/chatting_page/chatting_page.dart';
import 'features/chat/views/conversations/recent_chats/recent_chats.dart';
import 'features/personalization/views/contact/contacts.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = MhHelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(
        () => Container(
  decoration: BoxDecoration(
    color: darkMode ? MhColors.dark : MhColors.white,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(20.0),
      topRight: Radius.circular(20.0),
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 0,
        blurRadius: 16,
        offset: Offset(0, 8),
      ),
    ],
  ),
  child: NavigationBar(
    height: 80,
    elevation: 0,
    selectedIndex: controller.selectedIndex.value,
    onDestinationSelected: (index) =>
        controller.selectedIndex.value = index,
    backgroundColor: Colors.transparent,
    indicatorColor: darkMode
        ? MhColors.light.withOpacity(0.1)
        : MhColors.dark.withOpacity(0.1),
    destinations: const [
      NavigationDestination(
        icon: Icon(FontAwesomeIcons.solidAddressCard, color: MhColors.green),
        label: 'Contact',
      ),
      NavigationDestination(
        icon: Icon(FontAwesomeIcons.heartbeat, color: MhColors.green),
        label: 'Evaluation',
      ),
      NavigationDestination(
        icon: Icon(FontAwesomeIcons.commentMedical, color: MhColors.green),
        label: 'Chatbot',
      ),
      NavigationDestination(
        icon: Icon(
          FontAwesomeIcons.solidUser,
          color: MhColors.green,
        ),
        label: 'Profile',
      ),
    ],
  ),
),

        ),
      
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    ContactPage(),
    EvaluationMain(),
    //const ChatScreen(),
    const RecentChats(),
    const UserProfile(),
  ];
}

