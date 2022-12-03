import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
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
          CachedNetworkImage(
            imageUrl:
                'https://firebasestorage.googleapis.com/v0/b/petanitambak-cf143.appspot.com/o/bg.png?alt=media&token=3c51b506-8161-40cc-9596-c00aaabd3c82',
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(),
            ),
            fadeInDuration: const Duration(milliseconds: 200),
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          CachedNetworkImage(
            imageUrl:
                'https://firebasestorage.googleapis.com/v0/b/petanitambak-cf143.appspot.com/o/logopt.png?alt=media&token=bb2eae68-6356-4bd4-b26e-6c612132df87',
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(),
            ),
            width: 150,
            height: 150,
          ),
        ],
      ),
    );
  }
}
