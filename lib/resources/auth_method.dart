import 'dart:developer' as log;
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram_flutter/model/user_model.dart';
import 'package:instagram_flutter/resources/storage_method.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,
    required Uint8List file,
  }) async {
    String res = "Some error Occurred";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          bio.isNotEmpty ||
          file != null) {
        // registering user in auth with email and password
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        String photoUrl = await StorageMethods()
            .uploadImageToStorage('profilePics', file, false);

        //calling userModel
        UsersModel userModel = UsersModel(
          username: username,
          email: email,
          password: password,
          bio: bio,
          followers: [],
          photoUrl: photoUrl,
          following: [],
        );

        // adding user in our database
        await _firebaseFirestore.collection("users").doc(cred.user!.uid).set(
          userModel.toJson(),
        );

        res = "success";
      } else {
        res = "Please enter all the fields";
      }
    } catch (e) {
      log.log("Error during user creation: $e");

      if (e is FirebaseAuthException) {
        if (e.code == 'email-already-in-use') {
          res = "Email is already in use.";
        } else if (e.code == 'weak-password') {
          res = "Weak password. Please use a stronger password.";
        } else {
          res = "User creation failed. Please try again later.";
        }
      } else {
        res = "Unexpected error during user creation.";
      }
      return res;
    }
    return res;
  }

  Future<String> signInUser({
    required String email,
    required String password,
  }) async {
    String res = "Some error Occurred";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        // registering usew2r in auth with email and password
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        res = "success";
      } else {
        res = "Please enter all the fields";
      }
    } on FirebaseAuthException catch (e) {
      log.log("Error during user creation: $e");
    }
    return res;
  }
}
