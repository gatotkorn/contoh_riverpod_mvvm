import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/contact.dart';
import '../providers/contact_provider.dart';

class EditContactScreen extends ConsumerStatefulWidget {
  final Contact contact;

  const EditContactScreen({super.key, required this.contact});

  @override
  _EditContactScreenState createState() => _EditContactScreenState();
}

class _EditContactScreenState extends ConsumerState<EditContactScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  late String _email;
  late String _phone;

  @override
  void initState() {
    super.initState();
    _name = widget.contact.name;
    _email = widget.contact.email;
    _phone = widget.contact.phone;
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(contactProvider.select((state) => state.isLoading));

    return Scaffold(
      appBar: AppBar(title: const Text('Edit Contact')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: _name,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) => value!.isEmpty ? 'Required' : null,
                onSaved: (value) => _name = value!,
              ),
              TextFormField(
                initialValue: _email,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) => value!.isEmpty ? 'Required' : null,
                onSaved: (value) => _email = value!,
              ),
              TextFormField(
                initialValue: _phone,
                decoration: const InputDecoration(labelText: 'Phone'),
                onSaved: (value) => _phone = value ?? '',
              ),
              const SizedBox(height: 20),
              isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    final updatedContact = Contact(
                      id: widget.contact.id,
                      name: _name,
                      email: _email,
                      phone: _phone,
                    );
                    ref.read(contactProvider.notifier).updateContact(updatedContact);
                    Navigator.pop(context);
                  }
                },
                child: const Text('Update'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}