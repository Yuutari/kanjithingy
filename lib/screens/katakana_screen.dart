import 'package:flutter/material.dart';

class KatakanaScreen extends StatelessWidget {
  const KatakanaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Katakana'),
        backgroundColor: Colors.blueGrey,
      ),
      body: const Center(
        child: Text('Katakana content coming soon', style: TextStyle(fontSize: 18.0)),
      ),
    );
  }
}
