import 'dart:async';

import 'package:auth/service.dart';
import 'package:auth/sign_up/signup_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:monitoring/monitoring.dart';

class LoginPage extends StatefulWidget {
  static const routeName = 'login';

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  var value = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      body: _buildLoginPage(),
    );
  }

  void _togglePasswordView() {
    setState(() {
      value = !value;
    });
  }

  Widget _buildLoginPage() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 60.0, right: 60.0),
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate([
                SizedBox(
                  height: MediaQuery.of(context).size.height / 4 - 20,
                ),
                Row(
                  children: [
                    CachedNetworkImage(
                      imageUrl:
                          'https://firebasestorage.googleapis.com/v0/b/petanitambak-cf143.appspot.com/o/logopt.png?alt=media&token=bb2eae68-6356-4bd4-b26e-6c612132df87',
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      width: 50,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Masuk',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(color: Colors.white),
                ),
                Text(
                  'Silahkan masuk untuk melihat kondisi tambak',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.white38),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: TextStyle(color: kButtonColor.withOpacity(0.5)),
                    border: const UnderlineInputBorder(
                      borderSide: BorderSide(color: kButtonColor),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: kButtonColor),
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _passController,
                  obscureText: value,
                  decoration: InputDecoration(
                    hintText: 'Kata Sandi',
                    hintStyle: TextStyle(color: kButtonColor.withOpacity(0.5)),
                    hintTextDirection: TextDirection.ltr,
                    border: const UnderlineInputBorder(
                      borderSide: BorderSide(color: kButtonColor),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: kButtonColor),
                    ),
                    suffixIcon: IconButton(
                      splashColor: Colors.transparent,
                      onPressed: () {
                        _togglePasswordView();
                      },
                      icon: const Icon(
                        Icons.remove_red_eye,
                        color: kButtonColor,
                        size: 18,
                      ),
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Flexible(
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Lupa Kata Sandi?',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: kButtonColor.withOpacity(0.5)),
                        ),
                      ),
                    )
                  ],
                ),
                ElevatedButton(
                  onPressed: () async {
                    login();
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize:
                        Size.fromWidth(MediaQuery.of(context).size.width),
                    backgroundColor: kButtonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: const Text(
                    'MASUK',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Belum Punya Akun?',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: kButtonColor.withOpacity(0.5)),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, SignupPage.routeName);
                          },
                          child: Text(
                            'Daftar',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.white70),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 1,
                  child: Container(
                    decoration:
                        BoxDecoration(color: kButtonColor.withOpacity(0.5)),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Atau login lewat',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: kButtonColor.withOpacity(0.5)),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(2.0),
                  child: InkWell(
                    onTap: () async {
                      loginGoogle();
                    },
                    child: CachedNetworkImage(
                      imageUrl:
                          'https://firebasestorage.googleapis.com/v0/b/petanitambak-cf143.appspot.com/o/google.png?alt=media&token=c843b23b-5622-4787-aca2-d782fb066489',
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      height: 40,
                    ),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  void login() async {
    SignInSignUpResult result = await Service.signInWithEmail(
        email: _emailController.text, pass: _passController.text);

    if (result.message == 'Given String is empty or null') {
      showDialog(
        context: context,
        builder: (context) => const Center(
          child: CustomInformation(
              title: 'Data Masih Kosong',
              subtitle: 'Segera isi terlebih dahulu ya'),
        ),
      );
    } else if (result.user != null) {
      Navigator.popAndPushNamed(context, '/home');
    } else {
      showDialog(
        context: context,
        builder: (context) => const Center(
          child: CustomInformation(
              title: 'Ups Akun tidak Ditemukan',
              subtitle: 'Silahkan daftarkan dulu ya'),
        ),
      );
    }
  }

  void loginGoogle() async {
    SignInSignUpResult result = await Service.signInWithGoogle();

    if (result.message ==
        'PlatformException(network_error, com.google.android.gms.common.api.ApiException: 7: , null, null)') {
      showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CustomInformation(
                title: 'Ups Tidak ada Jaringan',
                subtitle: 'Silahkan coba lagi ya'),
          );
        },
      );
    }
    Navigator.popAndPushNamed(context, '/home');
  }
}
