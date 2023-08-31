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
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(widget.contact.image),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              color: Colors.teal,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.keyboard_arrow_left_rounded,
                          color: Colors.white,
                        ),
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage(widget.contact.image),
                        radius: 18,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        widget.contact.name,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const NavBarActions(),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: sender.length > reciever.length
                    ? sender.length
                    : reciever.length,
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
                                margin:
                                    const EdgeInsets.only(top: 10, bottom: 10),
                                padding:
                                    const EdgeInsets.fromLTRB(15, 2, 15, 2),
                                child: Row(
                                  children: [
                                    Text(
                                      sender[index],
                                      textDirection: TextDirection.rtl,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(
                                          top: 10, left: 6),
                                      child: Row(
                                        children: [
                                          Text(
                                            index <= 9
                                                ? '12:0$index'
                                                : "01:$index",
                                            textDirection: TextDirection.rtl,
                                            style:
                                                const TextStyle(fontSize: 13),
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
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 5, 15, 5),
                                  child: Row(
                                    children: [
                                      Text(
                                        reciever[index],
                                        textDirection: TextDirection.rtl,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.only(
                                            top: 10, left: 6),
                                        child: Row(
                                          children: [
                                            Text(
                                              index <= 9
                                                  ? '12:0$index'
                                                  : "01:$index",
                                              textDirection: TextDirection.rtl,
                                              style:
                                                  const TextStyle(fontSize: 13),
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
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color: Colors.grey[100],
                      ),
                      margin: const EdgeInsets.all(3),
                      padding: const EdgeInsets.only(left: 10, right: 15),
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: const Icon(
                              Icons.emoji_emotions_outlined,
                              size: 25,
                              color: Colors.grey,
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
                                  size: 25,
                                  color: Colors.grey,
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
                            size: 25,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  CircleAvatar(
                    maxRadius: 22,
                    minRadius: 18,
                    child: textFieldText.text.isEmpty
                        ? IconButton(
                            icon: const Icon(
                              Icons.mic,
                              size: 23,
                            ),
                            onPressed: () {},
                          )
                        : IconButton(
                            icon: const Icon(
                              Icons.send,
                              size: 23,
                            ),
                            onPressed: updateTextFieldText,
                          ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class NavBarActions extends StatelessWidget {
  const NavBarActions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.videocam_rounded,
            color: Colors.white,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.call_rounded,
            color: Colors.white,
          ),
        ),
        PopupMenuButton<String>(
          color: Colors.white,
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
    );
  }
}

Widget bottomsheet() {
  return Card(
    margin: const EdgeInsets.all(8),
    child: Center(
      child: Container(
        padding: const EdgeInsets.all(15),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
  );
}
