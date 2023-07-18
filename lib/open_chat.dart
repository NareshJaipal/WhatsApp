
import 'package:flutter/material.dart';

import 'database.dart';

class Contact {
  final String name;
  final String image;
  final String chat;

  Contact({required this.name, required this.image, required this.chat});
}

class OpenChat extends StatefulWidget {
  final Contact contact;

  const OpenChat({Key? key, required this.contact}) : super(key: key);

  @override
  State<OpenChat> createState() => _OpenChatState();
}

class _OpenChatState extends State<OpenChat> {
  final TextEditingController textFieldText = TextEditingController();

  void updateTextFieldText() {
    String newText = textFieldText.text;
    setState(
      () {
        sender.add(newText);
        reciever.add("Yes");
      },
    );
    textFieldText.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.videocam_rounded),
          ),
          const SizedBox(width: 5),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.call_rounded),
          ),
          const SizedBox(width: 5),
          PopupMenuButton<String>(
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem<String>(
                  value: "View contact",
                  child: Text("View contact"),
                ),
                const PopupMenuItem<String>(
                  value: "Media, links, and docs",
                  child: Text("Media, links, and docs"),
                ),
                const PopupMenuItem<String>(
                  value: "Search",
                  child: Text("Search"),
                ),
                const PopupMenuItem<String>(
                  value: "Mute Notification",
                  child: Text("Mute Notification"),
                ),
                const PopupMenuItem<String>(
                  value: "Disappearing message",
                  child: Text("Disappearing message"),
                ),
                const PopupMenuItem<String>(
                  value: "Wallpaper",
                  child: Text("Wallpaper"),
                ),
                const PopupMenuItem<String>(
                  value: "more",
                  child: Row(
                    children: [
                      Expanded(child: Text("More")),
                      Icon(
                        Icons.play_arrow,
                        color: Colors.black,
                        size: 17,
                      ),
                    ],
                  ),
                ),
              ];
            },
            onSelected: (String value) {
              if (value == 'Parent') {
                showMenu(
                  context: context,
                  position: const RelativeRect.fromLTRB(0, 0, 0, 0),
                  items: [
                    PopupMenuItem<String>(
                      value: 'Child1',
                      child: const Text('Child Menu 1'),
                      onTap: () {},
                    ),
                  ],
                );
              }
            },
          ),
        ],
        title: Container(
          margin: const EdgeInsets.all(0),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(0.0),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(widget.contact.image),
                  radius: 18,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Text(widget.contact.name),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        color: Colors.grey,
        child: ListView.builder(
          itemCount:
              sender.length > reciever.length ? sender.length : reciever.length,
          itemBuilder: (context, index) {
            final isSenderMessageValid = index < sender.length;
            final isReceiverMessageValid = index < reciever.length;

            return ListTile(
              title: Column(
                children: [
                  if (isSenderMessageValid)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // Message Sender
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: Colors.green[100],
                          ),
                          margin: const EdgeInsets.only(top: 10, bottom: 10),
                          padding: const EdgeInsets.fromLTRB(15, 2, 15, 2),
                          child: Row(
                            children: [
                              Text(
                                sender[index],
                                textDirection: TextDirection.rtl,
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.only(top: 10, left: 6),
                                child: Row(
                                  children: [
                                    Text(
                                      index <= 9 ? '12:0$index' : "01:$index",
                                      textDirection: TextDirection.rtl,
                                      style: const TextStyle(fontSize: 13),
                                    ),
                                    const SizedBox(width: 3),
                                    const Text(
                                      "PM",
                                      style: TextStyle(fontSize: 13),
                                    ),
                                    const SizedBox(width: 3),
                                    const Icon(
                                      Icons.done_all_outlined,
                                      size: 20,
                                      color: Colors.blueAccent,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  if (isReceiverMessageValid)
                    Container(
                      padding: const EdgeInsets.all(1),
                      child: Row(
                        children: [
                          // Message Receiver
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              color: Colors.grey[100],
                            ),
                            padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                            child: Row(
                              children: [
                                Text(
                                  reciever[index],
                                  textDirection: TextDirection.rtl,
                                ),
                                Container(
                                  padding:
                                      const EdgeInsets.only(top: 10, left: 6),
                                  child: Row(
                                    children: [
                                      Text(
                                        index <= 9 ? '12:0$index' : "01:$index",
                                        textDirection: TextDirection.rtl,
                                        style: const TextStyle(fontSize: 13),
                                      ),
                                      const SizedBox(width: 3),
                                      const Text("PM",
                                          style: TextStyle(fontSize: 13)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          color: Colors.grey,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.grey[100],
                ),
                margin: const EdgeInsets.all(5),
                width: 400,
                padding: const EdgeInsets.only(left: 10, right: 15),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: const Icon(
                        Icons.emoji_emotions_outlined,
                        size: 30,
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: textFieldText,
                        decoration: const InputDecoration(
                          hintText: 'Message',
                        ),
                        onChanged: (value) {
                          setState(
                            () {
                              value = textFieldText.text;
                            },
                          );
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: Transform.rotate(
                        angle: 125,
                        child: IconButton(
                          icon: const Icon(
                            Icons.attach_file,
                            size: 30,
                          ),
                          onPressed: () {
                            showModalBottomSheet(
                                backgroundColor: Colors.transparent,
                                context: context,
                                builder: (builder) => bottomsheet());
                          },
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.camera_alt_rounded,
                      size: 30,
                    ),
                  ],
                ),
              ),
              CircleAvatar(
                maxRadius: 25,
                minRadius: 20,
                child: IconButton(
                  icon: Icon(
                    textFieldText.text.isEmpty ? Icons.mic : Icons.send,
                    size: 25,
                  ),
                  onPressed: updateTextFieldText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget bottomsheet() {
  return Container(
    margin: const EdgeInsets.fromLTRB(25, 2, 25, 3),
    // height: 800,
    // width: 30,
    // width: MediaQuery.of(context).size.width,
    child: Card(
      margin: const EdgeInsets.all(10),
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(15),
          child: const Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 30,
                        child: Icon(
                          Icons.insert_drive_file,
                          size: 28,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Document",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(width: 50),
                  Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.pink,
                        radius: 30,
                        child: Icon(
                          Icons.camera_alt,
                          size: 28,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Camera",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(width: 50),
                  Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.purple,
                        radius: 30,
                        child: Icon(
                          Icons.image,
                          size: 28,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Gallery",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.orange,
                        radius: 30,
                        child: Icon(
                          Icons.headphones,
                          size: 28,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Audio",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(width: 50),
                  Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.green,
                        radius: 30,
                        child: Icon(
                          Icons.location_on,
                          size: 28,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Location",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(width: 50),
                  Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.lightBlue,
                        radius: 30,
                        child: Icon(
                          Icons.person,
                          size: 28,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text("Contact"),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.teal,
                        radius: 30,
                        child: Icon(
                          Icons.poll,
                          size: 28,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Poll",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
