

import 'package:chatapp/Screens/register_screen.dart';
import 'package:chatapp/services/auth/auth_service.dart';
import 'package:chatapp/services/auth/login_or_register.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider(
    create: (context) => AuthService(),
    child: RunApp(),
  ),);

}

class RunApp extends StatelessWidget {
  const RunApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RegisterOrLogin(),
    );
  }
}

