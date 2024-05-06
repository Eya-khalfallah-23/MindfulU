import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart'; // Importez la classe DateFormat

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController _userInput = TextEditingController(); // Controle de l'input de user
  final List<Message> _messages = []; // Liste des messages affichés dans le chat
  late ScrollController _scrollController; // Déclarez le ScrollController ici

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController(); // Initialisez le ScrollController
  }

  @override
  void dispose() {
    _scrollController.dispose(); // Assurez-vous de libérer du ScrollController lorsque vous n'en avez plus besoin (si on passe vers un autre ecran par exemple)
    super.dispose();
  }

  // Une méthode pour faire défiler la liste des messages vers le bas : quand un message est ajouté
  void scrollToBottom() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent, // Scroll vers dernier message ajouté
          duration: Duration(milliseconds: 100), // Durée de scroll
          curve: Curves.easeOut, // Commence plus lent puis termine rapidement
        );
      }
    });
  }

  // Gestion du discussions
  Future<void> sendMessage([String? message]) async {
    String s="";
  if (message == null) {
    message = _userInput.text;
    s=message; // Utilisez le texte tapé par l'utilisateur comme message par défaut
  } 
  else {
    for(int i=1;i<message.length;i++) {
      s+=message[i];
    }
  }
    // Ajout du message de l'utilisateur
    setState(() {
      _messages.add(Message(isButton: false,isUser: true, message: s!, date: DateTime.now()));
    });
    // Envoi du message au serveur rasa
    final response = await http.post(
      Uri.parse('https://8df8-197-23-171-126.ngrok-free.app/webhooks/rest/webhook'),
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
              message: button['title'], // Affichage du titre du bouton en tant que message
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
body: Container(
color: Color.fromARGB(20, 0, 0, 0),
child: Column(
mainAxisAlignment: MainAxisAlignment.end,
children: [
// Affichage des messages dans l'écran
Expanded(
child: ListView.builder(
controller: _scrollController, // Utilisez le ScrollController ici
reverse: false, // Affiche les éléments de la liste de bas en haut
itemCount: _messages.length,
itemBuilder: (context, index) {
final message = _messages[index];
return Messages(
isButton: message.isButton,
isUser: message.isUser,
message: message.message,
date: DateFormat('HH:mm').format(message.date),
buttons: message.buttons,
 sendMessage: (String ) {  }, // Passez la liste des boutons au widget Messages
);
},
),
),
// Input de l'utilisateur
Padding(
padding: const EdgeInsets.all(8.0),
child: Row(
children: [
Expanded(
flex: 15,
child: TextFormField(
style: TextStyle(color: Colors.black),
controller: _userInput,
decoration: InputDecoration(
border: OutlineInputBorder(
borderRadius: BorderRadius.circular(15),
),
label: Text('Enter Your Message'),
),
),
),
Spacer(),
IconButton(
padding: EdgeInsets.all(12),
iconSize: 30,
style: ButtonStyle(
backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 240, 119, 188)),
foregroundColor: MaterialStateProperty.all(Colors.white),
shape: MaterialStateProperty.all(CircleBorder()),
),
onPressed: sendMessage,
icon: Icon(Icons.send),
),
],
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
  final Function(String) sendMessage; // Fonction pour envoyer des messages au chatbot

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
      width:20,
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.symmetric(vertical: 15).copyWith(
        left: 10,
        right: 220,
      ),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 240, 119, 188), // Définir la couleur du conteneur à rose
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (buttons != null) ...buttons!.map((button) => _buildButton(button)).toList(),
        ],
      ),
    );
  }

  Widget _buildTextMessage(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.symmetric(vertical: 15).copyWith(
        left: isUser ? 100 : 10,
        right: isUser ? 10 : 100,
      ),
      decoration: BoxDecoration(
        color: isUser ? Colors.green : Color.fromARGB(231, 187, 187, 187),
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
            style: TextStyle(fontSize: 16, color: isUser ? Colors.white : Colors.black),
          ),
          Text(
            date,
            style: TextStyle(fontSize: 10, color: isUser ? Colors.white : Colors.black),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(Widget button) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 5), // Ajouter un espacement entre les boutons
    child: TextButton(
      onPressed: () {
        // Gérer le clic sur le bouton ici
        // Extraire le titre ou le payload du bouton (selon le format de réponse Rasa)
        final String buttonTitle = (button as TextButton).child.toString().replaceAll('Text(\'', '').replaceAll('\')', '').toLowerCase();
        // Envoyer un message à Rasa avec les informations du bouton (remplacez par votre logique réelle)
        sendMessage("/$buttonTitle"); // Remplacez par l'envoi du message à Rasa
      },
      style: ButtonStyle(
backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 240, 119, 188)),
textStyle: MaterialStateProperty.all(TextStyle(fontSize: 25, color: Colors.white)),
alignment: Alignment.center,
),
      child: button, // Utiliser le widget de bouton d'origine pour le contenu du texte
    ),
  );
} }
