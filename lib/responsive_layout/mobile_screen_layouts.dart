import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_flutter/model/user_model.dart' as model;
import 'package:instagram_flutter/provider/user_provider.dart';
import 'package:instagram_flutter/screens/account_screen.dart';
import 'package:instagram_flutter/screens/home_screen.dart';
import 'package:instagram_flutter/screens/post_screen.dart';
import 'package:instagram_flutter/screens/reel_screen.dart';
import 'package:instagram_flutter/screens/search_screen.dart';
import 'package:provider/provider.dart';

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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    model.UsersModel? usersModel = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      body: Center(
        child: Text(usersModel!.username),
      ),
      // body: screen[currentIndex],
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: currentIndex,
      //   onTap: (value) {
      //     setState(() {
      //       currentIndex = value;
      //     });
      //   },
      //   items: [
      //     BottomNavigationBarItem(
      //         icon: Icon(
      //           Icons.home,
      //           color: Colors.white,
      //         ),
      //         label: ""),
      //     BottomNavigationBarItem(
      //         icon: Icon(
      //           Icons.search,
      //           color: Colors.white,
      //         ),
      //         label: ""),
      //     BottomNavigationBarItem(
      //         icon: Icon(
      //           Icons.post_add,
      //           color: Colors.white,
      //         ),
      //         label: ""),
      //     BottomNavigationBarItem(
      //         icon: Icon(
      //           Icons.slow_motion_video_rounded,
      //           color: Colors.white,
      //         ),
      //         label: ""),
      //     BottomNavigationBarItem(
      //         icon: Icon(
      //           Icons.account_circle_outlined,
      //           color: Colors.white,
      //         ),
      //         label: ""),
      //   ],
      // ),
    );
  }
}
