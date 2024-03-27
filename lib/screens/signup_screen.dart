import 'dart:typed_data';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_flutter/resources/auth_method.dart';
import 'package:instagram_flutter/responsive_layout/web_screen_layout.dart';
import 'package:instagram_flutter/screens/signin_screen.dart';
import 'package:instagram_flutter/utils/utils.dart';
import '../responsive_layout/mobile_screen_layouts.dart';
import '../responsive_layout/responsive_layouts.dart';
import '../utils/colors.dart';
import '../widgets/custom_textfield.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _bioController = TextEditingController();
  TextEditingController _userNameController = TextEditingController();
  Uint8List? _pickedImage;
  bool _isLoading = false;

  // AuthMethods signUp = AuthMethods();

  void selectImage() async {
    Uint8List pickedImagePath =
        await pickedImage(imageSource: ImageSource.gallery);
    if (pickedImagePath != null) {
      setState(() {
        _pickedImage = pickedImagePath;
      });
    }
  }

  void signUpMethod() async {
    try {
      setState(() {
        _isLoading = true;
      });
      String res = await AuthMethods().signUpUser(
        email: _emailController.text,
        username: _userNameController.text,
        password: _passwordController.text,
        bio: _bioController.text,
        file: _pickedImage!,
      );
      setState(() {
        _isLoading = false;
      });

      if (res != 'success') {
        showSnackBar(context: context, content: res);
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const ResponsiveLayout(
                webScreenLayout: WebScreenLayout(),
                mobileScreenLayout: MobileScreenLayout(),
              );
            },
          ),
        );
      }
    } catch (error) {
      showSnackBar(context: context, content: error.toString());
      setState(() {
        _isLoading = false;
      });
    }
  }

  void navigateToSignIn() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SignInScreen(),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _userNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Container(),
                flex: 2,
              ),
              Image.asset(
                "assets/images/Instagram.png",
                color: primaryColor,
                height: 64,
              ),
              const SizedBox(
                height: 24,
              ),
              Stack(
                children: [
                  _pickedImage != null
                      ? CircleAvatar(
                          radius: 64,
                          backgroundImage: MemoryImage(
                            _pickedImage!,
                          ),
                        )
                      : const CircleAvatar(
                          radius: 64,
                          backgroundImage: AssetImage(
                            "assets/images/Instagram.png",
                          ),
                        ),
                  Positioned(
                    bottom: 0,
                    right: 5,
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: blueColor,
                      ),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: selectImage,
                        icon: const Icon(
                          Icons.add_a_photo,
                          // size: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              CustomTextField(
                controller: _userNameController,
                hintText: "Entry your username",
                keyboardType: TextInputType.text,
                obscure: false,
              ),
              const SizedBox(
                height: 24,
              ),
              CustomTextField(
                controller: _emailController,
                hintText: "Entry your email",
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 24,
              ),
              CustomTextField(
                controller: _passwordController,
                hintText: "Entry your password",
                keyboardType: TextInputType.text,
                obscure: true,
              ),
              const SizedBox(
                height: 24,
              ),
              CustomTextField(
                controller: _bioController,
                hintText: "Entry your bio",
                keyboardType: TextInputType.text,
                obscure: false,
              ),
              const SizedBox(
                height: 24,
              ),
              InkWell(
                onTap: signUpMethod,
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    color: blueColor,
                  ),
                  child: _isLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        )
                      : const Text("Register"),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(text: "Already have an account ? "),
                    TextSpan(
                      text: "Sign In",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = navigateToSignIn,
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 2,
                child: Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
