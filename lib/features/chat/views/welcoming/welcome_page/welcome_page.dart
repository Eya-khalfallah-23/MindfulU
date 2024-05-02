import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mentalhealth_app/features/chat/views/welcoming/first_conversation/first_conversation.dart';
import 'package:mentalhealth_app/utils/constants/colors.dart';
import 'package:mentalhealth_app/utils/constants/image_strings.dart';
import 'package:mentalhealth_app/utils/constants/sizes.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(37),
          child: Column(
            children: [
              const SizedBox(height: MhSizes.lg),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Mindful AI Chatbot",
                    style: TextStyle(
                      color: MhColors.blue,
                      fontSize: 21,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 57), // Ajouter une hauteur de séparation
              Container(
                width: 400,
                height: 350,
                alignment: Alignment.center,
                child: Image.asset(
                  width: 390,
                  height: 330,
                  MhImages.chatbotpic1,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: MhSizes.xl),
              const Text(
                "Talk To AI Chatbot",
                style: TextStyle(
                  color: MhColors.blue,
                  fontSize: 23,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: MhSizes.lg),
              Text(
                "     You have no AI conversations. Get your",
                style: TextStyle(
                  color: MhColors.blue.withOpacity(0.72),
                  fontSize: 16.5,
                ),
              ),
              Text(
                "       mind healthy by starting a new one.",
                style: TextStyle(
                  color: MhColors.blue.withOpacity(0.72),
                  fontSize: 16.5,
                ),
              ),
              const SizedBox(height: 33),
              ElevatedButton(
                  onPressed: () => Get.to(() => const FirstConversation()),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(MhColors.orange)),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("New Conversation", style: TextStyle(fontSize: 19)),
                      SizedBox(width: MhSizes.md),
                      Icon(
                        Icons.add,
                        size: 30,
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
