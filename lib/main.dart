import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:petani_tambak/presentation/pages/detail_page.dart';
import 'package:petani_tambak/presentation/pages/homepage.dart';
import 'package:petani_tambak/presentation/pages/profile_page.dart';
import 'package:petani_tambak/presentation/pages/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Petani Tambak',
      theme: ThemeData().copyWith(colorScheme: kColorScheme),
      home: const SplashScreen(),
      navigatorObservers: [routeObserver],
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/home':
            return MaterialPageRoute(builder: (_) => const Homepage());

          case DetailPage.routeName:
            return MaterialPageRoute(builder: (_) => const DetailPage());
          case ProfilePage.routeName:
            return MaterialPageRoute(builder: (_) => const ProfilePage());

          default:
            return MaterialPageRoute(builder: (_) {
              return const Scaffold(
                body: Center(
                  child: Text('Page not Found'),
                ),
              );
            });
        }
      },
    );
  }
}
