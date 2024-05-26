import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:mentalhealth_app/features/chat/views/conversations/recent_chats/widgets/historique.dart';
import 'package:mentalhealth_app/features/chat/views/welcoming/first_conversation/first_conversation.dart';
import 'package:mentalhealth_app/utils/constants/colors.dart';
import 'package:mentalhealth_app/utils/constants/image_strings.dart';
import 'package:mentalhealth_app/utils/constants/sizes.dart';

import '../chatting_page/chatting_page.dart';

class RecentChats extends StatelessWidget {
  const RecentChats({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(20, 75, 52, 37),
              spreadRadius: 0,
              blurRadius: 16,
              offset: Offset(0, 8), // changes position of shadow
            ),
          ],
        ),
        child: ClipOval(
          child: FloatingActionButton(
            onPressed: () => Get.to(ChatScreen()),
            backgroundColor: MhColors.blue,
            child: Icon(
              FontAwesomeIcons.plus,
              color: MhColors.white,
              size: 30,
            ),
            heroTag: "custom_fab", // Provide a unique heroTag
            elevation: 15, // Add elevation to the FloatingActionButton
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
                        height: 220,
                        color: MhColors.purple,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 45,
                    child: Image.asset(
                      MhImages.appLogo,
                      width: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const Positioned(
                    top: 145,
                    child: Text(
                      'My AI Chats',
                      style: TextStyle(
                        fontSize: 31,
                        fontWeight: FontWeight.w700,
                        color: MhColors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomLeft,
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: const Text(
              "Recents",
              style: TextStyle(
                  color: MhColors.blue,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
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
                      date: DateTime.utc(2024, 5, 23),
                      hstate: "Sentiment d'inutilité",
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
                      date: DateTime.utc(2024, 5, 23),
                      hstate: 'Questions sur la santé mentale',
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
                      date: DateTime.utc(2024, 5, 23),
                      hstate: "Partage d'expérience sur l'anxiété",
                      nbMsg: 34,
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
                      date: DateTime.utc(2024, 5, 1),
                      hstate: "Conseils pour gérer le stress",
                      nbMsg: 23,
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
                      nbMsg: 12,
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
                      hstate: "Parler de l'estime de soi",
                      nbMsg: 30,
                    ),
                  ),
                ),
                // Répétez ce modèle pour les autres éléments Historique
              ],
            ),
          ),

          /* Container(
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
              onPressed: () => Get.to(() => FirstConversation()),
            ),
          ), */
        ],
      ),
    );
  }
}
