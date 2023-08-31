import 'package:flutter/material.dart';

class Community extends StatefulWidget {
  const Community({Key? key}) : super(key: key);

  @override
  State<Community> createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Image.asset(
              "assets/community.png",
              width: 400,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(30),
            child: Center(
              child: Text(
                "Easily organize your related groups and send announcements. Now, your communities, like neighborhoods or schools, can have their own space.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Center(
              child: Container(
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.teal,
                ),
                padding: const EdgeInsets.all(15),
                child: const Text(
                  "Start your community",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
