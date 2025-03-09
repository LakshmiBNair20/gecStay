// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';


class ChatPage extends StatefulWidget {
  final types.Room room;

  const ChatPage({Key? key, required this.room}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final List<types.Message> _messages = [];
  final _user = types.User(id: FirebaseChatCore.instance.firebaseUser?.uid ?? '');

  @override
  void initState() {
    super.initState();
    _loadMessages();
  }

  void _loadMessages() {
    FirebaseChatCore.instance.messages(widget.room).listen((messages) {
      setState(() {
        _messages
          ..clear()
          ..addAll(messages);
        _messages.sort((a, b) => b.createdAt!.compareTo(a.createdAt!));
      });
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: true,
          backgroundColor: const Color(0xff1f1c38),
          foregroundColor: Colors.white,
          title: Text(widget.room.name.toString()),
        ),
        body: Chat(
          messages: _messages,
          onSendPressed: _handleSendPressed,
          user: _user,
          theme: const DarkChatTheme(),
          // onMessageLongPress: _handleLongPress, // Handle long press
        ),
      );

  void _handleSendPressed(types.PartialText message) {
    FirebaseChatCore.instance.sendMessage(
      types.PartialText(text: message.text),
      widget.room.id,
    );
  }

  // Handle long press to delete message
  // void _handleLongPress(BuildContext context, types.Message message) {
  //   if (message.author.id == _user.id) {
  //     // Show confirmation dialog
  //     showDialog(
  //       context: context,
  //       builder: (context) => AlertDialog(
  //         title: const Text("Delete Message"),
  //         content: const Text("Are you sure you want to delete this message?"),
  //         actions: [
  //           TextButton(
  //             onPressed: () => Navigator.pop(context),
  //             child: const Text("Cancel"),
  //           ),
  //           TextButton(
  //             onPressed: () {
  //               _deleteMessage(message);
  //               Navigator.pop(context);
  //             },
  //             child: const Text("Delete", style: TextStyle(color: Colors.red)),
  //           ),
  //         ],
  //       ),
  //     );
  //   }
  // }

  // Delete message from Firestore
  // void _deleteMessage(types.Message message) async {
  //   await FirebaseChatCore.instance.deleteMessage(widget.room.id, message.id);
  // }
}
