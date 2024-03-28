import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_flutter/screens/account_screen.dart';
import 'package:instagram_flutter/screens/home_screen.dart';
import 'package:instagram_flutter/screens/post_screen.dart';
import 'package:instagram_flutter/screens/reel_screen.dart';
import 'package:instagram_flutter/screens/search_screen.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({Key? key}) : super(key: key);

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  String username = "";

  int currentIndex = 0;

  List<Widget> screen = [
    HomeScreen(),
    SearchScreen(),
    PostScreen(),
    ReelScreen(),
    AccountScreen(),
  ];

  void getData() async {
    DocumentSnapshot data = await FirebaseFirestore.instance.collection("users").doc(
          FirebaseAuth.instance.currentUser!.uid,
        ).get();
    print(data.data());
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  // void getData() async {
  //   DocumentSnapshot snap = await FirebaseFirestore.instance
  //       .collection("users")
  //       .doc(FirebaseAuth.instance.currentUser!.uid)
  //       .get();
  //   print(snap.data());
  //
  //   if (snap.exists) {
  //     // Check if the document exists
  //     Map<String, dynamic>? data = snap.data() as Map<String, dynamic>?;
  //
  //     if (data != null && data.containsKey("username")) {
  //       setState(() {
  //         userName = data["usename"];
  //       });
  //       log(userName);
  //     } else {
  //       log("userName field is missing in the document");
  //     }
  //   } else {
  //     log("Document does not exist");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.post_add,
                color: Colors.white,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.slow_motion_video_rounded,
                color: Colors.white,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle_outlined,
                color: Colors.white,
              ),
              label: ""),
        ],
      ),
    );
  }
}
