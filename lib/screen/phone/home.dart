import 'package:attacker_kma_app/screen/phone/contact_screen.dart';
import 'package:attacker_kma_app/screen/phone/location_screen.dart';
import 'package:attacker_kma_app/screen/phone/message_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _indexCurrent = 0;

  List<Widget> widgets = [MessageScreen(), ContactScreen(), LocationScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Chats",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 22,
            color: Colors.white,
            fontFamily: "Roboto",
          ),
        ),
        leading: Container(
          padding: EdgeInsets.only(left: 16, top: 3, bottom: 3),
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            child: ClipOval(
              child: CachedNetworkImage(
                imageUrl: "https://bit.ly/2Auplyx",
              ),
            ),
          ),
        ),
        actions: <Widget>[
          CircleAvatar(
            backgroundColor: Color.fromRGBO(51, 51, 51, 1),
            child: IconButton(
              icon: Icon(
                Icons.photo_camera,
                size: 22,
                color: Color.fromRGBO(195, 195, 195, 1),
              ),
              onPressed: () {},
            ),
          ),
          SizedBox(
            width: 20,
          ),
          CircleAvatar(
            backgroundColor: Color.fromRGBO(51, 51, 51, 1),
            child: IconButton(
              icon: Icon(
                Icons.edit,
                size: 22,
                color: Color.fromRGBO(195, 195, 195, 1),
              ),
              onPressed: () {},
            ),
          ),
          SizedBox(
            width: 16,
          ),
        ],
      ),
      body: widgets[_indexCurrent],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indexCurrent,
        onTap: (index) {
          setState(() {
            _indexCurrent = index;
          });
        },
        backgroundColor: const Color.fromRGBO(123, 123, 123, 0.5),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            title: Text('Message'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            title: Text('Contact'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            title: Text('Location'),
          ),
        ],
      ),
    );
  }
}
