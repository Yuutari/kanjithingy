import 'package:flutter/material.dart';

class VocabularyScreen extends StatelessWidget {
  const VocabularyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vocabulary'),
        backgroundColor: Colors.green,
      ),
      body: const Center(
        child: Text('Vocabulary content coming soon', style: TextStyle(fontSize: 18.0)),
      ),
    );
  }
}
