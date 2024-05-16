import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PizzaAnimationScreen(),
    );
  }
}

class PizzaAnimationScreen extends StatefulWidget {
  @override
  _PizzaAnimationScreenState createState() => _PizzaAnimationScreenState();
}

class _PizzaAnimationScreenState extends State<PizzaAnimationScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _shakeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..repeat(reverse: true);

    _rotationAnimation = Tween(begin: 0.0, end: 10.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(0.0, 1, curve: Curves.linear),
      reverseCurve: Interval(0.0, 1, curve: Curves.linear),
    ));

    _scaleAnimation = Tween(begin: 1.0, end: 0.5).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(0.0, 0.1, curve: Curves.easeInOut), // Changed the curve interval to start at 0.0
      reverseCurve: Interval(0.9, 1.0, curve: Curves.easeInOut), // Changed the curve interval to end at 1.0
    ));

    _slideAnimation = Tween(begin: Offset(-320.0, 0.0), end: Offset(320.0, 0.0)).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(0.1, 0.9, curve: Curves.easeInOut), // Adjusted the curve interval to start after scaling
    ));

    _shakeAnimation = Tween(begin: 0.0, end: 0.2).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticIn,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.translate(
              offset: _slideAnimation.value,
              child: Transform.rotate(
                angle: _rotationAnimation.value + _shakeAnimation.value,
                child: Transform.scale(
                  scale: _scaleAnimation.value,
                  child: child,
                ),
              ),
            );
          },
          child: Image.asset('assets/images/plat.png', width: 500, height: 500),
        ),
      ),
    );
  }
}
