import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// import 'package:google_sign_in/google_sign_in.dart';
import 'package:v_chat/models/user_fields.dart';

class FirebaseServices {
  FirebaseAuth _auth = FirebaseAuth.instance;
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  User? get currentUser => _auth.currentUser;
  // GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<User?> signUpWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == ' email-already-in-use') {
        Fluttertoast.showToast(
            msg: 'Email Already in use',
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.blue,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        Fluttertoast.showToast(
            msg: 'An error occured: ${e.code}',
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.blue,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }
    return null;
  }

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        Fluttertoast.showToast(
            msg: 'Wrong email or password',
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.blue,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        Fluttertoast.showToast(
            msg: 'error : ${e.code}',
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.blue,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }

    return null;
  }

  createUserModel(String uid, String email, String name) {
    final time = DateTime.now().millisecondsSinceEpoch.toString();

    final chatUser = ChatUser(
        name: name,
        about: 'Hi I am doing fine',
        createdAt: DateTime.now().millisecondsSinceEpoch.toString(),
        email: email,
        id: uid,
        image: '',
        isOnline: false,
        lastActive: time,
        pushToken: '');
    // try {
    //   await firestore.collection("Users").doc(uid).set(chatUser.toJson());
    // } catch (e) {}
  }

  // Future<void> setCurrentUser(BuildContext context) async {
  //   final currentUser = _auth.currentUser;
  //   if (currentUser != null) {
  //     DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
  //         .collection('Users')
  //         .doc(currentUser.uid)
  //         .get();
  //     final userData = userSnapshot.data() as Map<String, dynamic>;
  //     final user = ChatUser.fromJson(userData);
  //     ref.read(currentUserProvider.notifier).state = user;
  //     print("BuildContext in setcurrentuser in firebase: $context");
  //   } else {
  //     print('no user found');
  //   }
  // }

  // Future<User?> googleSignIn() async {
  //   final GoogleSignInAccount? _googleSignInAccount =
  //       await _googleSignIn.signIn();

  //   if (_googleSignInAccount != null) {
  //     final GoogleSignInAuthentication googleSignInAuthentication =
  //         await _googleSignInAccount.authentication;

  //     final AuthCredential credential = GoogleAuthProvider.credential(
  //         idToken: googleSignInAuthentication.idToken,
  //         accessToken: googleSignInAuthentication.accessToken);
  //     UserCredential userCredential =
  //         await _auth.signInWithCredential(credential);
  //     return userCredential.user;
  //   }
  // }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
