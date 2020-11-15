import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_beginner/data/usermodel/usermodel.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserService {
  Stream<User> get user {
    return FirebaseAuth.instance.authStateChanges();
  }

  ///Login with Google
  Future loginWithGoogle() async {
    try {
      GoogleSignInAccount googleSignInAccount = await GoogleSignIn().signIn();

      GoogleSignInAuthentication authentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: authentication.idToken,
        accessToken: authentication.accessToken,
      );

      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      User user = userCredential.user;
      if (user != null) {
        final QuerySnapshot result = await FirebaseFirestore.instance
            .collection("users")
            .where("id", isEqualTo: user.uid)
            .get();

        final List<DocumentSnapshot> documents = result.docs;

        if (documents.length == 0) {
          UserModel(user.uid).changeUser(
            username: user.displayName,
            email: user.email,
            picture: user.photoURL,
          );
        }
      }
    } on PlatformException catch (e) {
      print("Something wrong $e");
      return null;
    }
  }

  ///Register with email and password
  Future registerWithEmailPassword({
    String email,
    String password,
  }) async {
    try {
      UserCredential credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      User user = credential.user;
      if (user != null) {
        final QuerySnapshot result = await FirebaseFirestore.instance
            .collection("users")
            .where("id", isEqualTo: user.uid)
            .get();

        final List<DocumentSnapshot> document = result.docs;
        if (document.length == 0) {
          UserModel(user.uid).changeUser(
            username: user.displayName,
            email: user.email,
            picture: user.photoURL,
          );
        }
      }
    } on PlatformException catch (e) {
      print("something wrong : $e");
      return null;
    }
  }

  ///Login with email and password
  Future loginWithEmailPassword({
    String email,
    String password,
  }) async {
    try {
      UserCredential credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      User user = credential.user;

      if (user != null) {
        final QuerySnapshot result = await FirebaseFirestore.instance
            .collection("users")
            .where("id", isEqualTo: user.uid)
            .get();

        final List<DocumentSnapshot> document = result.docs;
        if (document.length == 0) {
          UserModel(user.uid).changeUser(
            username: user.displayName,
            email: user.email,
            picture: user.photoURL,
          );
        }
      }
    } on PlatformException catch (e) {
      print("Error with connection : $e");
      return null;
    }
  }

  ///Logout from App
  Future signOut() async {
    await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();
  }
}
