// ignore_for_file: prefer_const_constructors
import 'dart:math';

import 'package:dwart/dwart.dart';
import 'package:test/test.dart';

void main() {
  group('Dwart', () {
    test('can be instantiated', () {
      expect(Dwart(), isNotNull);
    });

    test('returns a valid neutral name', () {
      final random = Random(1);
      expect(
        Dwart(random: random).generateName(DwarfMood.neutral),
        equals('Fidtharar Light Belt'),
      );
    });

    test('returns a valid aggressive name', () {
      final random = Random(2);
      expect(
        Dwart(random: random).generateName(DwarfMood.aggressive),
        equals('Lildar Magma Shoulder'),
      );
    });
  });
}
