import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseServices {
  Future<User?> loginUserWithFirebase(String email, String password);
  Future<User?> signupUserWithFirebase(
      String email, String password, String name);
  void signOut();
  bool isUserLoggedIn();
}
