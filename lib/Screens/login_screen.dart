import 'package:chatapp/Screens/chat_screen.dart';
import 'package:chatapp/components/my_button.dart';
import 'package:chatapp/components/my_text_field.dart';
import 'package:chatapp/services/auth/auth_service.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  final void Function()? onTap;
  const LoginScreen({super.key, this.onTap});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
   bool loadingIndicator = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signInDialog(String message){
    showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title: Text('login Succesful'),
        content: Text(message),
        actions: <Widget>[
          TextButton(onPressed: (){Navigator.pop(context);}, child: Text('OK'),),
        ],
      );
    });

  }

  void showErrorDialog(String error){
    showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title: Text('Error'),
        content: Text(error),
        actions: <Widget>[
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text('OK'))
        ],
      );
    });
  }


  Future<UserCredential?> signIn() async {
    if(loadingIndicator == true) {
      showDialog(context: context, builder: (BuildContext context) {
        return Center(child: CircularProgressIndicator());
      });
    }
    final authService = Provider.of<AuthService>(context, listen: false);
    try {
      final response = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);

      if (response != null) {
    await Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      }
      setState(() {
        loadingIndicator = false;
      });
      if(loadingIndicator == false){
        Navigator.pop(context);
        return null;
      }
      return response;
    } catch (e) {
      showErrorDialog(e.toString());
    }
    return null;
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
                  Icon(
                    Icons.message,
                    size: 100,
                  ),
                  Text('Welcome you have\' been missed'),
                  SizedBox(
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
                    child: MyButton(
                      buttonText: 'Sign In',
                      onTap: signIn,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Not a member?',
                        style: TextStyle(color: Colors.black54),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: Text(
                          'Register Now',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
