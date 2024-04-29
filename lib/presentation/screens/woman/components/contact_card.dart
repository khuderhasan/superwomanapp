import 'package:flutter/material.dart';

import '../../chat_screen.dart';

class ContactCard extends StatelessWidget {
  const ContactCard(
      {super.key,
      required this.contactName,
      required this.contactEmail,
      required this.contactId});
  final String contactName;
  final String contactEmail;
  final String contactId;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  ChatScreen(recieverName: contactName, reciverId: contactId),
            ));
      },
      child: Card(
          borderOnForeground: true,
          shape: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(20)),
          child: ListTile(
            // contentPadding: const EdgeInsets.all(defaultPadding / 2),
            leading: Container(
                margin: const EdgeInsets.only(left: 5),
                height: 100,
                width: 50,
                child: const Icon(Icons.person, size: 55)),
            title: Text(
              contactName,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 17,
                fontFamily: 'Lato',
              ),
            ),
            subtitle: Text(
              contactEmail,
              style: const TextStyle(color: Colors.black),
            ),
          )),
    );
  }
}
