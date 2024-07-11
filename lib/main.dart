import 'dart:async';

import 'dart:math';
import 'package:cnt_mobile/src/features/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const SplashhScreen(),
        routes: {
          '/navigation': (context) => const CNTNavigation(),
        },
      ),
    );
  }
}

class SplashhScreen extends StatefulWidget {
  const SplashhScreen({super.key});

  @override
  State<SplashhScreen> createState() => _SplashhScreenState();
}

class _SplashhScreenState extends State<SplashhScreen> with TickerProviderStateMixin {
  late AnimationController _sizeController;
  late Animation<double> _sizeAnimation;
  late AnimationController _rotationController;
  late List<AnimationController> _participantControllers;
  late List<Animation<double>> _participantAnimations;

  @override
  void initState() {
    super.initState();

    _sizeController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _sizeAnimation = Tween<double>(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(parent: _sizeController, curve: Curves.easeInOut),
    );

    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    );

    _participantControllers = List.generate(4, (index) {
      return AnimationController(
        vsync: this,
        duration: const Duration(seconds: 4),
      );
    });

    _participantAnimations = _participantControllers.map((controller) {
      return Tween<double>(begin: 0.0, end: 60.0).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeInOut),
      );
    }).toList();

    _sizeController.forward();
    _rotationController.repeat();

    Timer(const Duration(milliseconds: 1000), () {
      _participantControllers[0].forward();
    });

    Timer(const Duration(milliseconds: 2000), () {
      _participantControllers[1].forward();
    });

    Timer(const Duration(milliseconds: 3000), () {
      _participantControllers[2].forward();
    });

    Timer(const Duration(milliseconds: 4000), () {
      _participantControllers[3].forward();
    });

    Timer(const Duration(seconds: 8), () {
      Navigator.of(context).pushReplacementNamed('/navigation');
    });
  }

  @override
  void dispose() {
    _sizeController.dispose();
    _rotationController.dispose();
    for (var controller in _participantControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedBuilder(
              animation: _sizeAnimation,
              builder: (context, child) {
                return Container(
                  width: _sizeAnimation.value,
                  height: _sizeAnimation.value,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/swcnt.jpeg'),
                      fit: BoxFit.cover,
                    ),
                    shape: BoxShape.circle,
                  ),
                );
              },
            ),
            AnimatedBuilder(
              animation: _rotationController,
              builder: (context, child) {
                return Transform.rotate(
                  angle: _rotationController.value * 2 * pi,
                  child: Stack(
                    alignment: Alignment.center,
                    children: List.generate(4, (index) {
                      final double angle = (pi / 2) * index;
                      return AnimatedBuilder(
                        animation: _participantAnimations[index],
                        builder: (context, child) {
                          return Transform.translate(
                            offset: Offset(
                              _sizeAnimation.value * 1.5 * cos(angle),
                              _sizeAnimation.value * 1.5 * sin(angle),
                            ),
                            child: Container(
                              width: _participantAnimations[index].value,
                              height: _participantAnimations[index].value,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/swcnt$index.jpeg'),
                                  fit: BoxFit.cover,
                                ),
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.black, width: 1),
                              ),
                              child: Center(
                                child: CustomPaint(
                                  size: const Size(100, 100),
                                  painter: ConnectorPainter(
                                    start: Offset(
                                      _sizeAnimation.value * cos(angle),
                                      _sizeAnimation.value * sin(angle),
                                    ),
                                    end: Offset(
                                      _sizeAnimation.value * 1.5 * cos(angle),
                                      _sizeAnimation.value * 1.5 * sin(angle),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ConnectorPainter extends CustomPainter {
  final Offset start;
  final Offset end;

  ConnectorPainter({required this.start, required this.end});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2;

    canvas.drawLine(start, end, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
