import 'package:flutter/material.dart';

import 'database.dart';
import 'open_chat.dart';

class Chats extends StatefulWidget {
  const Chats({super.key});

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // List View Builder
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          return ListTile(
            // Show images from picsum.photos
            leading: GestureDetector(
              child: CircleAvatar(
                backgroundImage: NetworkImage(photo[index]),
              ),
              onTap: () => showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Container(
                      padding: const EdgeInsets.all(0),
                      margin: const EdgeInsets.all(0),
                      child: Column(
                        children: [
                          Text(
                            name[index],
                            style: const TextStyle(color: Colors.grey),
                          ),
                          const SizedBox(height: 10),
                          Image.network(photo[index], width: 230, height: 250),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.message,
                                  color: Colors.teal,
                                ),
                                onPressed: () {
                                  Contact contact = Contact(
                                    name: name[index],
                                    image: photo[index],
                                    chat: chats[index],
                                  );
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          OpenChat(contact: contact),
                                    ),
                                  );
                                },
                              ),
                              const SizedBox(width: 15),
                              IconButton(
                                icon: const Icon(
                                  Icons.call_rounded,
                                  color: Colors.teal,
                                ),
                                onPressed: () {},
                              ),
                              const SizedBox(width: 15),
                              IconButton(
                                icon: const Icon(
                                  Icons.videocam_rounded,
                                  color: Colors.teal,
                                ),
                                onPressed: () {},
                              ),
                              const SizedBox(width: 15),
                              IconButton(
                                icon: const Icon(
                                  Icons.info_outline,
                                  color: Colors.teal,
                                ),
                                onPressed: () {},
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            title: Text(name[index]),
            subtitle: Text(chats[index]),
            trailing: Text(
              time[index],
              style: const TextStyle(fontSize: 13, color: Colors.grey),
            ),

            onTap: () {
              Contact contact = Contact(
                name: name[index],
                image: photo[index],
                chat: chats[index],
              );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OpenChat(contact: contact),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.chat),
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
