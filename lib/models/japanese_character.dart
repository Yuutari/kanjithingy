class JapaneseCharacter {
  final String character;
  final String romaji;
  final String type; // hiragana, katakana, kanji
  final List<String>? meanings; // for kanji
  final List<String>? examples;

  JapaneseCharacter({
    required this.character,
    required this.romaji,
    required this.type,
    this.meanings,
    this.examples,
  });
}