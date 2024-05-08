import 'package:flutter/material.dart';
import 'package:mentalhealth_app/common/widgets/custom_shapes/containers/circle_container.dart';
import 'package:mentalhealth_app/utils/constants/colors.dart';
import 'package:mentalhealth_app/utils/constants/image_strings.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/appbar/custom_appbar.dart';
import '../../../../../utils/constants/sizes.dart';

import 'package:shared_preferences/shared_preferences.dart';

class FirstConversation extends StatefulWidget {
  @override
  _FirstConversationState createState() => _FirstConversationState();
}

class _FirstConversationState extends State<FirstConversation> {
  final TextEditingController _textEditingController = TextEditingController();
  bool _showContent = true;
  List<String> _chatMessages = [];

  @override
  void initState() {
    super.initState();
    _loadMessages(); // Load saved messages when widget is initialized
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text('Chat Page', style: TextStyle(color: MhColors.blue),),
      ),
      body: Stack(
        children: [
          
              
                   _buildContent()
                  
            
          ,
          Align(
            alignment: Alignment.bottomCenter,
            child: _buildInputField(),
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    
      return Column(
        children: [
          SizedBox(height: MhSizes.spaceBetweenSections*1.5),
          Container(
            width: 430,
            height: 350,
            alignment: Alignment.center,
            child: Image.asset(
              MhImages.chatbotpic2,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 15),
          Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 17, vertical: 6.5),
              decoration: BoxDecoration(
                border: Border.all(
                  color: MhColors.blue,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(13),
              ),
              child: Text(
                'Limitations',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14.8,
                  color: MhColors.blue,
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Limited knowledge',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 21.5,
              color: MhColors.blue,
            ),
          ),
          SizedBox(height: 12),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Text(
              'No human being is perfect. So is chatbots. This chatbot knowledge is limited to 2024.',
              style: TextStyle(
                color: MhColors.blue.withOpacity(0.73),
                fontSize: 16.5,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      );
    
  }

  Widget _buildChatMessages() {
    // Widget to show chat messages
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: _chatMessages.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(_chatMessages[index]),
        );
      },
    );
  }

  Widget _buildInputField() {
    // Widget for input field and send button
    return Container(
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
          bottom:15,
          left: 10,
          right:10,
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _textEditingController,
                decoration: InputDecoration(
                  hintText: 'Type your message...',
                  filled: true,
                  fillColor: MhColors.light,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
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
                onPressed: () {
                  _sendMessage(_textEditingController.text);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _sendMessage(String message) {
    setState(() {
      _chatMessages.add(message);
    });
    _saveMessages(); // Save the messages
    _textEditingController.clear();
    _showContent = true; // Show content after sending the message
  }

  // Load saved messages from SharedPreferences
  Future<void> _loadMessages() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _chatMessages = prefs.getStringList('chat_messages') ?? [];
    });
  }

  // Save messages to SharedPreferences
  Future<void> _saveMessages() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('chat_messages', _chatMessages);
  }
}
