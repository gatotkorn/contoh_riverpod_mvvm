// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// import '../providers/contact_provider.dart';
// import '../utils/page_transitions.dart';
// import 'add_contact.dart';
// import 'detail_screen.dart';
// import 'edit_contact_screen.dart';
//
// class HomeScreen extends ConsumerWidget {
//   const HomeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final contactState = ref.watch(contactProvider);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Contacts'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.add),
//             onPressed: () {
//               Navigator.of(context).push(
//                 bottomSlideTransitionPageRoute(page: const AddContactScreen()),
//               );
//             },
//           ),
//
//         ],
//       ),
//       body: Column(
//         children: [
//           // Search Bar
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               decoration: const InputDecoration(
//                 labelText: 'Search by name',
//                 border: OutlineInputBorder(),
//               ),
//               onChanged: (query) =>
//                   ref.read(contactProvider.notifier).searchContacts(query),
//             ),
//           ),
//           // Filter (Simple dropdown for starting letter)
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: DropdownButton<String>(
//               value: contactState.filter.isEmpty ? 'All' : contactState.filter,
//               items: ['All', 'A', 'B', 'C', 'D', 'E'].map((String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value),
//                 );
//               }).toList(),
//               onChanged: (value) {
//                 if (value == 'All') {
//                   ref.read(contactProvider.notifier).filterContacts('');
//                 } else {
//                   ref.read(contactProvider.notifier).filterContacts(value!);
//                 }
//               },
//             ),
//           ),
//           Expanded(
//             child: contactState.isLoading
//                 ? const Center(
//                     child: CircularProgressIndicator(),
//                   ) // Loading Indicator
//                 : ListView.builder(
//                     itemCount: contactState.filteredContacts.length,
//                     itemBuilder: (context, index) {
//                       final contact = contactState.filteredContacts[index];
//                       return ListTile(
//                         title: Text(contact.name),
//                         subtitle: Text(contact.email),
//                         trailing: PopupMenuButton<String>(
//                           onSelected: (value) {
//                             if (value == 'edit') {
//                               Navigator.of(context).push(
//                                 slideTransitionPageRoute(
//                                   page: EditContactScreen(contact: contact),
//                                 ),
//                               );
//                             } else if (value == 'delete') {
//                               showDialog(
//                                 context: context,
//                                 builder: (ctx) => AlertDialog(
//                                   title: const Text('Delete Contact?'),
//                                   content: Text(
//                                     'Are you sure want to delete ${contact.name}?',
//                                   ),
//                                   actions: [
//                                     TextButton(
//                                       onPressed: () => Navigator.pop(ctx),
//                                       child: const Text('Cancel'),
//                                     ),
//                                     TextButton(
//                                       onPressed: () {
//                                         ref
//                                             .read(contactProvider.notifier)
//                                             .deleteContact(contact.id);
//                                         Navigator.pop(ctx);
//                                       },
//                                       child: const Text(
//                                         'Delete',
//                                         style: TextStyle(color: Colors.red),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               );
//                             }
//                           },
//                           itemBuilder: (context) => [
//                             const PopupMenuItem(
//                               value: 'edit',
//                               child: Text('Edit'),
//                             ),
//                             const PopupMenuItem(
//                               value: 'delete',
//                               child: Text('Delete'),
//                             ),
//                           ],
//                         ),
//                         onTap: () {
//                           Navigator.of(context).push(
//                             slideTransitionPageRoute(
//                               page: DetailScreen(contact: contact),
//                             ),
//                           );
//                         },
//                       );
//                     },
//                   ),
//           ),
//         ],
//       ),
//     );
//   }
// }
