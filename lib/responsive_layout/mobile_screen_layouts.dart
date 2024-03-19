import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({Key? key}) : super(key: key);

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  String userName = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  void getData() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    if (snap.exists) {
      // Check if the document exists
      Map<String, dynamic>? data = snap.data() as Map<String, dynamic>?;

      if (data != null && data.containsKey("userName")) {
        // Check if "userName" is present in the data
        setState(() {
          userName = data["userName"];
        });
        log(userName);
      } else {
        log("userName field is missing in the document");
      }
    } else {
      log("Document does not exist");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("This is mobile screen"),
      ),
    );
  }
}
