import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

@immutable
class MessageWidget extends StatelessWidget {
  String profilePics;

  MessageWidget({this.profilePics});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.only(bottom: 10, right: 8),
      leading: Stack(
        children: <Widget>[
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              color: Color.fromRGBO(51, 51, 51, 1),
            ),
            child: ClipOval(
              child: CachedNetworkImage(
                imageUrl: profilePics,
              ),
            ),
          ),
          Positioned(
            child: Container(
              height: 18,
              width: 18,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(9)),
                  color: Colors.green,
                  border: Border.all(color: Colors.black, width: 3)),
            ),
            bottom: 0,
            right: 0,
          )
        ],
      ),
      title: Padding(
        padding: EdgeInsets.only(bottom: 6),
        child: Text(
          "Maaz Aftab",
          style: TextStyle(
              fontFamily: "Roboto",
              fontWeight: FontWeight.w500,
              color: Colors.white),
        ),
      ),
      subtitle: Text(
        "This is message of maaz aftab",
        style: TextStyle(
            fontFamily: "Roboto",
            fontWeight: FontWeight.w400,
            color: Color.fromRGBO(123, 123, 123, 1)),
      ),
      trailing: Icon(
        Icons.check_circle,
        size: 20,
        color: Color.fromRGBO(101, 107, 115, 1),
      ),
    );
  }
}
