// import 'dart:convert';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:http/http.dart' as http;
// import '../models/contact.dart';
// import 'package:fluttertoast/fluttertoast.dart';
//
// enum ContactState { loading, success, error }
//
// class ContactNotifier extends StateNotifier<ContactState> {
//   ContactNotifier() : super(ContactState.success);
//
//   List<Contact> contacts = [];
//   List<Contact> filteredContacts = [];
//   String searchQuery = '';
//   String filterCity = '';
//
//   Future<void> fetchContacts() async {
//     state = ContactState.loading;
//     try {
//       final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
//       if (response.statusCode == 200) {
//         final List<dynamic> data = json.decode(response.body);
//         contacts = data.map((json) => Contact.fromJson(json)).toList();
//         applyFilters();
//         state = ContactState.success;
//       } else {
//         throw Exception('Failed to load contacts');
//       }
//     } catch (e) {
//       state = ContactState.error;
//       Fluttertoast.showToast(msg: 'Error fetching contacts: $e');
//     }
//   }
//
//   Future<Contact?> fetchContactDetail(int id) async {
//     try {
//       final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users/$id'));
//       if (response.statusCode == 200) {
//         return Contact.fromJson(json.decode(response.body));
//       } else {
//         throw Exception('Failed to load contact detail');
//       }
//     } catch (e) {
//       Fluttertoast.showToast(msg: 'Error fetching detail: $e');
//       return null;
//     }
//   }
//
//   Future<void> addContact(Contact newContact) async {
//     state = ContactState.loading;
//     try {
//       final response = await http.post(
//         Uri.parse('https://jsonplaceholder.typicode.com/users'),
//         headers: {'Content-Type': 'application/json'},
//         body: json.encode(newContact.toJson()),
//       );
//       if (response.statusCode == 201) {
//         contacts.add(Contact.fromJson(json.decode(response.body)));
//         applyFilters();
//         state = ContactState.success;
//         Fluttertoast.showToast(msg: 'Contact added successfully');
//       } else {
//         throw Exception('Failed to add contact');
//       }
//     } catch (e) {
//       state = ContactState.error;
//       Fluttertoast.showToast(msg: 'Error adding contact: $e');
//     }
//   }
//
//   Future<void> editContact(Contact updatedContact) async {
//     state = ContactState.loading;
//     try {
//       final response = await http.put(
//         Uri.parse('https://jsonplaceholder.typicode.com/users/${updatedContact.id}'),
//         headers: {'Content-Type': 'application/json'},
//         body: json.encode(updatedContact.toJson()),
//       );
//       if (response.statusCode == 200) {
//         final index = contacts.indexWhere((c) => c.id == updatedContact.id);
//         if (index != -1) {
//           contacts[index] = updatedContact;
//           applyFilters();
//         }
//         state = ContactState.success;
//         Fluttertoast.showToast(msg: 'Contact updated successfully');
//       } else {
//         throw Exception('Failed to update contact');
//       }
//     } catch (e) {
//       state = ContactState.error;
//       Fluttertoast.showToast(msg: 'Error updating contact: $e');
//     }
//   }
//
//   void applyFilters() {
//     filteredContacts = contacts.where((contact) {
//       final matchesSearch = contact.name.toLowerCase().contains(searchQuery.toLowerCase());
//       final matchesFilter = filterCity.isEmpty || contact.city.toLowerCase() == filterCity.toLowerCase();
//       return matchesSearch && matchesFilter;
//     }).toList();
//   }
//
//   void setSearchQuery(String query) {
//     searchQuery = query;
//     applyFilters();
//   }
//
//   void setFilterCity(String city) {
//     filterCity = city;
//     applyFilters();
//   }
// }
//
// final contactProvider = StateNotifierProvider<ContactNotifier, ContactState>((ref) => ContactNotifier());
//
// final contactsFutureProvider = FutureProvider<List<Contact>>((ref) async {
//   final notifier = ref.read(contactProvider.notifier);
//   await notifier.fetchContacts();
//   return notifier.filteredContacts;
// });