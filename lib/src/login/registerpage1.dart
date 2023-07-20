import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rean_ai/src/login/loginpage.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

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
              body()
            ]
          ),
        ]
      ),
        );
  }
  Column body(){
    return Column(
      children: [
        const Text('Enter your phone number to register',style: TextStyle(fontSize: 20,color: Colors.black87),),
        InkWell(
          child: Padding(
            padding: const EdgeInsets.only(top: 20,left: 38,right: 38),
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 20, 153, 153),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Phone',
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
        ),
        const SizedBox(height: 12,),
        const Column(
          children: [
            Text('We will send a verification code to the above number'),
          ],
        ),
        const SizedBox(height: 30,),
        Align(
          alignment: Alignment.centerRight,
          child: SizedBox(
            height: 60,
            width: 200,
            child: ElevatedButton(
              onPressed: (){}, 
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 20, 153, 153)),
                  shape: MaterialStateProperty.all(
                    const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20))
                    )
                  )
              ),
              child: const Padding(
                padding: EdgeInsets.only(left: 50),
                child: Row(
                  children: [
                    Text('Next'),
                    Icon(Icons.arrow_right)
                  ],
                        ),
              )),
          ),
        ),const SizedBox(height: 50,),
        haveNotAccount()
      ],
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
          child: Text("Already have account?",style: TextStyle(color: Colors.grey[500]),),
        ),
        GestureDetector(
          onTap: () {
            Get.to(const RegisterPage());
          },
          child: const Padding(
            padding: EdgeInsets.only(left: 6),
            child: Text(
              'Sign in',
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