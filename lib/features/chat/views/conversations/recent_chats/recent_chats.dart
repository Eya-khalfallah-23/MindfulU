import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mentalhealth_app/features/chat/views/conversations/recent_chats/widgets/historique.dart';
import 'package:mentalhealth_app/features/chat/views/welcoming/first_conversation/first_conversation.dart';
import 'package:mentalhealth_app/utils/constants/colors.dart';
import 'package:mentalhealth_app/utils/constants/image_strings.dart';
import 'package:mentalhealth_app/utils/constants/sizes.dart';

class RecentChats extends StatelessWidget {
  const RecentChats({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: SizedBox(
              height: 252,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Positioned(
                    top: 0,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(65),
                        bottomRight: Radius.circular(65),
                      ),
                      child: Container(
                        width: 416,
                        height: 240,
                        color: MhColors.purple,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 147,
                    top: 45,
                    child: Image.asset(
                      MhImages.appLogo,
                      width: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const Positioned(
                    left: 120,
                    top: 145,
                    child: Text(
                      'My AI Chats',
                      style: TextStyle(
                        fontSize: 31,
                        fontWeight: FontWeight.w700,
                        color: MhColors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: MhSizes.spaceBetweenSections / 3),
          Container(
            alignment: Alignment.bottomLeft,
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: const Text(
              "Recents",
              style: TextStyle(
                  color: MhColors.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            ),
          ),
          const SizedBox(height: MhSizes.defaultSpace),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(
                  horizontal: 14), // Espace pour le bouton en bas
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Container(
                    width:
                        300, // Largeur personnalisée pour l'élément Historique
                    child: Historique(
                      date: DateTime.utc(2024, 4, 15),
                      hstate: 'Recent Breakup. Felt sad and..',
                      nbMsg: 80,
                    ),
                  ),
                ),
                const SizedBox(height: MhSizes.defaultSpace),
                SizedBox(
                  width: double.infinity,
                  child: Container(
                    width:
                        300, // Largeur personnalisée pour l'élément Historique
                    child: Historique(
                      date: DateTime.utc(2024, 3, 23),
                      hstate: 'Recent Breakup. Felt sad and..',
                      nbMsg: 55,
                    ),
                  ),
                ),
                const SizedBox(height: MhSizes.defaultSpace),
                SizedBox(
                  width: double.infinity,
                  child: Container(
                    width:
                        300, // Largeur personnalisée pour l'élément Historique
                    child: Historique(
                      date: DateTime.utc(2024, 2, 7),
                      hstate: 'Recent Breakup. Felt sad and..',
                      nbMsg: 100,
                    ),
                  ),
                ),
                const SizedBox(height: MhSizes.defaultSpace),
                SizedBox(
                  width: double.infinity,
                  child: Container(
                    width:
                        300, // Largeur personnalisée pour l'élément Historique
                    child: Historique(
                      date: DateTime.utc(2024, 2, 7),
                      hstate: 'Recent Breakup. Felt sad and..',
                      nbMsg: 100,
                    ),
                  ),
                ),
                const SizedBox(height: MhSizes.defaultSpace),
                SizedBox(
                  width: double.infinity,
                  child: Container(
                    width:
                        300, // Largeur personnalisée pour l'élément Historique
                    child: Historique(
                      date: DateTime.utc(2024, 2, 7),
                      hstate: 'Recent Breakup. Felt sad and..',
                      nbMsg: 100,
                    ),
                  ),
                ),
                const SizedBox(height: MhSizes.defaultSpace),
                SizedBox(
                  width: double.infinity,
                  child: Container(
                    width:
                        300, // Largeur personnalisée pour l'élément Historique
                    child: Historique(
                      date: DateTime.utc(2024, 2, 7),
                      hstate: 'Recent Breakup. Felt sad and..',
                      nbMsg: 100,
                    ),
                  ),
                ),
                // Répétez ce modèle pour les autres éléments Historique
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 35),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40), color: MhColors.blue),
            height: 65,
            width: 65,
            child: IconButton(
              icon: const Icon(
                size: 43,
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () => Get.to(() => const FirstConversation()),
            ),
          ),
        ],
      ),
    );
  }
}
