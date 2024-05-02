import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mentalhealth_app/features/chat/views/conversations/recent_chats/recent_chats.dart';
import 'package:mentalhealth_app/utils/constants/colors.dart';
import 'package:mentalhealth_app/utils/constants/image_strings.dart';

class FirstConversation extends StatelessWidget {
  const FirstConversation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(20, 0, 0, 0),
                    spreadRadius: 0,
                    blurRadius: 15,
                    offset: Offset(0, -29), // changes position of shadow
                  ),
                ],
              ),
              child: SizedBox(
                height: 166,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Positioned(
                      top: 1,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(32.5),
                          bottomRight: Radius.circular(32.5),
                        ),
                        child: Container(
                          width: 415,
                          height: 125,
                          color: MhColors.white,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 10,
                      top: 50,
                      child: IconButton(
                        color: MhColors.blue,
                        icon: Icon(Icons.arrow_back_ios_new),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    const Positioned(
                      left: 63,
                      top: 60,
                      child: Text(
                        'Mindful IA Chatbot',
                        style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w700,
                          color: MhColors.blue,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),

            const SizedBox(height: 10), // Ajouter une hauteur de séparation
            Container(
              width: 430,
              height: 350,
              alignment: Alignment.center,
              child: Image.asset(
                width: 360,
                MhImages.chatbotpic2,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 15),
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 17,
                    vertical: 6.5), // Espacement interne pour le texte
                decoration: BoxDecoration(
                  border: Border.all(
                    color: MhColors.blue, // Couleur de la bordure
                    width: 1, // Épaisseur de la bordure
                  ),
                  borderRadius:
                      BorderRadius.circular(13), // Coins arrondis du rectangle
                ),
                child: const Text(
                  'Limitations',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14.8, // Taille de police
                    color: MhColors.blue, // Couleur du texte
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Limited knowledge',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 21.5, // Taille de police
                color: MhColors.blue, // Couleur du texte
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'No human being is perfect. So is ',
              style: TextStyle(
                color: MhColors.blue.withOpacity(0.73),
                fontSize: 16.5,
              ),
            ),
            Text(
              'chatbots. This chatbot knowledge is ',
              style: TextStyle(
                color: MhColors.blue.withOpacity(0.73),
                fontSize: 16.5,
              ),
            ),
            Text(
              'limited to 2024. ',
              style: TextStyle(
                color: MhColors.blue.withOpacity(0.73),
                fontSize: 16.5,
              ),
            ),

            Container(
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(20, 0, 0, 0),
                    spreadRadius: 0,
                    blurRadius: 15,
                    offset: Offset(0, 80), // changes position of shadow
                  ),
                ],
              ),
              child: SizedBox(
                height: 170,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Positioned(
                      top: 70,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(43),
                          topRight: Radius.circular(43),
                        ),
                        child: Container(
                          width: 420,
                          height: 180,
                          color: MhColors.white,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 21,
                      top: 100,
                      child: SizedBox(
                        height: 48,
                        child: Container(
                          width: 302, // Largeur fixe du champ de texte
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(
                                26), // Coins arrondis du rectangle
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelStyle: const TextStyle(
                                  color: MhColors.grey, fontSize: 16),
                              filled: true, // Permet de remplir l'arrière-plan
                              fillColor: Colors.grey[100],
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              labelText: "Tap to start chatting...",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 345,
                      top: 99,
                      child: IconButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                MhColors.orange)),
                        iconSize: 26,
                        color: MhColors.white,
                        icon: const Icon(Icons.arrow_right_alt_rounded),
                        onPressed: () => Get.to(() => const RecentChats()),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
