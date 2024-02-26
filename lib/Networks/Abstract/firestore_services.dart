abstract class FireStoreServices {
  createUserModel(String uid, String email, String name);
  Future addUserToFireStore(String uid, String email, String name);
  Future getUserFromFireStore(String uid);
}
