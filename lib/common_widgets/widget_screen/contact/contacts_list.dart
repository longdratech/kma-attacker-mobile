import 'package:attacker_kma_app/common_widgets/phoneButton.dart';
import 'package:attacker_kma_app/common_widgets/smsButton.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactListPage extends StatefulWidget {
  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactListPage> {
  Iterable<Contact> contacts;

  @override
  void initState() {
    // askPermisionContact();
    super.initState();
  }

  // @override
  // void didChangeDependencies() {
  //   getContacts();
  //   super.didChangeDependencies();
  // }

  Future<void> getContacts() async =>
      contacts = await ContactsService.getContacts();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getContacts(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        return Container(
          child: ListView.builder(
            itemCount: contacts?.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              Contact contact = contacts?.elementAt(index);
              return ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 2, horizontal: 18),
                leading: (contact.avatar != null && contact.avatar.isNotEmpty)
                    ? CircleAvatar(backgroundImage: MemoryImage(contact.avatar))
                    : CircleAvatar(
                        child: Text(contact.initials()),
                        backgroundColor: Theme.of(context).accentColor,
                      ),
                title: Text(contact.displayName ?? ''),
                //This can be further expanded to showing contacts detail
                // onPressed().
                // trailing: Row(
                //   mainAxisSize: MainAxisSize.min,
                //   children: <Widget>[
                //     PhoneButton(phoneNumbers: contact.phones),
                //     SmsButton(phoneNumbers: contact.phones)
                //   ],
                // ),
              );
            },
          ),
        );
      },
    );
  }
}
