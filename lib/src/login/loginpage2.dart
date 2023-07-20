// ignore_for_file: prefer_typing_uninitialized_variables
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rean_ai/src/login/loginpage.dart';
import 'package:rean_ai/src/login/registerpage1.dart';
import 'package:rean_ai/src/screen/homepage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage2 extends StatelessWidget {
  final title;
  const LoginPage2({Key? key,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Positioned(
            width: 450,
            top: -90,
            right: -200,
            child: Image(image: AssetImage('assets/RectTopBlue.png')),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 160,
                ),
                const Center(
                  child: Image(
                    image: AssetImage('assets/logo-02.png'),
                    width: 260,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Enter your phone number to Login',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40),
                  
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 20, 153, 153),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: 'Email',
                                labelStyle:
                                    TextStyle(color: Colors.grey.shade300),
                                prefixIcon: const Text(
                                  '+855',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                                border: InputBorder.none,
                                prefixIconConstraints: const BoxConstraints(
                                    minWidth:
                                        40), // Set minimum width for prefixIcon
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 20, 153, 153),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: TextField(
                              decoration: InputDecoration(
                                suffixIcon: const Icon(
                                  Icons.remove_red_eye_rounded,
                                  color: Colors.white,
                                ),
                                labelText: 'Password',
                                labelStyle:
                                    TextStyle(color: Colors.grey.shade300),
                                prefixIcon: const Icon(
                                  Icons.key_outlined,
                                  color: Colors.white,
                                ),
                                border: InputBorder.none,
                                prefixIconConstraints: const BoxConstraints(
                                    minWidth:
                                        40), // Set minimum width for prefixIcon
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      forgetPassword(),
                      loginBtn(),
                      const SizedBox(height: 20,),
                      haveNotAccount()
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  GestureDetector forgetPassword() {
    return GestureDetector(
      onTap: () {
        // Get.to(const LoginPage());
      },
      child: const Padding(
        padding: EdgeInsets.only(left: 220),
        child: Text(
          'Forget Password',
          style: TextStyle(
              color: Color.fromARGB(255, 20, 153, 153),
              decoration: TextDecoration.underline,
              decorationColor: Color.fromARGB(255, 20, 153, 153)),
        ),
      ),
    );
  }

  GestureDetector loginBtn() {
    return GestureDetector(
      child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 190),
          child: ElevatedButton(
              onPressed: () {
                Get.to(const HomePage());
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 20, 153, 153)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)))),
              child: const Padding(
                padding: EdgeInsets.all(14),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 12),
                      child: Text(
                        'Login',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Icon(Icons.arrow_right)
                  ],
                ),
              ))),
    );
  }

  Row haveNotAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            // Get.to(const LoginPage());
          },
          child: Text("Don't have an account?",style: TextStyle(color: Colors.grey[500]),),
        ),
        GestureDetector(
          onTap: () {
            Get.to(const RegisterPage());
          },
          child: const Padding(
            padding: EdgeInsets.only(left: 6),
            child: Text(
              'Register',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Color.fromARGB(255, 20, 153, 153)),
            ),
          ),
        )
      ],
    );
  }
  
}
