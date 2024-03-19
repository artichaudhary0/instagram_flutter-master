import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:instagram_flutter/responsive_layout/mobile_screen_layouts.dart';
import 'package:instagram_flutter/responsive_layout/responsive_layout.dart';
import 'package:instagram_flutter/responsive_layout/web_screen_layout.dart';
import 'package:instagram_flutter/screens/error_screen.dart';
import 'package:instagram_flutter/screens/signin_screen.dart';
import 'package:instagram_flutter/screens/signup_screen.dart';
import 'package:instagram_flutter/utils/colors.dart';

/*

Platform  Firebase App Id
web       1:682299634930:web:aac3858a8add837d48cc6b
android   1:682299634930:android:ee2cecb44c4baef048cc6b
ios       1:682299634930:ios:4c159315ad6e65fd48cc6b
macos     1:682299634930:ios:79d69ddb210bce7848cc6b

*/

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyDefEvSYajM3qaici0PVwa0_D_JsPhsMpI",
      appId: "1:682299634930:web:343bdc42f1e35f7f48cc6b",
      messagingSenderId: "682299634930",
      storageBucket: "instagram-fe645.appspot.com",
      projectId: "instagram-fe645",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: mobileBackgroundColor),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapShot) {
          if (snapShot.connectionState == ConnectionState.active) {
            if (snapShot.hasData) {
              return const ResponsiveLayout(
                webScreenLayout: WebScreenLayout(),
                mobileScreenLayout: MobileScreenLayout(),);
            } else if (snapShot.hasError) {
              return Error2Screen();
            } else {
              return const SignInScreen();
            }
          } else if (snapShot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (!snapShot.hasData) {
            return const SignUpScreen();
          } else {
            return Text(
              snapShot.error.toString(),
            );
          }
        },
      ),
    );
  }
}
