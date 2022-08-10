import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final route;
  const SplashScreen({Key? key, required this.route}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: (5)),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Lottie.network(
        'https://assets1.lottiefiles.com/packages/lf20_QSqGL0.json',
        controller: _controller,
        height: MediaQuery.of(context).size.height * 1,
        animate: true,
        onLoaded: (composition) {
          _controller
            ..duration = composition.duration
            ..forward().whenComplete(
              () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => widget.route),
              ),
            );
        },
      ),
      backgroundColor: Colors.white,
    );
  }
}
