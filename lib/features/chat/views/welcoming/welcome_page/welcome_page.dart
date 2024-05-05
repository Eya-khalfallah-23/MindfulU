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
              const SizedBox(height: MhSizes.spaceBetweenItems),
              
              const SizedBox(height: 57), // Ajouter une hauteur de séparation
              Container(
                width: 450,
                height: 350,
                alignment: Alignment.center,
                child: Image.asset(
                  
                  MhImages.chatbotpic1,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: MhSizes.spaceBetweenItems),
              const Text(
                "Talk To AI Chatbot",
                style: TextStyle(
                  color: MhColors.blue,
                  fontSize: 23,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: MhSizes.spaceBetweenItems /2),
              Container(
                width: MediaQuery.of(Get.context!).size.width*0.8,
                child: Text(
                  "You have no AI conversations. Get your mind healthy by starting a new one.",
                  style: TextStyle(
                    color: MhColors.blue.withOpacity(0.72),
                    fontSize: 16.5,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              
              const SizedBox(height: MhSizes.spaceBetweenSections * 1.25),
              ElevatedButton(
                  onPressed: () => Get.to(() => FirstConversation()),
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
