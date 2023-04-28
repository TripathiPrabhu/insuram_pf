import 'dart:async';

import 'package:flutter/material.dart';
import 'package:insuram_pf/auth_screen/login_screen.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = 'SplashScreen';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  initState() {
    super.initState();
    Timer(const Duration(seconds:2),
        () => Navigator.pushNamed(context, MyLogin.routeName));
    _controller = AnimationController(
      duration: const Duration(
        seconds: 3,
      ),
      vsync: this,
      value: 0.1,
    )..repeat(reverse: true);
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.bounceOut,
    );
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        home: Scaffold(
      backgroundColor: const Color(0XFF28527A),
      body: ScaleTransition(
        scale: _animation,
        alignment: Alignment.center,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "images/Insugo_logo.png",
                height: 200,
                width: 200,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
