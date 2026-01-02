import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

import '../models/contact.dart';

final contactProvider = StateNotifierProvider<ContactNotifier, ContactState>((ref) {
  return ContactNotifier();
});

class ContactState {
  final List<Contact> contacts;
  final List<Contact> filteredContacts;
  final bool isLoading;
  final String error;
  final String searchQuery;
  final String filter;  // Example filter, e.g., 'A-Z' or something simple

  ContactState({
    this.contacts = const [],
    this.filteredContacts = const [],
    this.isLoading = false,
    this.error = '',
    this.searchQuery = '',
    this.filter = '',
  });

  ContactState copyWith({
    List<Contact>? contacts,
    List<Contact>? filteredContacts,
    bool? isLoading,
    String? error,
    String? searchQuery,
    String? filter,
  }) {
    return ContactState(
      contacts: contacts ?? this.contacts,
      filteredContacts: filteredContacts ?? this.filteredContacts,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      searchQuery: searchQuery ?? this.searchQuery,
      filter: filter ?? this.filter,
    );
  }
}

class ContactNotifier extends StateNotifier<ContactState> {
  ContactNotifier() : super(ContactState()) {
    fetchContacts();
  }

  final String baseUrl = 'https://jsonplaceholder.typicode.com/users';

  Future<void> fetchContacts() async {
    state = state.copyWith(isLoading: true, error: '');
    try {
      final response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        final contacts = data.map((json) => Contact.fromJson(json)).toList();
        state = state.copyWith(contacts: contacts, filteredContacts: contacts, isLoading: false);
      } else {
        throw Exception('Failed to load contacts');
      }
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
      Fluttertoast.showToast(msg: 'Error: ${e.toString()}', toastLength: Toast.LENGTH_LONG);
    }
  }

  void addContact(Contact newContact) async {
    state = state.copyWith(isLoading: true, error: '');
    try {
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(newContact.toJson()),
      );
      if (response.statusCode == 201) {
        final addedContact = Contact.fromJson(json.decode(response.body));
        final updatedContacts = [...state.contacts, addedContact];
        state = state.copyWith(contacts: updatedContacts, filteredContacts: updatedContacts, isLoading: false);
        Fluttertoast.showToast(msg: 'Contact added successfully');
      } else {
        throw Exception('Failed to add contact');
      }
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
      Fluttertoast.showToast(msg: 'Error: ${e.toString()}', toastLength: Toast.LENGTH_LONG);
    }
  }


  Future<void> updateContact(Contact updatedContact) async {
    state = state.copyWith(isLoading: true, error: '');
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/${updatedContact.id}'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(updatedContact.toJson()),
      );

      if (response.statusCode == 200) {
        final updatedList = state.contacts.map((contact) {
          return contact.id == updatedContact.id ? updatedContact : contact;
        }).toList();

        state = state.copyWith(
          contacts: updatedList,
          filteredContacts: _applyFilters(updatedList), // terapkan filter lagi
          isLoading: false,
        );
        Fluttertoast.showToast(msg: 'Contact updated successfully');
      } else {
        throw Exception('Failed to update contact');
      }
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
      Fluttertoast.showToast(msg: 'Error updating: ${e.toString()}', toastLength: Toast.LENGTH_LONG);
    }
  }

  Future<void> deleteContact(int id) async {
    state = state.copyWith(isLoading: true, error: '');
    try {
      final response = await http.delete(Uri.parse('$baseUrl/$id'));

      if (response.statusCode == 200) {
        final updatedList = state.contacts.where((contact) => contact.id != id).toList();
        state = state.copyWith(
          contacts: updatedList,
          filteredContacts: _applyFilters(updatedList),
          isLoading: false,
        );
        Fluttertoast.showToast(msg: 'Contact deleted successfully');
      } else {
        throw Exception('Failed to delete contact');
      }
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
      Fluttertoast.showToast(msg: 'Error deleting: ${e.toString()}', toastLength: Toast.LENGTH_LONG);
    }
  }

  List<Contact> _applyFilters(List<Contact> contacts) {
    var filtered = contacts;

    if (state.searchQuery.isNotEmpty) {
      filtered = filtered.where((c) => c.name.toLowerCase().contains(state.searchQuery.toLowerCase())).toList();
    }

    if (state.filter.isNotEmpty) {
      filtered = filtered.where((c) => c.name.toUpperCase().startsWith(state.filter.toUpperCase())).toList();
    }

    return filtered;
  }

  void searchContacts(String query) {
    state = state.copyWith(searchQuery: query);
    state = state.copyWith(filteredContacts: _applyFilters(state.contacts));
  }

  void filterContacts(String filter) {
    state = state.copyWith(filter: filter == 'All' ? '' : filter);
    state = state.copyWith(filteredContacts: _applyFilters(state.contacts));
  }

  //
  // void searchContacts(String query) {
  //   final filtered = state.contacts.where((contact) {
  //     return contact.name.toLowerCase().contains(query.toLowerCase());
  //   }).toList();
  //   state = state.copyWith(searchQuery: query, filteredContacts: filtered);
  // }
  //
  // void filterContacts(String filter) {
  //   // Example simple filter: 'A' for names starting with A
  //   final filtered = state.contacts.where((contact) {
  //     return contact.name.toUpperCase().startsWith(filter.toUpperCase());
  //   }).toList();
  //   state = state.copyWith(filter: filter, filteredContacts: filtered);
  // }
  //

}