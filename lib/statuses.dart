import 'package:flutter/material.dart';

import 'database.dart';

class Statuses extends StatefulWidget {
  const Statuses({super.key});

  @override
  State<Statuses> createState() => _StatusesState();
}

class _StatusesState extends State<Statuses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // List View Builder
      body: Column(
        children: [
          const ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://avatars.githubusercontent.com/u/132568227?v=4'),
            ),
            title: Text('My status'),
            subtitle: Text('Tap to add status update'),
          ),
          Container(
            width: double.infinity,
            color: Colors.grey[300],
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Recent updates'),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: chats.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    maxRadius: 20,
                    minRadius: 19,
                    backgroundColor: Colors.green,
                    backgroundImage: AssetImage(photo[index]),
                  ),
                  title: Text(name[index]),
                  subtitle: Row(
                    children: [const Text("Today, "), Text(time[index])],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.grey[300],
            child: const Icon(Icons.edit, color: Colors.black87),
            onPressed: () {},
          ),
          const SizedBox(height: 15),
          FloatingActionButton(
            child: const Icon(Icons.camera_alt),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
