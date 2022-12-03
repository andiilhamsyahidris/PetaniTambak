import 'package:auth/auth.dart';
import 'package:auth/service.dart';
import 'package:auth/sign_in/login_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/common/constant.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  static const routeName = 'signup';

  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  var value = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35.0),
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
                    'Daftar',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(color: Colors.white),
                  ),
                  Text(
                    'Silahkan daftar terlebih dahulu untuk melihat kondisi tambak',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.white38),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      hintText: 'Nama',
                      hintStyle:
                          TextStyle(color: kButtonColor.withOpacity(0.5)),
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
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      hintStyle:
                          TextStyle(color: kButtonColor.withOpacity(0.5)),
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
                      hintStyle:
                          TextStyle(color: kButtonColor.withOpacity(0.5)),
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
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      SignInSignUpResult result = await Service.createUser(
                          email: _emailController.text,
                          pass: _passController.text);
                      if (result.user != null) {
                        Navigator.pushNamed(context, LoginPage.routeName);
                      } else if (result.message ==
                          'The email address is already in use by another account.') {
                        showDialog(
                          context: context,
                          builder: (context) => const Center(
                            child: CustomInformation(
                                title: 'Email telah Terdaftar',
                                subtitle: 'Coba email yang lain ya'),
                          ),
                        );
                      } else if (result.message ==
                          'Given String is empty or null') {
                        showDialog(
                          context: context,
                          builder: (context) => const Center(
                            child: CustomInformation(
                                title: 'Data masih kosong',
                                subtitle: 'Segera isi terlebih dahulu ya'),
                          ),
                        );
                      } else if (result.message ==
                          'The email address is badly formatted.') {
                        showDialog(
                          context: context,
                          builder: (context) => const Center(
                            child: CustomInformation(
                                title: 'Format email salah',
                                subtitle:
                                    'Silahkan perbaiki terlebih dahulu ya'),
                          ),
                        );
                      }
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
                      'DAFTAR',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Sudah Punya Akun?',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: kButtonColor.withOpacity(0.5)),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, LoginPage.routeName);
                            },
                            child: Text(
                              'Masuk',
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
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      value = !value;
    });
  }
}
