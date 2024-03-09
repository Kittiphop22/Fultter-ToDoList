import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onboarding_screen/component/my_button.dart';
import 'package:onboarding_screen/component/my_textfield.dart';
import 'package:onboarding_screen/screen/home_screen.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final repasswordController = TextEditingController();

  signupWithEmail() async {
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        //Name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        //repassword:repasswordController.text,
      );
      print("create Successfully");
    }on FirebaseAuthException catch (e){
      print('failed with error code: ${e.code}');
      print(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: Column(
          children: [
            Spacer(),
            Text(
              'Welcome to our community',
              style: GoogleFonts.lato(
                textStyle: Theme.of(context).textTheme.displayLarge,
                fontSize: 24,
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.normal,
              ),
            ),
            Text(
              '\nTo get started, please provide you information to create an account',
              style: GoogleFonts.lato(
                textStyle: Theme.of(context).textTheme.displaySmall,
                fontSize: 16,
                fontWeight: FontWeight.w800,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            MyTextField(
                controller: nameController,
                hintText: 'Enter your name',
                obscureText: false,
                labelText: 'Name'),
            const SizedBox(
              height: 20,
            ),    
            MyTextField(
                controller: emailController,
                hintText: 'Enter your email',
                obscureText: false,
                labelText: 'Email'),
            const SizedBox(
              height: 20,
            ),    
            MyTextField(
                controller: passwordController,
                hintText: 'Enter your password',
                obscureText: true,
                labelText: 'password'),
            const SizedBox(
              height: 20,
            ),    
            MyTextField(
                controller: repasswordController,
                hintText: 'Enter your password again',
                obscureText: true,
                labelText: 'Re-password'),
            const SizedBox(
              height: 20,
            ),            

                MyButton(onTap:signupWithEmail, hinText: 'Sign Up'),
            const SizedBox(
              height: 20,
            ),    
            
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Have a member?',
                    style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.displayLarge,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (Context) => HomeScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Sign in',
                      style: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.displayLarge,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.italic,
                          color: Colors.blue),
                    ),
                  ),
                  
                ],
              ),
              Spacer(),
          ],
        ),
      ),
    );
  }
}
