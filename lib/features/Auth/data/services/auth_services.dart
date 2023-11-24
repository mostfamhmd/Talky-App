import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  Future<UserCredential> signInWithEmailAndPassword(
      String email, String password) async {
    UserCredential userCredential = await _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password);
    _firebaseFirestore.collection("users").doc(userCredential.user!.uid).set({
      "uid": userCredential.user!.uid,
      "email": email,
    }, SetOptions(merge: false));
    return userCredential;
  }

  Future<UserCredential> signUpWithEmailAndPassword(
      String email,
      String password,
      String userName,
      String userImage,
      String aboutMe) async {
    UserCredential userCredential = await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);
    await _firebaseFirestore
        .collection("users")
        .doc(userCredential.user!.uid)
        .set({
      "UserName": userName,
      "uid": userCredential.user!.uid,
      "email": email,
      "AboutMe": aboutMe,
      "UserImage": userImage,
    }, SetOptions(merge: false));
    return userCredential;
  }

  Future<void> signOut() {
    return _firebaseAuth.signOut();
  }
}
