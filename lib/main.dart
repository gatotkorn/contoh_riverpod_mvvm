import 'package:contoh_riverpod/utils/page_transitions.dart';
import 'package:contoh_riverpod/views/add_contact.dart';
import 'package:contoh_riverpod/views/home_screen.dart';
import 'package:contoh_riverpod/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact App',
      theme: ThemeData(primarySwatch: Colors.blue),
      // home: const VideoSplashScreen(),
      home: const HomeScreen(),
      onGenerateRoute: (settings) {
        Widget page;
        switch (settings.name) {
          case '/add':
            page = const AddContactScreen();
            break;
          default:
            return null;
        }
        return slideTransitionPageRoute(page: page);
      },
    );
  }
}