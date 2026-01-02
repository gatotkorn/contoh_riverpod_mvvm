// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// // import '../viewmodels/contact_viewmodel.dart';
// import '../models/contact.dart';
// import '../view_models/contact_vm.dart';
//
//
// class ContactDetailScreen extends ConsumerStatefulWidget {
//   final int contactId;
//
//   ContactDetailScreen({required this.contactId});
//
//   @override
//   _ContactDetailScreenState createState() => _ContactDetailScreenState();
// }
//
// class _ContactDetailScreenState extends ConsumerState<ContactDetailScreen> {
//   late Future<Contact?> _contactFuture;
//   final _nameController = TextEditingController();
//   final _emailController = TextEditingController();
//   final _cityController = TextEditingController();
//
//   @override
//   void initState() {
//     super.initState();
//     _contactFuture = ref.read(contactProvider.notifier).fetchContactDetail(widget.contactId);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Contact Detail')),
//       body: FutureBuilder<Contact?>(
//         future: _contactFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (snapshot.hasData) {
//             final contact = snapshot.data!;
//             _nameController.text = contact.name;
//             _emailController.text = contact.email;
//             _cityController.text = contact.city;
//
//             return Padding(
//               padding: EdgeInsets.all(16.0),
//               child: Column(
//                 children: [
//                   TextField(controller: _nameController, decoration: InputDecoration(labelText: 'Name')),
//                   TextField(controller: _emailController, decoration: InputDecoration(labelText: 'Email')),
//                   TextField(controller: _cityController, decoration: InputDecoration(labelText: 'City')),
//                   SizedBox(height: 20),
//                   ElevatedButton(
//                     onPressed: () {
//                       final updatedContact = Contact(
//                         id: contact.id,
//                         name: _nameController.text,
//                         email: _emailController.text,
//                         city: _cityController.text,
//                       );
//                       ref.read(contactProvider.notifier).editContact(updatedContact);
//                       Navigator.pop(context);
//                     },
//                     child: Text('Save Changes'),
//                   ),
//                 ],
//               ),
//             );
//           } else {
//             return Center(child: Text('No data'));
//           }
//         },
//       ),
//     );
//   }
// }