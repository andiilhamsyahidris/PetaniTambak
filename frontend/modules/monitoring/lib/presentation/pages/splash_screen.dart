import 'dart:async';

import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:monitoring/monitoring.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/splash';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const OnBoardingPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            'assets/bg.png',
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Image.asset(
            'assets/logopt.png',
            width: 150,
            height: 150,
          )
        ],
      ),
    );
  }
}
