import 'package:flutter/material.dart';
import 'package:flutter_turtle/flutter_turtle.dart';

/// An example from https://www.calormen.com/jslogo/
class TreePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tree')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20),
            Text('An example from https://www.calormen.com/jslogo/'),
            TurtleView(
              child: Container(
                width: double.infinity,
                height: 600,
              ),
              commands: [
                SetMacro('tree', [
                  IfElse((_) => _['size'] < 5.0, [
                    Forward((_) => _['size']),
                    Back((_) => _['size']),
                    Stop(),
                  ], [
                    Forward((_) => (_['size'] ~/ 3).toDouble()),
                    Left((_) => 30.0),
                    RunMacro(
                      'tree',
                      (_) => {'size': ((_['size'] * 2 ~/ 3)).toDouble()},
                    ),
                    Right((_) => 30.0),
                    Forward((_) => (_['size'] ~/ 6).toDouble()),
                    Right((_) => 25.0),
                    RunMacro(
                      'tree',
                      (_) => {'size': (_['size'] / 2).toDouble()},
                    ),
                    Left((_) => 25.0),
                    Forward((_) => (_['size'] ~/ 3).toDouble()),
                    Right((_) => 25.0),
                    RunMacro(
                      'tree',
                      (_) => {'size': (_['size'] / 2).toDouble()},
                    ),
                    Left((_) => 25.0),
                    Forward((_) => (_['size'] ~/ 6).toDouble()),
                    Back((_) => _['size'])
                  ])
                ]),
                Back((_) => 140.0),
                PenDown(),
                SetColor((_) => Colors.green),
                RunMacro('tree', (_) => {'size': 280.0}),
                PenUp(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
