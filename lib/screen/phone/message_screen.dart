import 'package:attacker_kma_app/common_widgets/content_message.dart';
import 'package:attacker_kma_app/common_widgets/story.dart';
import 'package:flutter/material.dart';

class MessageScreen extends StatelessWidget {
  
  List<String> profilePics = [
    "https://bit.ly/3d3hq8j",
    "https://bit.ly/3d3hq8j",
    "https://bit.ly/3d3hq8j",
    "https://bit.ly/3d3hq8j",
    "https://bit.ly/3d3hq8j",
    "https://bit.ly/3d3hq8j",
    "https://bit.ly/3d3hq8j",
    "https://bit.ly/3d3hq8j",
    "https://bit.ly/3d3hq8j",
    "https://bit.ly/3d3hq8j",
  ];
  
  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16),
            child: Container(
              padding: EdgeInsets.only(left: 16, top: 4, bottom: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                color: Color.fromRGBO(51, 51, 51, 1),
              ),
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(
                      Icons.search,
                      color: Color.fromRGBO(159, 159, 159, 1),
                    ),
                    hintText: "Search",
                    hintStyle: TextStyle(
                      color: Color.fromRGBO(159, 159, 159, 1),
                    )),
              ),
            ),
          ),

          //Story
          Container(
            height: 85,
            margin: const EdgeInsets.only(top: 8, bottom: 8, left: 16),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: profilePics
                    .map((e) => StoryWidget(profilePics: e))
                    .toList(),
              ),
            ),
          ),

          //Message content
          Container(
            margin: const EdgeInsets.only(left: 16, right: 16, top: 8),
            height: 350,
            child: SingleChildScrollView(
              child: Column(
                children: profilePics
                    .map((index) => MessageWidget(profilePics: index))
                    .toList(),
              ),
            ),
          ),
        ],
      );
  }
}