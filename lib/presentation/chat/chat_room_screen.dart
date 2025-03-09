import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import shared_preferences for local storage
import 'chat_page.dart'; // Ensure you have the ChatPage imported

class ChatRoomScreen extends StatefulWidget {
  final String userId;
  const ChatRoomScreen({super.key, required this.userId});

  @override
  _ChatRoomScreenState createState() => _ChatRoomScreenState();
}

class _ChatRoomScreenState extends State<ChatRoomScreen> {
  // Handle the user tap to create a chat room and navigate to the chat page
  void _handlePressed(types.Room room, BuildContext context) async {
    await _setLastSeenTimestamp(room.id, DateTime.now());
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChatPage(room: room),
      ),
    );
    setState(() {});
  }

  Future<void> _setLastSeenTimestamp(String roomId, DateTime timestamp) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('last_seen_$roomId', timestamp.millisecondsSinceEpoch);
  }

  Future<DateTime?> _getLastSeenTimestamp(String roomId) async {
    final prefs = await SharedPreferences.getInstance();
    final lastSeen = prefs.getInt('last_seen_$roomId');
    return lastSeen != null ? DateTime.fromMillisecondsSinceEpoch(lastSeen) : null;
  }

  Future<int> _getUnreadCount(String roomId, String currentUserId) async {
    DateTime? lastSeenTimestamp = await _getLastSeenTimestamp(roomId);

    final messagesSnapshot = await FirebaseFirestore.instance
        .collection('rooms')
        .doc(roomId)
        .collection('messages')
        .orderBy('createdAt', descending: true)
        .get();

    int unreadCount = 0;
    for (var doc in messagesSnapshot.docs) {
      DateTime messageTimestamp = doc['createdAt'].toDate();
      String authorId = doc['authorId'];

      if (authorId != currentUserId && (lastSeenTimestamp == null || messageTimestamp.isAfter(lastSeenTimestamp))) {
        unreadCount++;
      }
    }

    return unreadCount;
  }

  // Function to delete a chat room
  // Future<void> _deleteChatRoom(String roomId) async {
  //   try {
  //     await FirebaseFirestore.instance.collection('rooms').doc(roomId).delete();
  //     setState(() {});
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('Chat deleted successfully')),
  //     );
  //   } catch (e) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('Error deleting chat: $e')),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final currentUserId = widget.userId;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        foregroundColor: Colors.white,
        title: const Text('Messages'),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: StreamBuilder<List<types.Room>>(
        stream: FirebaseChatCore.instance.rooms(),
        initialData: const [],
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(color: Colors.white));
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text(
                'No chat rooms available.',
                style: TextStyle(color: Colors.white70),
              ),
            );
          }

          final rooms = snapshot.data!;

          return ListView.builder(
            itemCount: rooms.length,
            itemBuilder: (context, index) {
              final room = rooms[index];

              return FutureBuilder<int>(
                future: _getUnreadCount(room.id, currentUserId),
                builder: (context, unreadSnapshot) {
                  if (unreadSnapshot.connectionState == ConnectionState.waiting) {
                    return const ListTile(
                      leading: CircularProgressIndicator(),
                      title: Text('Loading...'),
                    );
                  }

                  int unreadCount = unreadSnapshot.data ?? 0;

                  return ListTile(
                    leading: Stack(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey[700],
                          child: Text(
                            room.name?.substring(0, 1).toUpperCase() ?? '?',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        if (unreadCount > 0)
                          Positioned(
                            top: 0,
                            right: 0,
                            child: Container(
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                      ],
                    ),
                    title: Text(
                      room.name ?? 'Unknown Room',
                      style: const TextStyle(color: Colors.white),
                    ),
                    onTap: () async {
                      await _setLastSeenTimestamp(room.id, DateTime.now());
                      _handlePressed(room, context);
                    },
                    // trailing: PopupMenuButton<String>(
                    //   color: Colors.grey[800],
                    //   onSelected: (value) {
                    //     if (value == 'delete') {
                    //       _deleteChatRoom(room.id);
                    //     }
                    //   },
                    //   itemBuilder: (context) => [
                    //     const PopupMenuItem(
                    //       value: 'delete',
                    //       child: Row(
                    //         children: [
                    //           Icon(Icons.delete, color: Colors.red),
                    //           SizedBox(width: 10),
                    //           Text('Delete', style: TextStyle(color: Colors.white)),
                    //         ],
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
