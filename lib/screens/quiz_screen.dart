import 'package:flutter/material.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz'),
        backgroundColor: Colors.indigo,
      ),
      body: const Center(
        child: Text('Quiz content coming soon', style: TextStyle(fontSize: 18.0)),
      ),
    );
  }
}
