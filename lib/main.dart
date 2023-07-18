import 'package:flutter/material.dart';
import 'community.dart';
import 'statuses.dart';
import 'chats.dart';
import 'calls.dart';

main() => runApp(const WhatsApp());

class WhatsApp extends StatefulWidget {
  const WhatsApp({super.key});

  @override
  State<WhatsApp> createState() => _WhatsAppState();
}

class _WhatsAppState extends State<WhatsApp> {
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WhatsApp',
      theme: _isDarkMode
          ? ThemeData.dark()
          : ThemeData(primarySwatch: Colors.teal),
      home: Builder(
        builder: (context) {
          return DefaultTabController(
            initialIndex: 2,
            length: 4,
            child: Scaffold(
              appBar: AppBar(
                actions: [
                  _isDarkMode
                      ? IconButton(
                          icon: const Icon(Icons.sunny),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Theme'),
                                  content: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Light",
                                        style: TextStyle(fontSize: 30),
                                      ),
                                      SizedBox(width: 20),
                                      Icon(Icons.sunny_snowing, size: 70)
                                    ],
                                  ),
                                  actions: [
                                    Container(
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.grey,
                                      ),
                                      child: TextButton(
                                        child: const Text(
                                          'Cancel',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                          ),
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.grey,
                                      ),
                                      child: TextButton(
                                        child: const Text(
                                          'Active',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                          ),
                                        ),
                                        onPressed: () {
                                          setState(
                                            () {
                                              _isDarkMode = !_isDarkMode;
                                            },
                                          );
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        )
                      : IconButton(
                          icon: const Icon(Icons.dark_mode),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Theme'),
                                  content: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Dark",
                                        style: TextStyle(fontSize: 30),
                                      ),
                                      SizedBox(width: 20),
                                      Icon(Icons.nights_stay, size: 70)
                                    ],
                                  ),
                                  actions: [
                                    Container(
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.grey,
                                      ),
                                      child: TextButton(
                                        child: const Text(
                                          'Cancel',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                          ),
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.grey,
                                      ),
                                      child: TextButton(
                                        child: const Text(
                                          'Active',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                          ),
                                        ),
                                        onPressed: () {
                                          setState(
                                            () {
                                              _isDarkMode = !_isDarkMode;
                                            },
                                          );
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.camera_alt_rounded),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search),
                  ),
                  PopupMenuButton<String>(
                    itemBuilder: (BuildContext context) {
                      return [
                        const PopupMenuItem<String>(
                          value: "New group",
                          child: Text("New group"),
                        ),
                        const PopupMenuItem<String>(
                          value: "New broadcast",
                          child: Text("New broadcast"),
                        ),
                        const PopupMenuItem<String>(
                          value: "Linked devices",
                          child: Text("Linked devices"),
                        ),
                        const PopupMenuItem<String>(
                          value: "Starred messages",
                          child: Text("Starred messages"),
                        ),
                        const PopupMenuItem<String>(
                          value: "Setting",
                          child: Text("Setting"),
                        ),
                      ];
                    },
                  ),
                ],
                title: const Text('WhatsApp'),
                // tab bar
                bottom: const TabBar(
                  tabs: [
                    Tab(
                      icon: Icon(Icons.groups),
                    ),
                    Tab(
                      text: 'CHATS',
                    ),
                    Tab(
                      text: 'STATUS',
                    ),
                    Tab(
                      text: 'CALLS',
                    ),
                  ],
                ),
              ),
              body: const TabBarView(
                children: <Widget>[
                  Community(),
                  Chats(),
                  Statuses(),
                  Calls(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
