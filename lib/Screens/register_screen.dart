  import 'package:chatapp/Screens/login_screen.dart';
import 'package:chatapp/components/my_button.dart';
  import 'package:chatapp/components/my_text_field.dart';
  import 'package:chatapp/services/auth/auth_service.dart';
  import 'package:firebase_auth/firebase_auth.dart';
  import 'package:flutter/material.dart';
  import 'package:provider/provider.dart';

  class RegisterScreen extends StatefulWidget {
    final void Function()? onTap;
    const RegisterScreen({super.key, this.onTap});

    @override
    State<RegisterScreen> createState() => _RegisterScreenState();
  }

  class _RegisterScreenState extends State<RegisterScreen> {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmedPasswordController = TextEditingController();

    void signUp() async {
      if (passwordController.text != confirmedPasswordController.text) {

        showErrorDialog('Passwords do not match');
      }
      final authService = Provider.of<AuthService>(context, listen:false);
      try{
       await authService.signUpWithEmailAndPassword(emailController.text, passwordController.text);
       showRegisterDialog();
      }on FirebaseAuthException catch(e){
        showErrorDialog(e.code.toString());
      }
    }
    void showRegisterDialog(){
      showDialog(context: context, builder: (BuildContext context){
        return  AlertDialog(
          title: const Text('Account Created'),
          content: const Text('Account registered successfull'),
          actions: <Widget>[
            TextButton(onPressed: (){
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginScreen()));
            }, child: const Text('OK'))

          ],
        );
      });

    }
    void showErrorDialog(String errorMessage) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: Text(errorMessage),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );

        },
      );
    }

    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.message,
                      size: 100,
                    ),
                    const Text('Let\'s Create an account for you'),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MyTextField(
                          obscureText: false,
                          hintText: 'Enter your email',
                          controller: emailController),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MyTextField(
                          obscureText: true,
                          hintText: 'Enter your password',
                          controller: passwordController),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MyTextField(
                          obscureText: false,
                          hintText: 'Re-enter your password',
                          controller: confirmedPasswordController),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MyButton(
                        buttonText: 'Sign Up',
                        onTap: signUp,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Already a member?',
                          style: TextStyle(color: Colors.black54),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        GestureDetector(
                          onTap: widget.onTap,
                          child: const Text(
                            'Login Now',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
  }
