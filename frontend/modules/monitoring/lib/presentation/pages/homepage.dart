import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:core/core.dart';
import 'package:monitoring/monitoring.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  HomepageState createState() => HomepageState();
}

class HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      appBar: AppBar(
        backgroundColor: kSecondaryColor,
        leading: CachedNetworkImage(
          imageUrl:
              'https://firebasestorage.googleapis.com/v0/b/petanitambak-cf143.appspot.com/o/logopt.png?alt=media&token=bb2eae68-6356-4bd4-b26e-6c612132df87',
          placeholder: (context, url) => const CircularProgressIndicator(),
        ),
        leadingWidth: 40,
        title: const Text(
          'Petani Tambak',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, ProfilePage.routeName);
            },
            icon: const Hero(
              tag: 'profile',
              child: Icon(
                Icons.account_circle,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BuildDashboard(),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  BuildIndicator(),
                ],
              ),
              const BuildMonitoring(),
            ],
          ),
        ),
      ),
    );
  }
}
