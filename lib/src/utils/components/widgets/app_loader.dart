import 'dart:math';
import 'package:flutter/material.dart';

class AppLoader extends StatefulWidget {
  const AppLoader({super.key, this.color = Colors.white, this.size = 25});

  final Color color;
  final double size;
  @override
  State<AppLoader> createState() => _AppLoaderState();
}

class _AppLoaderState extends State<AppLoader> with TickerProviderStateMixin {
  late AnimationController _rotationController;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();

    _rotationController = AnimationController(
      duration: const Duration(milliseconds: 1800), // Adjust the duration as needed
      vsync: this,
    );

    _rotationAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween(begin: 0.0, end: 1.0),
        weight: 1,
      ),
    ]).animate(_rotationController);

    _rotationController.repeat();
  }

  @override
  void dispose() {
    _rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RotationTransition(
        turns: _rotationAnimation,
        child: Container(
          width: widget.size,
          height: widget.size,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: CustomPaint(
            size: const Size(30, 30), // Adjust the size as needed
            painter: LoadingIndicatorPainter(color: widget.color),
          ),
        ),
      ),
    );
  }
}

class LoadingIndicatorPainter extends CustomPainter {
  LoadingIndicatorPainter({required this.color}) : super();

  final Color color;
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color // Change the color as needed
      ..style = PaintingStyle.fill;

    final radius = size.width / 2;
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    const angle = pi * 2 / 10; // 10 dots forming a circle

    for (int i = 0; i < 10; i++) {
      final x = centerX + radius * cos(i * angle);
      final y = centerY + radius * sin(i * angle);
      canvas.drawCircle(Offset(x, y), 3, paint); // Adjust the dot size as needed
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
