// lib/views/detail_screen.dart (View - Detail per Data)
import 'package:flutter/material.dart';

import '../models/contact.dart';
import '../utils/page_transitions.dart';
import 'edit_contact_screen.dart';

class DetailScreen extends StatelessWidget {
  final Contact contact;

  const DetailScreen({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(contact.name),
        actions: [
          // IconButton(
          //   icon: const Icon(Icons.edit),
          //   onPressed: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (_) => EditContactScreen(contact: contact),
          //       ),
          //     );
          //   },
          // ),
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              Navigator.of(context).push(
                slideTransitionPageRoute(page: EditContactScreen(contact: contact)),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${contact.name}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text(
              'Email: ${contact.email}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              'Phone: ${contact.phone}',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
