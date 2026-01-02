// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../models/contact.dart';
// import '../view_models/contact_vm.dart';
// import 'contact_detail_screen.dart';
//
// class ContactListScreen extends ConsumerWidget {
//   final TextEditingController _searchController = TextEditingController();
//   final TextEditingController _filterController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final contactState = ref.watch(contactProvider);
//     final contactsAsync = ref.watch(contactsFutureProvider);
//
//     return Scaffold(
//       appBar: AppBar(title: Text('Contact List')),
//       body: Column(
//         children: [
//           Padding(
//             padding: EdgeInsets.all(8.0),
//             child: TextField(
//               controller: _searchController,
//               decoration: InputDecoration(labelText: 'Search by Name'),
//               onChanged: (value) => ref.read(contactProvider.notifier).setSearchQuery(value),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.all(8.0),
//             child: TextField(
//               controller: _filterController,
//               decoration: InputDecoration(labelText: 'Filter by City'),
//               onChanged: (value) => ref.read(contactProvider.notifier).setFilterCity(value),
//             ),
//           ),
//           Expanded(
//             child: contactsAsync.when(
//               data: (contacts) => ListView.builder(
//                 itemCount: contacts.length,
//                 itemBuilder: (context, index) {
//                   final contact = contacts[index];
//                   return ListTile(
//                     title: Text(contact.name),
//                     subtitle: Text(contact.city),
//                     onTap: () => Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (_) => ContactDetailScreen(contactId: contact.id)),
//                     ),
//                   );
//                 },
//               ),
//               loading: () => Center(child: CircularProgressIndicator()),
//               error: (err, stack) => Center(child: Text('Error: $err')),
//             ),
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // Tambah kontak baru (contoh sederhana, bisa expand ke form)
//           ref.read(contactProvider.notifier).addContact(
//             Contact(id: DateTime.now().millisecondsSinceEpoch, name: 'New Contact', email: 'new@email.com', city: 'New City'),
//           );
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }