import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UsersModel{
  final String username;
  final String email;
  final String password;
  final String bio;
  final List followers;
  final List following;
  final String photoUrl;

  UsersModel({
    required this.username,
    required this.email,
    required this.password,
    required this.bio,
    required this.followers,
    required this.following,
    required this.photoUrl,
  });

  Map<String,dynamic> toJson() =>
      {
        "username" : username,
        "email" : email,
        "password" : password,
        "bio" : bio,
        "followers" : followers,
        "following" : following,
        "photoUrl" : photoUrl,
      };
  static User fromSnap(DocumentSnapshot snap){
    var snapShot = snap.data() as Map<String, dynamic>;
    return User(
      username: snapShot['username'],
      uid: snapShot['uid'],
      email: snapShot['email'],
      password: snapShot['password'],
      bio: snapShot['bio'],
      followers: snapShot['followers'],
      following: snapShot['following'],
      photoUrl: snapShot['photoUrl'],
    );
  }

}