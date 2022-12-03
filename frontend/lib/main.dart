import 'dart:async';
import 'dart:io';

import 'package:auth/sign_in/login_page.dart';
import 'package:auth/sign_up/signup_page.dart';
import 'package:core/core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:monitoring/monitoring.dart';
import 'package:petani_tambak/firebase_options.dart';

late Directory dir;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late StreamSubscription<User?> user;

  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.idTokenChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
  }

  @override
  void dispose() {
    user.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Petani Tambak',
      theme: ThemeData().copyWith(
          colorScheme: kColorScheme, scaffoldBackgroundColor: kMainColor),
      initialRoute: FirebaseAuth.instance.currentUser == null
          ? SplashScreen.routeName
          : '/home',
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
          case SplashScreen.routeName:
            return MaterialPageRoute(builder: (_) => const SplashScreen());
          default:
            return null;
        }
      },
    );
  }
}
