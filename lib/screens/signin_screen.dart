import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram_flutter/resources/auth_method.dart';
import 'package:instagram_flutter/responsive_layout/mobile_screen_layouts.dart';
import 'package:instagram_flutter/responsive_layout/web_screen_layout.dart';
import 'package:instagram_flutter/screens/signup_screen.dart';
import 'package:instagram_flutter/utils/utils.dart';

import '../responsive_layout/responsive_layouts.dart';
import '../utils/colors.dart';
import '../widgets/custom_textfield.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  AuthMethods signIn = AuthMethods();
  bool _isLoading = false;


  void signInMethod()async {
    try{
      setState(() {
        _isLoading = true;
      });
      String result = await AuthMethods().signInUser(
        email: _emailController.text,
        password: _passwordController.text,
      );
      setState(() {
        _isLoading = false;
      });

      if(result != 'success')
      {
        showSnackBar(context: context, content: result);
      }else{
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return ResponsiveLayout(webScreenLayout: WebScreenLayout(), mobileScreenLayout: MobileScreenLayout(),);
        },),);
      }


    }catch (error)
    {
      showSnackBar(context: context, content: error.toString(),);
      setState(() {
        _isLoading = false;
      });
    }

  }
  void navigateToSignUp() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SignUpScreen(),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
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
                height: 64,
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
                keyboardType: TextInputType.emailAddress,
                obscure: true,
              ),
              const SizedBox(
                height: 24,
              ),
              GestureDetector(
                onTap: signInMethod,

                // onTap: signInMethod,
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
                      : const Text("Login"),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(text: "Don't have an account ? "),
                    TextSpan(
                      text: "Sign Up",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = navigateToSignUp,
                    ),
                  ],
                ),
              ),
              Flexible(
                child: Container(),
                flex: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
