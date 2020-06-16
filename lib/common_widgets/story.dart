import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class StoryWidget extends StatelessWidget {
  String profilePics;

  StoryWidget({this.profilePics});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 65,
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 60,
                width: 60,
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  color: Color.fromRGBO(51, 51, 51, 1),
                  border: Border.all(
                    color: const Color.fromRGBO(0, 132, 255, 1),
                    width: 3,
                  ),
                ),
                child: ClipOval(
                  child: CachedNetworkImage(imageUrl: profilePics),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  height: 18,
                  width: 18,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(9)),
                      color: Colors.green,
                      border: Border.all(color: Colors.black, width: 3)),
                ),
              )
            ],
          ),
          const Text(
            "Your Story",
            style: TextStyle(
              fontFamily: "Roboto",
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(123, 123, 123, 1),
            ),
          )
        ],
      ),
    );
  }
}
