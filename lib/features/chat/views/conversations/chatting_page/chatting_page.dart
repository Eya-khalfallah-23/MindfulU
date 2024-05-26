import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../../../../../common/widgets/appbar/custom_appbar.dart';
import '../../../../../common/widgets/custom_shapes/containers/circle_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart'; // Importez la classe DateFormat

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController _userInput =
      TextEditingController(); // Controle de l'input de user
  final List<Message> _messages =
      []; // Liste des messages affichés dans le chat
  late ScrollController _scrollController; // Déclarez le ScrollController ici

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController(); // Initialisez le ScrollController
  }

  @override
  void dispose() {
    _scrollController
        .dispose(); // Assurez-vous de libérer du ScrollController lorsque vous n'en avez plus besoin (si on passe vers un autre ecran par exemple)
    super.dispose();
  }

  // Une méthode pour faire défiler la liste des messages vers le bas : quand un message est ajouté
  void scrollToBottom() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController
              .position.maxScrollExtent, // Scroll vers dernier message ajouté
          duration: Duration(milliseconds: 100), // Durée de scroll
          curve: Curves.easeOut, // Commence plus lent puis termine rapidement
        );
      }
    });
  }

  // Gestion du discussions
  Future<void> sendMessage([String? message]) async {
    String s = "";
    if (message == null) {
      message = _userInput.text;
      s = message; // Utilisez le texte tapé par l'utilisateur comme message par défaut
    } else {
      for (int i = 1; i < message.length; i++) {
        s += message[i];
      }
    }
    // Ajout du message de l'utilisateur
    setState(() {
      _messages.add(Message(
          isButton: false, isUser: true, message: s!, date: DateTime.now()));
    });
    // Envoi du message au serveur rasa
    final response = await http.post(
      Uri.parse(
          'https://74e2-196-224-22-89.ngrok-free.app/webhooks/rest/webhook'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'message': message,
      }),
    );
    // Prise en charge de la réponse
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      // Ajout de la réponse du chatbot
      setState(() {
        _messages.add(Message(
          isButton: false,
          isUser: false,
          message: jsonResponse[0]['text'] ?? "",
          date: DateTime.now(),
        ));
        // Traitement des boutons (si présents)
        if (jsonResponse[0].containsKey('buttons')) {
          for (var button in jsonResponse[0]['buttons']) {
            _messages.add(Message(
              isButton: true,
              isUser: false,
              message: button[
                  'title'], // Affichage du titre du bouton en tant que message
              date: DateTime.now(),
              buttons: [
                TextButton(
                  onPressed: () async {
                    await sendMessage("/${button['title'].toLowerCase()}");
                    // Ajouter le message de l'utilisateur au _messages
                  },
                  child: Text(button['title']),
                ),
              ],
            ));
          }
        }
      });
    } else {
      throw Exception('Failed to send message');
    }
    _userInput.clear(); // Vide le champ de texte après l'envoi du message
    scrollToBottom();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          'Chat Page',
          style: TextStyle(color: MhColors.blue),
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
// Affichage des messages dans l'écran
            Expanded(
              child: ListView.builder(
                controller:
                    _scrollController, // Utilisez le ScrollController ici
                reverse:
                    false, // Affiche les éléments de la liste de bas en haut
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[index];
                  return Messages(
                    isButton: message.isButton,
                    isUser: message.isUser,
                    message: message.message,
                    date: DateFormat('HH:mm').format(message.date),
                    buttons: message.buttons,
                    sendMessage:
                        (String) {}, // Passez la liste des boutons au widget Messages
                  );
                },
              ),
            ),
// Input de l'utilisateur
            Container(
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(20, 75, 52, 37),
                    spreadRadius: 0,
                    blurRadius: 16,
                    offset: Offset(0, -8), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(23.0), // Top-left corner radius
                  topRight: Radius.circular(23.0), // Top-right corner radius
                ),
                color: MhColors.white,
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  top: 15,
                  bottom: 15,
                  left: 10,
                  right: 10,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _userInput,
                        decoration: InputDecoration(
                          hintText: 'Type your message...',
                          filled: true,
                          fillColor: MhColors.light,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 15.0),
                          hintStyle: TextStyle(color: Colors.grey[400]),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MhSizes.spaceBetweenItems,
                    ),
                    MhCircleContainer(
                      width: 50,
                      height: 50,
                      radius: 50,
                      backgroundColor: MhColors.orange,
                      child: IconButton(
                          icon: Icon(
                            Icons.send,
                            color: MhColors.white,
                          ),
                          onPressed: sendMessage),
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

// Classe Message : message de l'utilisateur ou du chatbot (optionnellement avec des boutons)
class Message {
  final bool isButton;
  final bool isUser;
  final String message;
  final DateTime date;
  final List<Widget>? buttons; // Liste de widgets pour les boutons (facultatif)

  Message({
    required this.isButton,
    required this.isUser,
    required this.message,
    required this.date,
    this.buttons,
  });
}

// Affichage des messages avec la gestion des boutons (si présents)
class Messages extends StatelessWidget {
  final bool isButton;
  final bool isUser;
  final String message;
  final String date;
  final List<Widget>? buttons; // Liste de widgets pour les boutons (facultatif)
  final Function(String)
      sendMessage; // Fonction pour envoyer des messages au chatbot

  const Messages({
    Key? key,
    required this.isButton,
    required this.isUser,
    required this.message,
    required this.date,
    this.buttons,
    required this.sendMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isButton) {
      return _buildButtonMessage(context);
    } else {
      return _buildTextMessage(context);
    }
  }

  Widget _buildButtonMessage(BuildContext context) {
    return Container(
      width: 20,
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.symmetric(vertical: 15).copyWith(
        left: 10,
        right: 220,
      ),
      decoration: BoxDecoration(
        color: MhColors.orange, // Définir la couleur du conteneur à rose
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (buttons != null)
            ...buttons!.map((button) => _buildButton(button)).toList(),
        ],
      ),
    );
  }

  Widget _buildTextMessage(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(13),
      margin: EdgeInsets.symmetric(vertical: 13).copyWith(
        left: isUser ? 100 : 10,
        right: isUser ? 10 : 100,
      ),
      decoration: BoxDecoration(
        color: isUser ? MhColors.green : Color(0xFFD2CAC4),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          bottomLeft: isUser ? Radius.circular(15) : Radius.zero,
          topRight: Radius.circular(15),
          bottomRight: isUser ? Radius.zero : Radius.circular(15),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            message,
            style: TextStyle(
                fontSize: 16, color: isUser ? Colors.white : Color(0xFF817F7F)),
          ),
          Text(
            date,
            style: TextStyle(
                fontSize: 10, color: isUser ? Colors.white : Color(0xFF817F7F)),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(Widget button) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: 3), // Ajouter un espacement entre les boutons
      child: TextButton(
        onPressed: () {
          // Gérer le clic sur le bouton ici
          // Extraire le titre ou le payload du bouton (selon le format de réponse Rasa)
          final String buttonTitle = (button as TextButton)
              .child
              .toString()
              .replaceAll('Text(\'', '')
              .replaceAll('\')', '')
              .toLowerCase();
          // Envoyer un message à Rasa avec les informations du bouton (remplacez par votre logique réelle)
          sendMessage(
              "/$buttonTitle"); // Remplacez par l'envoi du message à Rasa
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(MhColors.orange),
          textStyle: MaterialStateProperty.all(
              TextStyle(fontSize: 25, color: Colors.white)),
          alignment: Alignment.center,
        ),
        child:
            button, // Utiliser le widget de bouton d'origine pour le contenu du texte
      ),
    );
  }
}
