# Hexify

Hexify is a powerful, flexible, and user-friendly Flutter package designed to simplify color manipulation and gradient creation. Whether you're a beginner or an experienced developer, Hexify makes working with colors in Flutter a breeze, allowing you to create stunning and dynamic color schemes with minimal effort.

## Why Choose Hexify?

### 🚀 Simplicity at Its Core
Hexify takes the complexity out of color manipulation. With just a single function call, you can convert hex codes, create gradients, and apply sophisticated color transformations. No more juggling multiple color utility functions or dealing with complex color math!

### 🎨 Versatile Color Handling
From simple hex code conversions to complex gradient generations, Hexify has got you covered. It seamlessly handles hex codes (with or without '#'), RGBO values, and even creates linear and radial gradients on the fly.

### 🛠 Flexible API
Designed with flexibility in mind, Hexify's API allows you to do as much or as little as you need. Need a quick color from a hex code? One line of code. Want to create a complex three-color gradient with custom stops and transformations? Hexify scales to your needs.

### 🔍 Intelligent Defaults
While offering a wide range of customization options, Hexify also provides smart defaults. This means you can get great results with minimal configuration, perfect for rapid prototyping or when you need a quick color solution.


## Features

- 🎭 Easy conversion of hex color codes to Flutter `Color` objects
- 🌈 Effortless creation of linear and radial gradients
- 🔢 Support for RGBO color values
- 🔳 Apply opacity and shading to colors with ease
- 🔧 Flexible API for various color manipulation scenarios
- ⚡ Optimized for performance

## Installation

Adding Hexify to your project is simple. Just add this line to your package's `pubspec.yaml` file:

```yaml
dependencies:
  hexify: ^0.0.3
```

Then run:

```
$ flutter pub get
```

And that's it! You're ready to start using Hexify in your project.

## Usage

Using Hexify is straightforward. Start by importing the package:

```dart
import 'package:hexify/hexify.dart';
```

### Basic Color Creation

Creating a color from a hex code is simple. Hexify is flexible with hex code input. You can use the '#' symbol or omit it:

```dart
Color myColor1 = Hexify(colorCode: '#FF5733');
Color myColor2 = Hexify(colorCode: 'FF5733');
```

Both of these will produce the same color.

### Gradient Creation

#### Linear Gradients

Create a beautiful linear gradient:

```dart
LinearGradient myGradient1 = Hexify(
  gradientType: HexifyGradientType.LinearGradient,
  firstColor: '#FF5733',
  secondColor: '#3498DB'
);

// Or without '#'
LinearGradient myGradient2 = Hexify(
  gradientType: HexifyGradientType.LinearGradient,
  firstColor: 'FF5733',
  secondColor: '3498DB'
);
```

#### Radial Gradients

Create a radial gradient:

```dart
RadialGradient myRadialGradient1 = Hexify(
  gradientType: HexifyGradientType.RadialGradient,
  firstColor: '#FF5733',
  secondColor: '#3498DB',
  radius: 0.8
);

// Or without '#'
RadialGradient myRadialGradient2 = Hexify(
  gradientType: HexifyGradientType.RadialGradient,
  firstColor: 'FF5733',
  secondColor: '3498DB',
  radius: 0.8
);
```

### Advanced Color Manipulation

#### Opacity

Apply opacity to your colors:

```dart
Color semiTransparentColor1 = Hexify(colorCode: '#FF5733', opacity: 0.5);
Color semiTransparentColor2 = Hexify(colorCode: 'FF5733', opacity: 0.5);
```

#### Shading

Create a darker shade of a color:

```dart
Color darkerShade1 = Hexify(colorCode: '#FF5733', shade: 0.7);
Color darkerShade2 = Hexify(colorCode: 'FF5733', shade: 0.7);
```

### RGBO Support

Work with RGBO values:

```dart
Color myRgboColor = Hexify(colorCode: '255, 87, 51, 0.8');
```

## Advanced Gradient Options

### Custom Stops

Define precise positions for color transitions:

```dart
LinearGradient customStopsGradient = Hexify(
  gradientType: HexifyGradientType.LinearGradient,
  firstColor: '#FF5733',
  secondColor: '#3498DB',
  thirdColor: '#2ECC71',
  stops: [0.2, 0.5, 0.8]
);

// Or without '#'
LinearGradient customStopsGradient2 = Hexify(
  gradientType: HexifyGradientType.LinearGradient,
  firstColor: 'FF5733',
  secondColor: '3498DB',
  thirdColor: '2ECC71',
  stops: [0.2, 0.5, 0.8]
);
```

### TileMode

Determine how the gradient behaves outside its defined area:

```dart
LinearGradient tiledGradient = Hexify(
  gradientType: HexifyGradientType.LinearGradient,
  firstColor: '#FF5733',
  secondColor: '#3498DB',
  tileMode: TileMode.repeated
);

// Or without '#'
LinearGradient tiledGradient2 = Hexify(
  gradientType: HexifyGradientType.LinearGradient,
  firstColor: 'FF5733',
  secondColor: '3498DB',
  tileMode: TileMode.repeated
);
```

Options for tileMode:
- `TileMode.clamp`: Extends the edge colors (default)
- `TileMode.repeated`: Repeats the gradient
- `TileMode.mirror`: Mirrors the gradient

### GradientTransform

Apply matrix transformations to your gradient:

```dart
LinearGradient transformedGradient = Hexify(
  gradientType: HexifyGradientType.LinearGradient,
  firstColor: '#FF5733',
  secondColor: '#3498DB',
  transform: GradientRotation(pi / 4) // Rotates the gradient by 45 degrees
);

// Or without '#'
LinearGradient transformedGradient2 = Hexify(
  gradientType: HexifyGradientType.LinearGradient,
  firstColor: 'FF5733',
  secondColor: '3498DB',
  transform: GradientRotation(pi / 4) // Rotates the gradient by 45 degrees
);
```

### Advanced Radial Gradient Options

Specify a focal point and focal radius for radial gradients:

```dart
RadialGradient advancedRadialGradient = Hexify(
  gradientType: HexifyGradientType.RadialGradient,
  firstColor: '#FF5733',
  secondColor: '#3498DB',
  center: Alignment(0.3, -0.5),
  focal: Alignment(-0.1, 0.6),
  focalRadius: 0.2
);

// Or without '#'
RadialGradient advancedRadialGradient2 = Hexify(
  gradientType: HexifyGradientType.RadialGradient,
  firstColor: 'FF5733',
  secondColor: '3498DB',
  center: Alignment(0.3, -0.5),
  focal: Alignment(-0.1, 0.6),
  focalRadius: 0.2
);
```

## Real-World Examples

### Creating a Dynamic Theme

```dart
class MyTheme {
  static Color primaryColor1 = Hexify(colorCode: '#3498DB');
  static Color primaryColor2 = Hexify(colorCode: '3498DB');

  static Color accentColor1 = Hexify(colorCode: '#E74C3C');
  static Color accentColor2 = Hexify(colorCode: 'E74C3C');
  
  static LinearGradient backgroundGradient1 = Hexify(
    gradientType: HexifyGradientType.LinearGradient,
    firstColor: '#3498DB',
    secondColor: '#E74C3C',
    begin: Alignment.topLeft,
    end: Alignment.bottomRight
  );

  static LinearGradient backgroundGradient2 = Hexify(
    gradientType: HexifyGradientType.LinearGradient,
    firstColor: '3498DB',
    secondColor: 'E74C3C',
    begin: Alignment.topLeft,
    end: Alignment.bottomRight
  );
}
```

### Custom Painter with Hexify

```dart
class MyCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = Hexify(
        gradientType: HexifyGradientType.RadialGradient,
        firstColor: '#FF5733',
        secondColor: '#3498DB',
        radius: 0.5
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    
    // Or without '#'
    final paint2 = Paint()
      ..shader = Hexify(
        gradientType: HexifyGradientType.RadialGradient,
        firstColor: 'FF5733',
        secondColor: '3498DB',
        radius: 0.5
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), size.width / 3, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
```

## API Reference

### Hexify Function

The main `Hexify` function accepts the following parameters:

- `colorCode`: String (hex code with or without '#', or RGBO value)
- `opacity`: double (0.0 to 1.0 or 1 to 100)
- `gradientType`: HexifyGradientType (LinearGradient or RadialGradient)
- `firstColor`, `secondColor`, `thirdColor`: String (hex codes for gradients, with or without '#')
- `firstColorShade`, `secondColorShade`, `thirdColorShade`: double (0.0 to 1.0)
- `shade`: double (0.0 to 1.0)
- `opacityOfFirstColor`, `opacityOfSecondColor`, `opacityOfThirdColor`: double (0.0 to 1.0)
- `begin`, `end`: AlignmentGeometry (for LinearGradient)
- `stops`: List<double>
- `tileMode`: TileMode
- `transform`: GradientTransform
- `radius`: double (for RadialGradient)
- `center`, `focal`: AlignmentGeometry (for RadialGradient)
- `focalRadius`: double (for RadialGradient)

For detailed usage of each parameter, refer to the API documentation or the source code.

## Performance Considerations

Hexify is designed with performance in mind. It uses efficient algorithms for color conversion and gradient creation, ensuring that your app remains snappy even when handling complex color operations.

## Contributing

We believe in the power of community! If you have ideas for improvements or have found a bug, we'd love to hear from you. Here's how you can contribute:

1. Fork the repository from [https://github.com/deep-esh7/hexify](https://github.com/deep-esh7/hexify)
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

We appreciate all contributions, big or small!

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Support

Running into issues or have questions? We're here to help! Please open an issue on the [GitHub repository](https://github.com/deep-esh7/hexify/issues).

## Acknowledgements

- A big thank you to all the contributors who have helped shape Hexify.
- Special thanks to the Flutter and Dart teams for providing an excellent framework and language.
- Inspired by the needs of developers who want an easier way to work with colors in Flutter.

## What's Next?

We're constantly working to improve Hexify and add new features. Stay tuned for updates, and feel free to suggest features you'd like to see in future versions!

Happy coding with Hexify! 🎨✨
