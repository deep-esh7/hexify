import 'package:flutter/material.dart';
import 'package:hexify/hexify.dart';
import 'dart:math' show pi;

void main() {
  runApp(HexifyExampleApp());
}

class HexifyExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hexify Examples'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Basic Color Creation Section
                Text('Basic Color Creation', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),

                Text('Create color from hex code with #'),
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Hexify(colorCode: '#FF5733'),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                SizedBox(height: 5),
                Text('*Example of creating a color from hex code with \'#\''),
                SizedBox(height: 15),

                Text('Create color from hex code without #'),
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Hexify(colorCode: 'FF5733'),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                SizedBox(height: 5),
                Text('*Example of creating a color from hex code without \'#\''),
                SizedBox(height: 20),

                // Opacity Section
                Text('Opacity', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),

                Text('Color with 50% opacity'),
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Hexify(colorCode: '#FF5733', opacity: 0.5),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                SizedBox(height: 5),
                Text('*Example of creating a color with 50% opacity'),
                SizedBox(height: 20),

                // Shading Section
                Text('Shading', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),

                Text('Color with 70% shade'),
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Hexify(colorCode: '#FF5733', shade: 0.7),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                SizedBox(height: 5),
                Text('*Example of creating a color with 70% shade'),
                SizedBox(height: 20),

                // RGBO Colors Section
                Text('RGBO Colors', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),

                Text('Color from RGBO values'),
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Hexify(colorCode: '255, 87, 51, 0.8'),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                SizedBox(height: 5),
                Text('*Example of creating a color from RGBO values'),
                SizedBox(height: 20),

                // Linear Gradients Section
                Text('Linear Gradients', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),

                Text('Basic Linear Gradient'),
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    gradient: Hexify(
                      gradientType: HexifyGradientType.linearGradient,
                      firstColor: '#FF5733',
                      secondColor: '3498DB',
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                SizedBox(height: 5),
                Text('*Example of creating a basic linear gradient'),
                SizedBox(height: 15),

                Text('Linear Gradient with Three Colors'),
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    gradient: Hexify(
                      gradientType: HexifyGradientType.linearGradient,
                      firstColor: 'FF5733',
                      secondColor: '#3498DB',
                      thirdColor: '2ECC71',
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                SizedBox(height: 5),
                Text('*Example of creating a linear gradient with three colors'),
                SizedBox(height: 20),

                // Radial Gradients Section
                Text('Radial Gradients', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),

                Text('Basic Radial Gradient'),
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    gradient: Hexify(
                      gradientType: HexifyGradientType.radialGradient,
                      firstColor: '#FF5733',
                      secondColor: '3498DB',
                      radius: 0.8,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                SizedBox(height: 5),
                Text('*Example of creating a basic radial gradient'),
                SizedBox(height: 20),

                // Advanced Gradient Options Section
                Text('Advanced Gradient Options', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),

                Text('Linear Gradient with Custom Stops'),
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    gradient: Hexify(
                      gradientType: HexifyGradientType.linearGradient,
                      firstColor: 'FF5733',
                      secondColor: '#3498DB',
                      thirdColor: '2ECC71',
                      stops: [0.2, 0.5, 0.8],
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                SizedBox(height: 5),
                Text('*Example of creating a linear gradient with custom stops'),
                SizedBox(height: 15),

                Text('Radial Gradient with Custom Center and Focal Point'),
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    gradient: Hexify(
                      gradientType: HexifyGradientType.radialGradient,
                      firstColor: '#FF5733',
                      secondColor: '3498DB',
                      center: Alignment(0.3, -0.5),
                      focal: Alignment(-0.1, 0.6),
                      focalRadius: 0.2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                SizedBox(height: 5),
                Text('*Example of creating a radial gradient with custom center and focal point'),
                SizedBox(height: 15),

                Text('Linear Gradient with TileMode'),
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    gradient: Hexify(
                      gradientType: HexifyGradientType.linearGradient,
                      firstColor: 'FF5733',
                      secondColor: '#3498DB',
                      tileMode: TileMode.repeated,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                SizedBox(height: 5),
                Text('*Example of creating a linear gradient with TileMode.repeated'),
                SizedBox(height: 15),

                Text('Linear Gradient with Transform'),
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    gradient: Hexify(
                      gradientType: HexifyGradientType.linearGradient,
                      firstColor: '#FF5733',
                      secondColor: '3498DB',
                      transform: GradientRotation(pi / 4),
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                SizedBox(height: 5),
                Text('*Example of creating a linear gradient with a 45-degree rotation transform'),
                SizedBox(height: 20),

                Text('Radial Gradient with Opacity for Each Color'),
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    gradient: Hexify(
                      gradientType: HexifyGradientType.radialGradient,
                      firstColor: 'FF5733',
                      secondColor: '#3498DB',
                      opacityOfFirstColor: 0.7,
                      opacityOfSecondColor: 0.3,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                SizedBox(height: 5),
                Text('*Example of creating a radial gradient with different opacities for each color'),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );

  }
}