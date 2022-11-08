import 'package:flutter/material.dart';
import 'package:core/core.dart';

class OnBoardingPage extends StatelessWidget {
  static const routeName = 'on-boarding';

  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            'assets/bg.png',
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logopt.png',
                width: 180,
                height: 180,
              ),
              Flexible(
                child: Text(
                  'PETANI TAMBAK',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.w500),
                ),
              ),
              Flexible(
                child: Text(
                  'Shrimp Farming. Manage land. Support the local',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.popAndPushNamed(context, '/home');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kButtonColor,
                  fixedSize: Size(MediaQuery.of(context).size.width - 100, 48),
                ),
                child: const Text(
                  'MULAI',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
