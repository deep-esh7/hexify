import 'package:flutter_test/flutter_test.dart';
import 'package:hexify/hexify.dart';
import 'package:flutter/material.dart';

void main() {
  group('Hexify Function Tests', () {
    test('Returns a Color from hex code with full opacity', () {
      final color = Hexify(colorCode: '#ff5733');
      expect(color, isA<Color>());
      expect(color, equals(const Color(0xffff5733)));  // Expect fully opaque color
    });

    test('Returns a Color from hex code with specified opacity', () {
      final color = Hexify(colorCode: '#ff5733', opacity: 50.0);
      expect(color, isA<Color>());
      expect(color, equals(const Color(0x80ff5733)));  // Expect 50% opacity
    });

    test('Returns a Color from RGBO value', () {
      final color = Hexify(colorCode: '255, 87, 51, 1.0');
      expect(color, isA<Color>());
      expect(color, equals(const Color.fromRGBO(255, 87, 51, 1.0)));
    });

    test('Applies opacity correctly for hex code', () {
      final color = Hexify(colorCode: '#ff5733', opacity: 50.0);
      expect(color, isA<Color>());
      expect(color?.opacity, closeTo(0.5, 0.01)); // Allow small tolerance
    });

    test('Applies shade correctly for hex code', () {
      final color = Hexify(colorCode: '#ff5733', shade: 0.5);
      final expectedColor = Color.lerp(Colors.black, const Color(0xffff5733), 0.5);
      expect(color, equals(expectedColor));
    });

    test('Returns LinearGradient', () {
      final gradient = Hexify(
        gradientType: HexifyGradientType.linearGradient,
        firstColor: '#ff5733',
        secondColor: '#33ff57',
      );
      expect(gradient, isA<LinearGradient>());
      expect((gradient as LinearGradient).colors, equals([const Color(0xffff5733), const Color(0xff33ff57)]));
    });

    test('Returns RadialGradient', () {
      final gradient = Hexify(
        gradientType: HexifyGradientType.radialGradient,
        firstColor: '#ff5733',
        secondColor: '#33ff57',
      );
      expect(gradient, isA<RadialGradient>());
      expect((gradient as RadialGradient).colors, equals([const Color(0xffff5733), const Color(0xff33ff57)]));
    });

    test('Handles missing parameters by throwing ArgumentError', () {
      expect(
        () => Hexify(colorCode: '#ff5733', gradientType: HexifyGradientType.linearGradient),
        throwsArgumentError,
      );
    });

    test('Handles invalid hex color by throwing ArgumentError', () {
      expect(
        () => Hexify(firstColor: '#ggg'),  // Invalid hex color
        throwsArgumentError,
      );
    });

    test('Handles invalid RGBO value by throwing ArgumentError', () {
      expect(
        () => Hexify(colorCode: '999, 999, 999'),  // Invalid RGBO values
        throwsArgumentError,
      );
    });

    test('Applies opacity and shade together correctly', () {
      const expectedColor = Color(0x807f2b19);  // Expected color with applied opacity and shade
      final color = Hexify(colorCode: '#ff5733', opacity: 50.0, shade: 0.5);
      expect(color, equals(expectedColor));
    });

    test('Applies both opacity and shade to a hex color with 8 characters (including alpha)', () {
      const expectedColor = Color(0x807f2b19);  // Expected color with applied opacity and shade
      final color = Hexify(colorCode: '#80ff5733', opacity: 50.0, shade: 0.5);
      expect(color, equals(expectedColor));
    });

    test('Handles color with alpha in hex code and applies additional opacity', () {
      const expectedColor = Color(0x80ff5733);  // Apply additional opacity
      final color = Hexify(colorCode: '#80ff5733', opacity: 50.0);
      expect(color, isA<Color>());
      expect(color, equals(expectedColor));
    });
  });
}
