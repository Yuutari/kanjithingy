import 'package:flutter/material.dart';
import '../utils/preferences_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int hiraganaSeen = 0;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _initPrefs();
  }

  Future<void> _initPrefs() async {
    await PreferencesService.init();
    final v = PreferencesService.getInt(PreferencesService.keyHiraganaSeen) ?? 0;
    setState(() {
      hiraganaSeen = v;
      _loading = false;
    });
  }

  Future<void> _incrementSeen() async {
    setState(() => hiraganaSeen++);
    await PreferencesService.setInt(PreferencesService.keyHiraganaSeen, hiraganaSeen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Japanese Learning App'),
        backgroundColor: Colors.red[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              elevation: 2.0,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _loading
                        ? const CircularProgressIndicator()
                        : Text('Hiragana seen: $hiraganaSeen', style: Theme.of(context).textTheme.titleMedium),
                    ElevatedButton(
                      onPressed: _loading ? null : _incrementSeen,
                      child: const Text('Mark seen'),
                    )
                  ],
                ),
              ),
            ),

            const SizedBox(height: 12.0),

            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                padding: const EdgeInsets.all(8.0),
                children: [
                  _buildMenuCard(
                    context,
                    'Hiragana',
                    Icons.abc,
                    () => Navigator.pushNamed(context, '/hiragana'),
                  ),
                  _buildMenuCard(
                    context,
                    'Katakana',
                    Icons.abc,
                    () => Navigator.pushNamed(context, '/katakana'),
                  ),
                  _buildMenuCard(
                    context,
                    'Vocabulary',
                    Icons.book,
                    () => Navigator.pushNamed(context, '/vocabulary'),
                  ),
                  _buildMenuCard(
                    context,
                    'Quiz',
                    Icons.quiz,
                    () => Navigator.pushNamed(context, '/quiz'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuCard(
    BuildContext context,
    String title,
    IconData icon,
    VoidCallback onTap,
  ) {
    return Card(
      elevation: 4.0,
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48.0),
            const SizedBox(height: 8.0),
            Text(title, style: Theme.of(context).textTheme.titleLarge),
          ],
        ),
      ),
    );
  }
}