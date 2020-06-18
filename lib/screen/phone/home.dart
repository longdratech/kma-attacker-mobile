import 'package:attacker_kma_app/screen/phone/contact_screen.dart';
import 'package:attacker_kma_app/screen/phone/gallery_screen.dart';
import 'package:attacker_kma_app/screen/phone/location_screen.dart';
import 'package:attacker_kma_app/screen/phone/message_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:sms/sms.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _indexCurrent = 0;

  List<Widget> widgets = [MessageScreen(), ContactScreen(), LocationScreen()];

  @override
  void initState() {
    askPermisionContact();
    super.initState();
  }

  askPermisionContact() async {
    final PermissionStatus permissionStatus = await _getContactPermission();
    if (permissionStatus == PermissionStatus.granted) {
      _handleInvalidPermissions(permissionStatus);
    } else {
      //If permissions have been denied show standard cupertino alert dialog
      showDialog(
          context: context,
          builder: (BuildContext context) => CupertinoAlertDialog(
                title: Text('Permissions error'),
                content: Text('Please enable contacts access '
                    'permission in system settings'),
                actions: <Widget>[
                  CupertinoDialogAction(
                    child: Text('OK'),
                    onPressed: () => Navigator.of(context).pop(),
                  )
                ],
              ));
    }
  }

  Future<PermissionStatus> _getContactPermission() async {
    final PermissionStatus permissionContact = await Permission.contacts.status;
    final PermissionStatus permissionSMS = await Permission.sms.status;
    final PermissionStatus permissionStroger = await Permission.storage.status;

    if (permissionContact != PermissionStatus.granted &&
            permissionContact != PermissionStatus.denied ||
        permissionSMS != PermissionStatus.granted &&
            permissionSMS != PermissionStatus.denied ||
        permissionStroger != PermissionStatus.granted &&
            permissionStroger != PermissionStatus.denied) {
      final Map<Permission, PermissionStatus> permissionStatus =
          await [Permission.contacts, Permission.sms].request();
      return permissionStatus[Permission.contacts] ??
          PermissionStatus.undetermined;
    }
    return permissionContact;
  }

  void _handleInvalidPermissions(PermissionStatus permissionStatus) {
    if (permissionStatus == PermissionStatus.denied) {
      throw PlatformException(
        code: "PERMISSION_DENIED",
        message: "Access to location data denied",
        details: null,
      );
    } else if (permissionStatus == PermissionStatus.undetermined) {
      throw PlatformException(
        code: "PERMISSION_undetermined",
        message: "Location data is not available on device",
        details: null,
      );
    }
  }

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
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => GalleryScreen())),
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
