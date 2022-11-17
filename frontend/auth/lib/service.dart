import 'package:firebase_auth/firebase_auth.dart';

class Service {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<SignInSignUpResult> signInWithEmail(
      {required String email, required String pass}) async {
    try {
      UserCredential result =
          await _auth.signInWithEmailAndPassword(email: email, password: pass);
      return SignInSignUpResult(result.user!, '');
    } on FirebaseAuthException catch (e) {
      return SignInSignUpResult(null, e.message);
    }
  }

  static Future<SignInSignUpResult> createUser(
      {required String email, required String pass}) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: pass);
      return SignInSignUpResult(result.user, '');
    } on FirebaseAuthException catch (e) {
      return SignInSignUpResult(null, e.message);
    }
  }

  static void signOut() {
    _auth.signOut();
  }
}

class SignInSignUpResult {
  User? user;
  String? message;

  SignInSignUpResult(this.user, this.message);
}
