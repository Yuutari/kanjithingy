import 'package:flutter/material.dart';
import '../models/japanese_character.dart';
import '../utils/preferences_service.dart';

class CharacterCard extends StatelessWidget {
  final JapaneseCharacter character;

  const CharacterCard({
    super.key,
    required this.character,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => _buildCharacterDialog(context),
          );
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                character.character,
                style: const TextStyle(fontSize: 32.0),
              ),
              Text(
                character.romaji,
                style: const TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCharacterDialog(BuildContext context) {
    // Use StatefulBuilder so the dialog can update its local state
    return StatefulBuilder(
      builder: (context, setState) {
        final isSeen = PreferencesService.stringListContains(
            PreferencesService.keyHiraganaSeenList, character.character);

        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(character.character),
              if (isSeen)
                const Icon(Icons.check_circle, color: Colors.green, size: 20)
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Romaji: ${character.romaji}'),
              const SizedBox(height: 8.0),
              if (character.examples != null) ...[
                const Text('Examples:', style: TextStyle(fontWeight: FontWeight.bold)),
                ...character.examples!.map((example) => Text('• $example')),
              ],
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
            ElevatedButton(
              onPressed: () async {
                // Obtain navigator before any async gap to avoid using the
                // BuildContext after await (avoids use_build_context_synchronously).
                final navigator = Navigator.of(context);

                // Toggle seen state for this character
                if (PreferencesService.stringListContains(
                    PreferencesService.keyHiraganaSeenList, character.character)) {
                  await PreferencesService.removeFromStringList(
                      PreferencesService.keyHiraganaSeenList, character.character);
                } else {
                  await PreferencesService.addToStringList(
                      PreferencesService.keyHiraganaSeenList, character.character);
                }

                // Close the dialog
                navigator.pop();
              },
              child: Text(isSeen ? 'Unmark learned' : 'Mark learned'),
            ),
          ],
        );
      },
    );
  }
}