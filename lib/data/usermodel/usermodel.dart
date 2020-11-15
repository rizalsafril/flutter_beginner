import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

class UserModel {
  String uid;
  UserModel(this.uid);

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");

  Future changeUser({
    String username,
    String email,
    String picture,
    String password,
  }) async {
    try {
      userCollection.doc(uid).set({
        "username": username,
        "email": email,
        "picture": picture,
        "password": password,
      });
    } on PlatformException catch (e) {
      print("something error $e");
      return null;
    }
  }
}
