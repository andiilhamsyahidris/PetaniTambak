import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Service {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static GoogleSignIn googleSignIn = GoogleSignIn(scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ]);

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

  static Future<SignInSignUpResult> signInWithGoogle() async {
    try {
      final googleSignInAccount = await googleSignIn.signIn();
      final googleSignInAuthentication =
          await googleSignInAccount?.authentication;
      final authCredential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication?.idToken,
        accessToken: googleSignInAuthentication?.accessToken,
      );
      final authResult = await _auth.signInWithCredential(authCredential);
      return SignInSignUpResult(authResult.user, '');
    } on PlatformException catch (e) {
      return SignInSignUpResult(null, e.toString());
    }
  }

  static void signOut() {
    _auth.signOut();
  }

  static Future<void> signOutGoogle() async {
    await googleSignIn.signOut();
  }
}

class SignInSignUpResult {
  User? user;
  String? message;

  SignInSignUpResult(this.user, this.message);
}
