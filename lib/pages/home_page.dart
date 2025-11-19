import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
final Gemini gemini = Gemini.instance;


  List<ChatMessage> messages = [];

  ChatUser currentUser = ChatUser(id: "0", firstName: "User");
  ChatUser geminiUser = ChatUser(
    id: "1", 
    firstName: "Gemini",
  profileImage: "https://images.seeklogo.com/logo-png/61/2/gemini-icon-logo-png_seeklogo-611605.png");
  @override Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Gemini Chat",
        ),
      ),
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    return DashChat(currentUser: currentUser, onSend: _sendMessage, messages: messages);
  }

  void _sendMessage(ChatMessage chatMassage) {
    setState(() {
      messages = [chatMassage,...messages];
    });
    try {
      String question = chatMassage.text;
      gemini.streamGenerateContent(question).listen((event){
        ChatMessage? lastMessage = messages.firstOrNull;
        if (lastMessage != null && lastMessage.user == geminiUser) {

        }else {
          String response = event.content?.parts?.fold("",(previous, current) => "$previous$current") ?? "";
          ChatMessage message = ChatMessage(user: geminiUser, createdAt: DateTime.now(), text: response, );
        setState(() {
          messages = [message,...messages];
        });
        }


        
      });
    } catch (e) {
      print(e);
    }
  }
}

