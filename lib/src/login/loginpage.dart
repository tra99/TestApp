import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rean_ai/src/login/registerpage1.dart';
import 'package:rean_ai/src/screen/homepage.dart';

import 'loginpage2.dart';

class GoogleSignInScreen extends StatefulWidget {
  @override
  _GoogleSignInScreenState createState() => _GoogleSignInScreenState();
}

class _GoogleSignInScreenState extends State<GoogleSignInScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<User?> _handleSignIn() async {
    try {
      // Prompt the user to select a Google account.
      await _googleSignIn.signOut();
      GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return null;

      // Authenticate with Firebase using the Google account.
      GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential = await _auth.signInWithCredential(credential);
      return userCredential.user;
    } catch (e) {
      print("Error signing in with Google: $e");
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
      children: [
        const Positioned(
            width: 450,
            top: -90,
            right: -200,
            child: Image(image: AssetImage('assets/RectTopBlue.png'))),
        const Positioned(
            width: 400,
            bottom: -100,
            left: -100,
            child: Image(image: AssetImage('assets/RectTopBlue.png'))),
        Column(
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
              'Welcome to Rean app',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 50,
              width: 300,
              child: ElevatedButton(onPressed: ()async{
                User? user=await _handleSignIn();
                if(user != null){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                  print('User signed in: ${user.displayName}');
                }else{
                  print('Google sign in falied');
                }
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 20, 153, 153)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)
                  )
                )
              ), child: const Text('Login',style: TextStyle(fontSize: 18),),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 50,
              width: 300,
              child: ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const RegisterPage()));
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 20, 153, 153)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)
                  )
                )
              ), child: const Text('Register',style: TextStyle(fontSize: 18),),
              ),
            ), 
          ],
        )
      ],
    ));
  } 
}
