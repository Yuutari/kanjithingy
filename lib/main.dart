import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/hiragana_screen.dart';
import 'screens/katakana_screen.dart';
import 'screens/vocabulary_screen.dart';
import 'screens/quiz_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Japanese Learning App',
      theme: ThemeData(
        primarySwatch: Colors.red,
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/hiragana': (context) => const HiraganaScreen(),
        '/katakana': (context) => const KatakanaScreen(),
        '/vocabulary': (context) => const VocabularyScreen(),
        '/quiz': (context) => const QuizScreen(),
      },
    );
  }
}