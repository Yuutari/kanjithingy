import 'package:flutter/material.dart';
import '../data/hiragana_data.dart';
import '../widgets/character_card.dart';

class HiraganaScreen extends StatelessWidget {
  const HiraganaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hiragana'),
        backgroundColor: Colors.red[700],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1.0,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemCount: hiraganaList.length,
        itemBuilder: (context, index) {
          return CharacterCard(character: hiraganaList[index]);
        },
      ),
    );
  }
}