import 'package:auth/auth.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CachedNetworkImage(
                imageUrl:
                    'https://firebasestorage.googleapis.com/v0/b/petanitambak-cf143.appspot.com/o/logopt.png?alt=media&token=bb2eae68-6356-4bd4-b26e-6c612132df87',
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
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
                  Navigator.popAndPushNamed(context, LoginPage.routeName);
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
