import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:v_chat/Networks/firebase_auth.dart';
import 'package:v_chat/Networks/firebase_firestore.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLoading = false;

  FirebaseAuthClass fauth = FirebaseAuthClass();
  User? _user;
  FirebaseFireStoreClass fstore = FirebaseFireStoreClass();

  User? get user => _user;

  bool get isLoading => _isLoading;

  Future<User?> loginWithFirebase(String email, String password) async {
    setLoader(true);
    _user = await fauth.loginUserWithFirebase(email, password);
    setLoader(false);
    return _user;
  }

  bool userLoggedIn() {
    var login = fauth.isUserLoggedIn();
    notifyListeners();
    return login;
  }

  Future<User?> signUpWithFirebase(
      String email, String password, String name) async {
    setLoader(true);

    _user = await fauth.signupUserWithFirebase(email, password, name);

    if (_user != null) {
      await fstore.addUserToFireStore(_user!.uid, email, name);
    }

    setLoader(false);
    return _user;
  }

  void logOutUser() {
    fauth.signOut();
  }

  // Future<bool> addUserToFireStore(String uid, String email, String name) async {
  //   var value = false;
  //   try {
  //     await fstore.addUserToFireStore(uid, email, name);
  //     value = true;
  //   } catch (e) {
  //     value = false;
  //   }
  //   return value;
  // }

  setLoader(bool loader) {
    _isLoading = loader;
    notifyListeners();
  }
}

final authProvider =
    ChangeNotifierProvider<AuthProvider>((ref) => AuthProvider());
