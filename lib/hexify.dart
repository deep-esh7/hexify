library hexify;

import 'package:flutter/material.dart';

/// Enumeration for gradient types to provide users with choices between linear or radial gradients.
enum HexifyGradientType {
  linearGradient,
  radialGradient,
}

/// Hexify function that dynamically returns a Color or Gradient based on the provided parameters.
///
/// This function allows for flexible color and gradient creation, supporting hex codes, RGBO values,
/// and various gradient configurations.
dynamic Hexify({
  String? colorCode, // Optionally specify a hex color code or RGBO value.
  double? opacity, // Opacity can be specified as a percentage (1 to 100) or as a decimal (0.0 to 1.0).
  HexifyGradientType? gradientType, // Specify the type of gradient if using gradient colors.
  String? firstColor, // First color for gradients.
  String? secondColor, // Second color for gradients.
  String? thirdColor, // Optional third color for more complex gradients.
  double? firstColorShade, // Optional shade factor for the first color, no default to ensure explicit use.
  double? secondColorShade, // Optional shade factor for the second color.
  double? thirdColorShade, // Optional shade factor for the third color.
  double? shade, // Optional shade factor for a single color code.
  double? opacityOfFirstColor, // Specific opacity for the first color.
  double? opacityOfSecondColor, // Specific opacity for the second color.
  double? opacityOfThirdColor, // Specific opacity for the third color.
  AlignmentGeometry begin = Alignment.topCenter, // Start position for LinearGradient.
  AlignmentGeometry end = Alignment.bottomCenter, // End position for LinearGradient.
  List<double>? stops, // Stops for defining positions of color transitions within the gradient.
  TileMode? tileMode, // How the gradient should tile the plane beyond the gradient itself.
  GradientTransform? transform, // Transform applied to the gradient.
  double? radius, // Radius for RadialGradient.
  AlignmentGeometry center = Alignment.center, // Center for RadialGradient.
  AlignmentGeometry? focal, // Focal point of RadialGradient.
  double? focalRadius, // Radius around the focal point of the RadialGradient.
}) {
  // Ensure no conflicting parameters are passed (e.g., colorCode with gradientType or gradient colors).
  if ((colorCode != null && gradientType != null) ||
      (colorCode != null && (firstColor != null || secondColor != null || thirdColor != null)) ||
      (gradientType == HexifyGradientType.linearGradient && (firstColor == null || secondColor == null)) ||
      (gradientType == HexifyGradientType.radialGradient && (firstColor == null || secondColor == null)) ||
      (opacityOfFirstColor != null && firstColor == null) ||
      (opacityOfSecondColor != null && secondColor == null) ||
      (opacityOfThirdColor != null && thirdColor == null) ||
      (shade != null && colorCode == null) ||
      (firstColorShade != null && firstColor == null) ||
      (secondColorShade != null && secondColor == null) ||
      (thirdColorShade != null && thirdColor == null)) {
    throw ArgumentError('Conflicting or missing parameters.');
  }

  // Process the colorCode if it's provided, and check if it's an RGBO format.
  if (colorCode != null) {
    if (_isRGBO(colorCode)) {
      // Parse the RGBO value to a Color object.
      return _parseRGBO(colorCode, shade, opacity);
    } else {
      // Handle hex color codes. Validate and convert opacity if necessary.
      if (opacity != null) {
        if (opacity < 0.0 || opacity > 100.0) {
          throw ArgumentError('Opacity must be between 0.0 and 100.0.');
        }
        // Convert opacity from percentage or fractional to alpha (0-255).
        opacity = opacity > 1.0 ? opacity / 100 : opacity;
      }
      return _hexToColor(colorCode, opacity, shade);
    }
  }

  // Validate hex colors for gradients and ensure they are properly formatted.
  if (firstColor != null && !_isValidHexColor(firstColor)) {
    throw ArgumentError('Invalid firstColor. Must be a valid hex code.');
  }
  if (secondColor != null && !_isValidHexColor(secondColor)) {
    throw ArgumentError('Invalid secondColor. Must be a valid hex code.');
  }
  if (thirdColor != null && !_isValidHexColor(thirdColor)) {
    throw ArgumentError('Invalid thirdColor. Must be a valid hex code.');
  }

  // Create a list of colors for the gradient, applying opacity and shade as necessary.
  List<Color> gradientColors = [];
  if (firstColor != null) {
    gradientColors.add(_hexToColor(firstColor, opacityOfFirstColor, firstColorShade));
  }
  if (secondColor != null) {
    gradientColors.add(_hexToColor(secondColor, opacityOfSecondColor, secondColorShade));
  }
  if (thirdColor != null) {
    gradientColors.add(_hexToColor(thirdColor, opacityOfThirdColor, thirdColorShade));
  }

  // Handle creation of a LinearGradient or RadialGradient based on the specified type.
  if (gradientType == HexifyGradientType.linearGradient) {
    return LinearGradient(
      colors: gradientColors,
      begin: begin,
      end: end,
      stops: stops,
      tileMode: tileMode ?? TileMode.clamp,
      transform: transform,
    );
  }
  if (gradientType == HexifyGradientType.radialGradient) {
    return RadialGradient(
      colors: gradientColors,
      center: center,
      radius: radius ?? 0.5,
      focal: focal,
      focalRadius: focalRadius ?? 0.0,
      stops: stops,
      tileMode: tileMode ?? TileMode.clamp,
      transform: transform,
    );
  }

  throw ArgumentError('Invalid combination of arguments.');
}

/// Validate whether a string is a valid hex color code.
bool _isValidHexColor(String hexCode) {
  hexCode = hexCode.startsWith('#') ? hexCode.substring(1) : hexCode;
  return hexCode.length == 6 || hexCode.length == 8;
}

/// Check if the provided colorCode string matches the RGBO format.
bool _isRGBO(String colorCode) {
  return RegExp(r'^\d{1,3},\s*\d{1,3},\s*\d{1,3}(?:,\s*\d?\.?\d+)?$').hasMatch(colorCode);
}

/// Convert a hex string or RGBO string to a Color, applying opacity and shade if provided.
Color _hexToColor(String hexCode, [double? opacity, double? shade]) {
  hexCode = hexCode.startsWith('#') ? hexCode.substring(1) : hexCode;

  // Extract alpha if present
  int alpha = hexCode.length == 8 ? int.parse(hexCode.substring(0, 2), radix: 16) : 255;
  int colorInt = int.parse(hexCode.length == 8 ? hexCode.substring(2) : hexCode, radix: 16);
  Color color = Color.fromARGB(alpha, (colorInt >> 16) & 0xFF, (colorInt >> 8) & 0xFF, colorInt & 0xFF);

  // Apply shade first, if provided
  if (shade != null) {
    if (shade < 0.0 || shade > 1.0) {
      throw ArgumentError('Shade must be between 0.0 and 1.0.');
    }
    color = Color.lerp(Colors.black, color.withOpacity(1.0), shade)!;
  }

  // Apply opacity as an alpha value
  if (opacity != null) {
    color = color.withOpacity(opacity);
  } else {
    color = color.withAlpha(alpha);
  }

  return color;
}

/// Parse an RGBO format string into a Color object, applying an optional shade.
Color _parseRGBO(String colorCode, [double? shade, double? opacity]) {
  final match = RegExp(r'^(\d{1,3}),\s*(\d{1,3}),\s*(\d{1,3})(?:,\s*(\d?\.?\d+))?$').firstMatch(colorCode);
  if (match == null || int.parse(match.group(1)!) > 255 || int.parse(match.group(2)!) > 255 || int.parse(match.group(3)!) > 255) {
    throw ArgumentError('Invalid RGBO value.');
  }

  int r = int.parse(match.group(1)!);
  int g = int.parse(match.group(2)!);
  int b = int.parse(match.group(3)!);
  double a = match.group(4) != null ? double.parse(match.group(4)!) : 1.0;

  Color color = Color.fromRGBO(r, g, b, a);

  // Apply shade first, if provided
  if (shade != null) {
    if (shade < 0.0 || shade > 1.0) {
      throw ArgumentError('Shade must be between 0.0 and 1.0.');
    }
    color = Color.lerp(Colors.black, color.withOpacity(1.0), shade)!;
  }

  // Apply opacity as an alpha value
  if (opacity != null) {
    color = color.withOpacity(opacity);
  } else {
    color = color.withOpacity(a);
  }

  return color;
}
