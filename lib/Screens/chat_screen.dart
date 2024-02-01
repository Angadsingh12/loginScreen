import 'package:chatapp/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  void signOut(){
    final authService = Provider.of<AuthService>(context,listen: false);
    authService.signOut();
    Navigator.pop(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Center(child: Text('Hello you are logged in'),),),
      appBar:AppBar(
        actions: [IconButton(onPressed: signOut, icon: Icon(Icons.logout))],
      ),
    );
  }
}
