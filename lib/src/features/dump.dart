// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Nanotechnology',
//       navigatorKey: navigatorKey,
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const SplashScreen(),
//     );
//   }
// }
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
// class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
//   late AnimationController _sizeController;
//   late Animation<double> _sizeAnimation;
//   late AnimationController _borderRadiusController;
//   late Animation<double> _borderRadiusAnimation;
//   @override
//   void initState() {
//     super.initState();
//     _sizeController = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 4),
//     );
//     _sizeAnimation = Tween<double>(begin: 50.0, end: MediaQuery.of(navigatorKey.currentContext!).size.height).animate(
//       CurvedAnimation(parent: _sizeController, curve: Curves.easeInOutCubic),
//     );
//     _borderRadiusController = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 2),
//     );
//     _borderRadiusAnimation = Tween<double>(begin: 50.0, end: 0.0).animate(
//       CurvedAnimation(parent: _borderRadiusController, curve: Curves.easeInOut),
//     );
//     _sizeController.forward();
//     _sizeController.addStatusListener((status) {
//       if (status == AnimationStatus.completed) {
//         _borderRadiusController.forward();
//       }
//     });
//     Timer(const Duration(seconds: 4), () {
//       Navigator.of(context).pushReplacement(
//         MaterialPageRoute(builder: (_) => const HomePage()),
//       );
//     });
//   }
//   @override
//   void dispose() {
//     _sizeController.dispose();
//     _borderRadiusController.dispose();
//     super.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: AnimatedBuilder(
//           animation: _sizeAnimation,
//           builder: (context, child) {
//             return AnimatedBuilder(
//               animation: _borderRadiusAnimation,
//               builder: (context, child) {
//                 return Container(
//                   width: _sizeAnimation.value,
//                   height: _sizeAnimation.value,
//                   decoration: BoxDecoration(
//                     image: const DecorationImage(
//                       image: AssetImage('assets/swcnt.jpeg'),
//                       fit: BoxFit.cover,
//                     ),
//                     borderRadius: BorderRadius.circular(_borderRadiusAnimation.value),
//                   ),
//                 );
//               },
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
