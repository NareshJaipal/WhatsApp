import 'package:flutter/material.dart';

import 'database.dart';

class Calls extends StatefulWidget {
  const Calls({super.key});

  @override
  State<Calls> createState() => _ChatsState();
}

class _ChatsState extends State<Calls> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // List View Builder
      body: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              child: Transform.rotate(
                angle: 125,
                child: const Icon(
                  Icons.link,
                  color: Colors.white,
                ),
              ),
            ),
            title: const Text('Create call link'),
            subtitle: const Text('Share a link for your WhatsApp call'),
          ),
          Container(
            width: double.infinity,
            color: Colors.grey[300],
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Recent'),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: chats.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(photo[index]),
                  ),
                  title: Text(name[index]),
                  subtitle: Row(
                    children: [
                      const Icon(
                        Icons.call_received_sharp,
                        size: 17,
                        color: Colors.green,
                      ),
                      const SizedBox(width: 5),
                      Row(
                        children: [const Text("Today, "), Text(time[index])],
                      ),
                    ],
                  ),
                  trailing: const Icon(
                    Icons.call,
                    color: Colors.teal,
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_call),
        onPressed: () {
          setState(() {
            name.add('New Chat');
            chats.add('What\'s up Man');
          });
        },
      ),
    );
  }
}
