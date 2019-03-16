import 'dart:async';

import 'package:flutter/material.dart';

// Import package
import 'package:contacts_service/contacts_service.dart';
import 'package:simple_permissions/simple_permissions.dart';
import 'package:snschat_flutter/general/ui-component/list-view.dart';

class ContactsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new ContactsPageState();
  }
}

class ContactsPageState extends State<ContactsPage> {
  bool isLoading = true;
  PermissionStatus permissionStatus;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    print('build()');
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Group Chat",
              style: TextStyle(fontSize: 18.0),
            ),
            Text(
              "Select a contact",
              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w300),
            )
          ],
        ),
      ),
      body: FutureBuilder(
          future: getContacts(context),
          builder:
              (BuildContext context, AsyncSnapshot<PageListView> feedState) {
            print(
                ' builder: (BuildContext context, AsyncSnapshot<PageListView> feedState)');
            if (feedState.error != null) {
              print('if (feedState.error != null)');
              // TODO: error handling
            }
            if (feedState.data == null) {
              print('if (feedState.data == null)');
              return new Center(child: new CircularProgressIndicator());
            }
            print('return feedState.data;');
            return feedState.data;
          }),
    );
  }

  getPermission() {
    SimplePermissions.requestPermission(Permission.ReadContacts).then((status) {
      return status;
    });
  }

  Future<PageListView> getContacts(BuildContext context) async {
    // TODO: Handle when user denies permission
    permissionStatus = await SimplePermissions.requestPermission(Permission.ReadContacts);
    print('getContacts()');
      // Get all contacts on device
      Iterable<Contact> contacts = await ContactsService.getContacts();
      print("Got here?");
      List<Contact> contactList = contacts.toList(growable: true);
      print("contactList: " + contactList.toString());
      contactList.forEach((contact) {
        print(contact.displayName);
        pageListItems.add(PageListItem(
          title: Text(contact.displayName),
          subtitle: Text('Hey There! I am using PocketChat.'),
          leading: CircleAvatar(
            backgroundColor: Colors.white,
            backgroundImage:
            contact.avatar.isNotEmpty ? MemoryImage(contact.avatar) : null,
            child: Text(
              !contact.avatar.isNotEmpty ? "" : contact.displayName[0],
              style: TextStyle(color: Colors.black),
            ),
          ),
          onTap: () {
            print("Clicked!");
          },
        ));
        List<Item> phoneList = contact.phones.toList();
        phoneList.forEach((phoneNo) {
          print(phoneNo.label);
          print(phoneNo.value);
        });
      });
      print('pageListItems.length: ' + pageListItems.length.toString());
      print('Got value!');
      return Future.value(PageListView(array: pageListItems, context: context));
  }

  List<PageListItem> pageListItems = [];
}