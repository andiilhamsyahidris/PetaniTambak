import 'package:flutter/material.dart';
import 'package:core/core.dart';
import 'package:petani_tambak/presentation/pages/profile_page.dart';
import 'package:petani_tambak/presentation/widgets/build_dashboard.dart';
import 'package:petani_tambak/presentation/widgets/build_indicator.dart';
import 'package:petani_tambak/presentation/widgets/build_monitoring.dart';

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
        leading: Image.asset(
          'assets/logopt.png',
          scale: 8,
        ),
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
              Text(
                'Monitoring',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: Colors.white),
              ),
              const SizedBox(
                height: 15,
              ),
              const BuildMonitoring(),
            ],
          ),
        ),
      ),
    );
  }
}
