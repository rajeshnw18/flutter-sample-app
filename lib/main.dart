import 'package:flutter/material.dart';
import 'package:flutter_login_ui/screens/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shell',
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
