import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:v_chat/Networks/Abstract/firestore_services.dart';
import 'package:v_chat/models/user_fields.dart';

class FirebaseFireStoreClass extends FireStoreServices {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future addUserToFireStore(String uid, String email, String name) async {
    final chatUser = createUserModel(uid, email, name);
    final data = chatUser.toJson();
    try {
      await firestore.collection("Users").doc(uid).set(data);
    } catch (e) {}
  }

  @override
  ChatUser createUserModel(String uid, String email, String name) {
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
    return chatUser;
  }

  @override
  Future getUserFromFireStore(String uid) async {
    try {
      final data = await firestore.collection('Users').doc(uid).get();
    } catch (e) {}
  }
}
