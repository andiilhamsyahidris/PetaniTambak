import 'package:auth/auth.dart';
import 'package:auth/service.dart';
import 'package:auth/sign_in/login_page.dart';
import 'package:core/common/constant.dart';
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
          padding: const EdgeInsets.symmetric(horizontal: 60.0),
          child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate([
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 4 - 20,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/logopt.png',
                        scale: 4,
                      )
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
              )
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
