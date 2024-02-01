import 'package:chatapp/Screens/login_screen.dart';
import 'package:chatapp/Screens/register_screen.dart';
import 'package:flutter/material.dart';


class RegisterOrLogin extends StatefulWidget {
  const RegisterOrLogin({super.key});

  @override
  State<RegisterOrLogin> createState() => _RegisterOrLoginState();
}

class _RegisterOrLoginState extends State<RegisterOrLogin> {
  bool isLoginPage = true;
  void togglePages(){
    setState(() {
      isLoginPage = !isLoginPage;
    });
  }
  @override
  Widget build(BuildContext context) {
    if(isLoginPage)
      {
        return LoginScreen(onTap: togglePages);
      }
    else{
      return RegisterScreen(onTap: togglePages);
    }
  }
}
