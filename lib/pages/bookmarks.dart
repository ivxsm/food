import 'package:flutter/material.dart';
import 'package:food/pages/home.dart';
import 'package:food/pages/profile.dart';

class Bookmarks extends StatefulWidget {
  const Bookmarks({super.key});

  @override
  State<Bookmarks> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Bookmarks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookmarks'),
      ),
      body: const Center(
        child: Text('Bookmarks'),
      ),
    );
  }
}