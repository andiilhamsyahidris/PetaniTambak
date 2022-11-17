import 'package:auth/sign_in/login_page.dart';
import 'package:auth/sign_up/signup_page.dart';
import 'package:core/core.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:petani_tambak/firebase_options.dart';
import 'package:core/presentation/pages/detail_page.dart';
import 'package:core/presentation/pages/homepage.dart';
import 'package:core/presentation/pages/profile_page.dart';
import 'package:core/presentation/pages/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
          case LoginPage.routeName:
            return MaterialPageRoute(builder: (_) => const LoginPage());
          case SignupPage.routeName:
            return MaterialPageRoute(builder: (_) => const SignupPage());

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
