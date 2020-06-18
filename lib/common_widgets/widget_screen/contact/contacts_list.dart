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
  Iterable<Contact> _contacts;

  @override
  void initState() {
    // askPermisionContact();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    getContacts();
    super.didChangeDependencies();
  }

  Future<void> getContacts() async {
    //We already have permissions for contact when we get to this page, so we
    // are now just retrieving it
    final Iterable<Contact> contacts = await ContactsService.getContacts();
    setState(() {
      _contacts = contacts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _contacts.isEmpty || _contacts == null
          //Build a list view of all contacts, displaying their avatar and
          // display name
          ? Center(child: const CircularProgressIndicator())
          : ListView.builder(
              itemCount: _contacts?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                Contact contact = _contacts?.elementAt(index);
                return ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 18),
                  leading: (contact.avatar != null && contact.avatar.isNotEmpty)
                      ? CircleAvatar(
                          backgroundImage: MemoryImage(contact.avatar))
                      : CircleAvatar(
                          child: Text(contact.initials()),
                          backgroundColor: Theme.of(context).accentColor,
                        ),
                  title: Text(contact.displayName ?? ''),
                  //This can be further expanded to showing contacts detail
                  // onPressed().
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      PhoneButton(phoneNumbers: contact.phones),
                      SmsButton(phoneNumbers: contact.phones)
                    ],
                  ),
                );
              },
            ),
    );
  }
}
