import 'dart:math';

import 'package:dwart/src/database/database.dart';

/// List the available mood for dwarfs
enum DwarfMood {
  /// Neutral
  neutral,

  /// Aggressive
  aggressive,
}

/// {@template dwart}
/// A package to generate Dwarfs names
/// {@endtemplate}
class Dwart {
  /// {@macro dwart}
  Dwart({Random? random}) {
    _random = random ?? Random();
  }

  late final Random _random;

  /// Generates a dwarf name for the given [mood]
  String generateName(DwarfMood mood) {
    final adjectives =
        mood == DwarfMood.neutral ? neutralAdjective : aggressiveAdjective;

    final firstNameLength = max(2, _random.nextInt(3));

    final firstName = _capitalize(
      List.generate(
        firstNameLength,
        (index) => _randomElement(
          nameSyllables,
          _random,
        ),
      ).join(),
    );

    final adjective = _randomElement(adjectives, _random);
    final substantive = _randomElement(substantives, _random);
    return '$firstName $adjective $substantive';
  }

  String _randomElement(List<String> elements, Random random) {
    return elements[random.nextInt(elements.length)];
  }

  String _capitalize(String value) {
    final lower = value.toLowerCase();
    return '${lower[0].toUpperCase()}${lower.substring(1)}';
  }
}
